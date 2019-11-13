
import './Admin.scss';
import page from './AdminHtml'
import Myservice from '../Myservice/Myservice'
import React from 'react';
import ReactDOM from 'react-dom';
import Login from '../Login/Login';
import { Route, withRouter } from 'react-router-dom';

var $ = require("jquery");
var swal = require("sweetalert");

class Admin extends Myservice {

  constructor(props: any) {
    super(props);

  }

  componentDidMount() {
    if (this.allow_admin())
      return;
    // this.myinit();
    this.load_cat();
    $("textarea").eq(0).focus()
    $("input[type='checkbox']").click(function (this: any) {
      if ($(this).prop("checked"))
        $("#formated_quetions").css({ "display": "block" })
      else
        $("#formated_quetions").css({ "display": "none" })
    });

    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }



  render() {
    return (
      page(this)
    )
  }


  load_cat() {
    var cat_str = this.fetch_data("/server/getcat/", "POST");
    let json_obj = JSON.parse(cat_str)
    let val1: any, val2: any
    let txt = "<option>Select a category</option>"
    for (val1 in json_obj) {
      txt += "<option  value=\"" + json_obj[val1]["id"] + "\">"
      txt += json_obj[val1]["cat"] + "</option>"
    }
    $("#cat").html(txt)
  }

  add = () => {
    var context = this;
    $(document).ready(function (this: any) {

      if ($("textarea").val().trim() == "") {
        swal("Enter the questions." ,"","warning")
        return false;
      }

      let opt = Array()
      let opt_val = Array()
      $("input[type='text").each(function (this: any) {
        if ($(this).val().trim() == "")
          opt.push(($(this).attr("placeholder")))
        opt_val.push(($(this).val()).trim())
      });
      for (let i = 0; i < opt_val.length; i++)
        for (let j = 0; j < opt_val.length; j++) {
          if (i != j && opt_val[i] != "" && opt_val[j] != "" && opt_val[i] == opt_val[j]) {
            swal("", "Duplicate values exists: " + $("input[type='text").eq(i).attr("placeholder") + "-" + $("input[type='text").eq(j).attr("placeholder"), "error")
            return false;
          }
        }

      if (opt.length != 0) {
        swal("Enter the value for these: " + opt.join(","),"","warning")
        return false;
      }

      var sel = $("input[type='radio']:checked");
      if (typeof sel.val() === "undefined") {
        swal("select an option before submitting.", "","warning")
        return false;
      }


      var sel2 = $('#cat :selected').val();
      if ($("#cat").prop('selectedIndex') == 0) {
        swal(sel2 + " before submitting.","","warning")
        return false;
      }

      var formated_text;
      if ($('#para').prop('checked'))
        formated_text = $("#formated_quetions").val()
      else
        formated_text = "nothing"

      let json_str = {
        quetions: $("textarea").val(),
        opt1: $("#ans1").val(),
        opt2: $("#ans2").val(),
        opt3: $("#ans3").val(),
        opt4: $("#ans4").val(),
        ans: $("#" + sel.val()).val(),
        cat: sel2,
        formated_para: formated_text
      }

      let data = context.fetch_data("/server/addque/", "POST", null, json_str);

      if (data == "success") {
        swal(data, "", "success")
        $("input[type='text']").each(function (this: any) {
          $("textarea").val("");
          $(this).val("");
          $("input[type='radio']").each(function (this: any) {
            $(this).prop('checked', false);
          });
        });
      }
    });
  }

  temp_interval: any = null
  bulk_upload() {
    var sel2 = $('#cat :selected').val();
    if ($("#cat").prop('selectedIndex') == 0) {
      swal(sel2 + " before submitting.","","warning").then(() => {
        $("#cat").focus()
      })
      return false;
    }
    try {
      this.myfileinit("/server/bulk_que/",
        {
          cat: sel2
        },
        this.callback,
        this
      );
      var file = $(".upload_file")[0].files[0];
      new this.Upload(file).doUpload();
      this.temp_interval = setInterval(
        () => {
          $(".progress").html("<pre>" + this.fetch_data("/server/get_temp_update/", "POST") + "</pre>");
        }
        , 1000)
    }
    catch (err) {
      swal(err, "Upload failed","error")
    }
  }
  callback(data: any, context: any) {
    clearInterval(context.temp_interval)
    $(".progress").html("<pre>" + data + "</pre>")
    swal("Uploaded", "","success")
  }


  logout = () => {
    this.fetch_data("/server/del/", "POST");
    this.open_link("")
  }
}

export default Admin;
