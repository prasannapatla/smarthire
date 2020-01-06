
import './Admim_add_cat.scss';
import './jquery.datetimepicker.css'
import page from './Admim_add_catHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
// @ts-ignore
import 'jquery-datetimepicker'


var swal = require("sweetalert");

class Admim_add_cat extends Myservice {

  constructor(props: any) {
    super(props);
  }



  componentDidMount() {

    this.list_cat();
    this.list_exam();
    let context = this;

    $(".del_que_btn").on("click", function (this: any) {
      var ids: any = []
      $(".que_sel").each(function (this: any) {
        if ($(this).prop("checked"))
          ids.push($(this).val())
      });
      if (context.get_sess("type") == "cat")
        context.fetch_data("/server/remove_questions/", "POST", null, "ids=" + ids.join(",") + "&from=all");
      else
        context.fetch_data("/server/remove_questions/", "POST", null, "ids=" + ids.join(",") + "&from=sel_q");
      context.display_que(context.get_sess("val"), context.get_sess("type"))

    });


    $(".sel_all").click(function (this: any) {
      $('input:checkbox').each(function (this: any) {
        if ($(this).prop('checked'))
          $(this).prop('checked', false);
        else
          $(this).prop('checked', true);
      });
    });


    $("input").eq(0).focus()
    $("input[type='date").click(function (this: any) {
      $(this).focus()
    });
    $(document).ready(function () {
      $('#datetimepicker').datetimepicker({
        format: 'd/m/Y H:i',
        minDate: 0,
        //minTime: 0
      });
      $('#datetimepicker2').datetimepicker({
        format: 'd/m/Y H:i',
        minDate: 0
      });
    });
    
    // let context = this;
    $(".del_exam_btn").on("click", function (this: any) {
      var ids: any = []
      $(".exam_sel").each(function (this: any) {
        if ($(this).prop("checked"))
          ids.push($(this).val())
      });
      if(ids.length>0)
        context.fetch_data("/server/exam_del/", "POST", null, "ids=" + ids.join(","))
      else
        swal("Select at least one checkbox","","warning")
      context.list_exam();
    });

    $(".del_cat_btn").on("click", function () {

      var ids: any = []
      $(".cat_sel").each(function (this: any) {

        if ($(this).prop("checked"))
          ids.push($(this).val())
      });
      if(ids.length>0)
        context.fetch_data("/server/remove_cat/", "POST", null, "ids=" + ids.join(","));
      else
        swal("Select at least one checkbox","","warning")
      context.list_cat();
    });
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  back() {
    $(".sect").css({ "display": "block" })
    $(".res").css({ "display": "none" })
    $("button").css({ "display": "none" })
  }
  add = () => {
    let json_str = {
      cat: $("#cat_add").val()
    }
    let data = this.fetch_data("/server/addcat/", "POST", null, json_str);
    // alert(data)
    if (data == "Category added") {
      swal({
        title: data,
        icon: "success",
      });
      $("cat").val("");
      this.list_cat();
    }
    else {
      swal({
        title: data,
        icon: "error",
      });
    }
  }

  display_que(val: any, type: any) {
    let txt = ""
    txt += this.list_que(val, type)
    this.set_sess("cur_id", val)
    this.set_sess("cur_type", type)
    $(".q_list").html(txt)
    $(".q_from").html(this.get_sess("q_from"))
    $(".sect").css({ "display": "none" })
    $(".res").css({ "display": "block" })
    $("button").css({ "display": "inline", "margin-right": "20px" })
    $(".q_list").css({ "width": "100%" })
    $(".val td").css({ "max-width": "250px" })
    $("td div").css({ "display": "inline" })
    $("td").css({ "padding-left": "20px", "text-indent": "-20px" })
    $("table").css({ "border-spacing": "10px" })
  }


  rev_date(date: string) {
    return date.split("/").reverse().join("/")
  }

  add_exam = () => {
    let json_str = {
      e_name: $("#e_name").val(),
      s_date: $(".s_date").val(),
      e_date: $(".e_date").val()
    }
    let data = this.fetch_data("/server/addexam/", "POST", null, json_str);
    // alert(data)
    if (data == "success") {
      swal({
        title: data,
        icon: "success",
      });
      $("cat").val("");
      this.list_exam();
    }
    else {
      swal({
        title: data,
        icon: "error",
      });
    }

  }


  list_cat = () => {
    let context = this;
    let str = this.fetch_data("/server/getcat/", "POST");
    let json_obj = JSON.parse(str);
    let txt = "<tr>";
    txt += "<th>Availiable Categories</th>";
    txt += "<th></th>";
    txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>"
      txt += "<td><input type='checkbox'  value='" + json_obj[val1]["id"] + "' class='cat_sel' /></td>";
      txt += "<td>" + json_obj[val1]["cat"] + "</td>";
      txt += "<td><a class='cat_view' heading='" + json_obj[val1]["cat"] + "' val='" + json_obj[val1]["id"] + "'>Details</a></td>";
      
      txt += "</tr>"
    }
    $(".list_cat").html(txt)


   

    $("table .cat_view").on("click", function (this: any) {
      context.set_sess("type", "cat")
      context.set_sess("val", $(this).attr("val"))
      context.set_sess("q_from", $(this).attr("heading"))
      context.set_sess("type", "cat")
      context.display_que($(this).attr("val"), "cat")
    });
  };

