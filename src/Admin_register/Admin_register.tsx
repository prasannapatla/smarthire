
import './Admin_register.scss';
import page from './Admin_registerHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Admin_register extends Myservice {
  file: any;

  constructor(props: any) {
    super(props);
  }

  componentDidMount() {
    const realFileBtn = document.getElementById("real-file");
    const customBtn = document.getElementById("custom-button");
    const customTxt = document.getElementById("custom-text");

    //@ts-ignore
    customBtn.addEventListener("click", function () {
      //@ts-ignore
      realFileBtn.click();
    });

    //@ts-ignore
    realFileBtn.addEventListener("change", function () {
      //@ts-ignore
      if (realFileBtn.value) {
        //@ts-ignore
        customTxt.innerHTML = realFileBtn.value.match(
          /[\/\\]([\w\d\s\.\-\(\)]+)$/
        )[1];
      } else {
        //@ts-ignore
        customTxt.innerHTML = "No file chosen, yet.";
      }
    });
    if (this.allow_admin())
      return;

    this.get_exam("cur_exam");
    this.get_exam("cur_exam2");
    // if (window.location.href.match(/(http:\/\/127.0.0.1|(http:\/\/localhost))/gi))
    this.get_sse();
    let context = this;
    this.timeout = setTimeout(() => {
      context.get_email_status(15000)
    }, 1000);

    $("#cur_exam").change(function (this: any) {
      $('#cur_exam2 option[value="' + $('.cur_exam option:selected').val() + '"]').prop('selected', true)
    });

    $(".cur_exam2").change(function () {
      context.get_email_status(15000);
    });

    $("input").eq(0).focus()
  }

  temp_interval: any = null
  bulk_upload() {
    var cur_exam = $('.cur_exam option:selected').val();
    if ($(".cur_exam").prop('selectedIndex') == 0) {
      swal(cur_exam + " before submitting.", "", "warning")
      return false;
    }
    try {
      this.myfileinit("/server/bulk_reg/",
        {
          exam: $(".cur_exam").val()
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
      swal(err, "Upload failed", "error")
    }
  }
  callback(data: any, context: any) {
    clearInterval(context.temp_interval)
    $(".progress").html("<pre style='width: 50%'>" + data + "</pre>")
    swal("Uploaded", "", "success")
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  get_exam = (id: any) => {
    var cat_str = this.fetch_data("/server/getexam/", "POST");
    let json_obj = JSON.parse(cat_str)
    let val1: any, val2: any
    let txt = "<option>Select exam</option>"
    for (val1 in json_obj) {
      txt += "<option  value=\"" + json_obj[val1]["id"] + "\">"
      txt += json_obj[val1]["e_name"] + "</option>"
    }
    $("#" + id).html(txt)
  }


  register_user() {

    if ($(".remail").val().trim() == "" || $(".rname").val() == "") {
      swal("Fill all necessary field", "", "warning")
      return false
    }
    if ($(".mob").val() == "") {
      swal("Incorrect details", "", "warning").then(
        (v: any) => {
          $(".mob").focus()
        }
      )
      return false
    }

    var cur_exam = $('.cur_exam option:selected').val();
    if ($(".cur_exam").prop('selectedIndex') == 0) {
      swal(cur_exam + " before submitting.", "", "warning")
      return false;
    }

    let json_str = {
      email: $(".remail").val(),
      name: $(".rname").val(),
      exam: cur_exam,
      mob: $(".mob").val()
    }

    this.show_msg(this.fetch_data("/server/signup/", "POST", null, json_str), this.on_reg, this)
  }

  async on_reg(_this: any, status: any, v?: any) {
    if (status.match("success")) {
      $("input[type='text']").val("");
      $("input[type='number']").val("");
      $("input").eq(0).focus();
      await _this.fetch_data("/server/email_status_in_db/", "POST")
      _this.retrive_email_status();
    }
  }


  send_password = () => {


    var cur_exam = $('.cur_exam2 option:selected').val();
    if ($(".cur_exam2").prop('selectedIndex') == 0) {
      swal(cur_exam + " before submitting.", "", "warning")
      return;
    }

    let json_obj = JSON.parse(this.fetch_data("/server/email_status_in_db/", "POST", null, "&exam=" + cur_exam))
    let json_obj2 = JSON.parse(this.fetch_data("/server/view_res/", "POST", null, "exam=" + cur_exam + "&max=0"))
    let failed = 0
    try {
      failed = Number(json_obj.length)
    } catch (error) {

    }
    let not_sent = ""
    if (failed == 1)
      not_sent = failed + " Email is not sent!"
    if (failed > 1)
      not_sent = failed + " Emails are not sent!"
    if (Number(json_obj2.length) != failed) {
      swal(not_sent, {
        title: "Resend credentials?",
        buttons: {
          cancel: "Cancel",
          all: {
            text: "All",
            value: "all",
          },
          failed: {
            text: "Unsent",
            value: "failed",
          }
        },
      })
        .then((value: any) => {
          switch (value) {
            case "all":
              this.fetch_data("/server/send_cred/", "POST", "all=true&exam=" + cur_exam, null, true, this.email_sent);
              break;
            case "failed":
              this.fetch_data("/server/send_cred/", "POST", "exam=" + cur_exam, null, true, this.email_sent);
              break;
            default:
              return
          }
        });

    }
    else {
      swal("Sending Email. Please Wait.", "", "info")
      this.fetch_data("/server/send_cred/", "POST", "exam=" + cur_exam, null, true, this.email_sent);
    }
    // this.fetch_data("/server/send_cred/", "POST", null, "exam=" + cur_exam, null, true);
    // alert("Sending Email. Please Wait.")
    this.get_sse();
  }

  email_sent(res: any) {
    swal({
      title: "Email sent",
      icon: "success",
    });
    $('#cur_exam2').trigger('change');
  }

  get_sse = () => {
    if (typeof (EventSource) !== "undefined") {
      var source = new EventSource("/server/sent_cred/");
      source.onmessage = function (e) {
        $(".server_side_resp").text(e.data);
      };
    } else {
      $(".server_side_resp").text("Your browser not support SSE");
    }
  }

  timeout: any = null
  json_obj: any

  get_email_status(sec: any) {
    let context = this


    if (this.timeout != null)
      clearTimeout(this.timeout)

    this.retrive_email_status()

    $("#refresh_status").stop();
    $("#refresh_status").css({ width: "0%" })
    $("#refresh_status").animate({ width: "100%" }, sec, "linear");
    this.timeout = setTimeout(() => {
      context.get_email_status(sec)
    }, sec + (1000 / sec * 100) + 100);
  }

  retrive_email_status() {
    var cur_exam = $('.cur_exam2 option:selected').val();
    if ($(".cur_exam2").prop('selectedIndex') != 0)
      try {
        this.json_obj = JSON.parse(this.fetch_data("/server/email_status_in_db/", "POST", "exam=" + cur_exam))
        $("#email_status").html("")
        for (let val in this.json_obj) {
          $("#email_status").append(this.json_obj[val].email + "<br />")
        }
      } catch (error) {
      }
  }

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

export default Admin_register;