  list_exam = () => {
    let str = this.fetch_data("/server/getexam/", "POST");
    let json_obj = JSON.parse(str);
    let txt = "<tr>";
    txt += "<th>Availiable Exams</th>";
    txt += "<th></th>";
    txt += "<th></th>";
    txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>"
      txt += "<td><input type='checkbox'  value='" + json_obj[val1]["id"] + "' class='exam_sel' /></td>";
      txt += "<td>" + json_obj[val1]["e_name"] + "</td>";
      txt += "<td><a class='exam_view' heading='" + json_obj[val1]["e_name"] + "' val='" + json_obj[val1]["id"] + "'>Details</a></td>";
      
      txt += "</tr>"
    }
    $(".list_exam").html(txt)

    let context = this;
    // $(".del_exam_btn").on("click", function (this: any) {
    //   var ids: any = []
    //   $(".exam_sel").each(function (this: any) {
    //     if ($(this).prop("checked"))
    //       ids.push($(this).val())
    //   });
    //   if(ids.length>0)
    //     context.fetch_data("/server/exam_del/", "POST", null, "ids=" + ids.join(","))
    //   else
    //     swal("Select at least one checkbox","","warning")
    //     alert(ids.length)
    //   context.list_exam();
    // });

    $("table .exam_view").on("click", function (this: any) {
      context.set_sess("type", "exam")
      context.set_sess("val", $(this).attr("val"))
      context.set_sess("q_from", $(this).attr("heading"))
      context.display_que($(this).attr("val"), "exam")
      context.set_sess("type", "exam")
    });

  };

  list_que = (id: any, type: any) => {
    let count = 1;
    let str = this.fetch_data("/server/get_questions/", "POST", null, "id=" + id + "&type=" + type);
    let json_obj = JSON.parse(str);
    let txt = "<tr>";
    txt += "<td colspan='4'></td><td>Delete</td></tr><tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      console.log(json_obj[val1]);
      txt += "<tr>"
      txt += "<td colspan='4' style='max-width:100%'><b>Q." + (count++) + " </b>" + json_obj[val1]["question"] + "</td>";
      txt += "<td><input type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel' /></td>"
      txt += "</tr>"
      txt += "<tr class='val'>"

      // if (json_obj[val1]["opt1"] == json_obj[val1]["ans"])
      //   txt += "<td><b>" + json_obj[val1]["opt1"] + "</b></td>";
      // else
      //   txt += "<td>" + json_obj[val1]["opt1"] + "</td>";

      // if (json_obj[val1]["opt2"] == json_obj[val1]["ans"])
      //   txt += "<td><b>" + json_obj[val1]["opt2"] + "</b></td>";
      // else
      //   txt += "<td>" + json_obj[val1]["opt2"] + "</td>";

      //   if (json_obj[val1]["opt3"] == json_obj[val1]["ans"])
      //     txt += "<td><b>" + json_obj[val1]["opt3"] + "</b></td>";
      //   else
      //     txt += "<td>" + json_obj[val1]["opt3"] + "</td>";

      //     if (json_obj[val1]["opt4"] == json_obj[val1]["ans"])
      //       txt += "<td><b>" + json_obj[val1]["opt4"] + "</b></td>";
      //     else
      //       txt += "<td>" + json_obj[val1]["opt4"] + "</td>";

      txt += "<td>A)" + json_obj[val1]["opt1"] + "</td>";
      txt += "<td>B)" + json_obj[val1]["opt2"] + "</td>";
      txt += "<td>C)" + json_obj[val1]["opt3"] + "</td>";
      txt += "<td>D)" + json_obj[val1]["opt4"] + "</td>";
      let ans = ""
      if (json_obj[val1]["opt1"] == json_obj[val1]["ans"])
        ans = "A)"
      else if (json_obj[val1]["opt2"] == json_obj[val1]["ans"])
        ans = "B)"
      else if (json_obj[val1]["opt3"] == json_obj[val1]["ans"])
        ans = "C)"
      else
        ans = "D)"
      txt += "</tr><tr><td>Category: " + json_obj[val1]["cat"] + "</td></tr>";
      txt += "<tr><td>Answer: " + ans + json_obj[val1]["ans"] + "</td></tr><tr></tr><tr></tr>";

    }
    return txt;
  };

  logout = () => {
    this.fetch_data("/server/del/", "POST");
    this.open_link("")
  }

  render() {
    return (
      page(this)
    )
  }
}

export default Admim_add_cat;
