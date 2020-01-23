
import './Admin_view_result.scss';
import page from './Admin_view_resultHtml'
import Myservice from '../Myservice/Myservice'
import { string } from 'prop-types';
import exam from '../assets/exam.jpg'
import date from '../assets/date.jpg'
import clock from '../assets/clock.jpg'
import totalTime from '../assets/totaltime.jpg'
//import jsPDF from 'jspdf'
declare const require: any;
const jsPDF = require('jspdf');
require('jspdf-autotable');
var $ = require("jquery");
var swal = require("sweetalert");

class Admin_view_result extends Myservice {

  constructor(props: any) {
    super(props);
  }
  state = {
    images: {
      Exam: exam,
      "Total Marks": exam,
      Date:date,
      "Total Time(Mins)":totalTime      
    }
  }
  componentDidMount() {
    if (this.allow_admin())
      return;
    if (window.location.href.match(/(http:\/\/127.0.0.1|(http:\/\/localhost))/gi))
      $(".del_user_btn").css({ "display": "block" })
    this.get_exam("exam");
    var context = this

    $(document).ready(function () {
      $("#myInput").on("keyup", function (this: any) {
        var value = $(this).val().toLowerCase();
        $("#result tr").filter(function (this: any) {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });
      $(".intake").on("keyup", function (this: any) {
        context.load_res($('.exam :selected').val())
      });
      $(".intake").on("change", function (this: any) {
        context.load_res($('.exam :selected').val())
      });

      $(".exam").change(function (this: any) {
        if ($('.exam :selected').val() == "all") {
          $(".user_det").html("")
        }
        else {
          context.view_user_det($('.exam :selected').val(), null);
        }
        context.load_res($('.exam :selected').val());
      });

    });


    $("select").eq(0).focus()
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  load_res = (eid: any = null) => {
    let str = ""
    if (eid != null)
      str = this.fetch_data("/server/view_res/", "POST", "exam=" + eid + "&max=" + $(".intake").val())
    else
      str = this.fetch_data("/server/view_res/", "POST", "max=" + $(".intake").val())
    let json_obj
    try {

      json_obj = JSON.parse(str)
    } catch (error) {
      return
    }
    //alert(str+"\n"+json_obj[0])
    let txt = "<thead><tr><th  class='no_display'>Delete User Details</th><th>Id</th><th>Email</th><th>Total Duration(Mins)</th><th>Score</th><th>Coding score</th><th>Feedback</th><th  class='no_display'>View Details</th></tr></thead><tbody>"
    let val1: any, val2: any
    for (val1 in json_obj) {
      let dur: any = 0;
      if (json_obj[val1]["Total Duration"] != "None")
        dur = Math.floor(json_obj[val1]["Total Duration"] / 60) + "Min " + json_obj[val1]["Total Duration"] % 60 + " Secs"
      txt += "<tr>"
      txt += "<td  class='no_display' style={{text-align:'center'}} val='" + json_obj[val1]["ID"] + "'><label class='container1' style='margin-left:30px'><input type='checkbox' className='del_user' name='del' value='" + json_obj[val1]["ID"] + "' /><span class='checkmark'></span></label></td>"
      txt += "<td >" + json_obj[val1]["ID"] + "</td>"
      txt += "<td >" + json_obj[val1]["Username"] + "</td>"
      txt += "<td >" + dur + "</td>"
      if (json_obj[val1]["Score"] != -1)
        txt += "<td >" + json_obj[val1]["Score"] + "</td>"
      else
        txt += "<td>NA</td>"
      if (json_obj[val1]["Score2"] != -1)
        txt += "<td >" + json_obj[val1]["Score2"] + "</td>"
      else
        txt += "<td>NA</td>"

      txt += "<td >" + json_obj[val1]["Feedback"] + "/5</td>"
      if (json_obj[val1]["Score"] != -1 || json_obj[val1]["Score2"] != -1)
        txt += "<td  class='no_display' className='lnk' val='" + json_obj[val1]["ID"] + "'><u><a>View Detail</a></u></td>"
      else
        txt += "<td  class='no_display'>No Details</td>"
      txt += "</tr></tbody>"
    }

    $("#result").html(txt)
    var context = this

    $(".result tbody").find("tr").each(function (this: any) {
      $(this).find("td").eq(6).on("click", function (this: any) {
        if ($(this).text().match("View Detail"))
          window.open("#admin_detail_res/?id=" + $(this).attr("val"))
      });
    });

    let del_user = $(".result tbody").find("tr");
    $(".del_user_btn_complete").on("click", function (this: any) {
      var ids: any = []
      del_user.each(function (this: any) {
        // alert( $(this).find("td").eq(0).html())
        let checkbox = $(this).find("td").eq(0).find("label").find("input")
        if (checkbox.prop("checked"))
          ids.push(checkbox.val())
      });
      if (ids.length == 0)
        return
      context.fetch_data("/server/remove_user/", "POST", "ids=" + ids.join(",") + "&all=" + "true");
      context.load_res($('.exam :selected').val());
    });

    $(".del_user_btn").on("click", function (this: any) {
      var ids: any = []
      del_user.each(function (this: any) {
        let checkbox = $(this).find("td").eq(7).find("input")
        if (checkbox.prop("checked"))
          ids.push(checkbox.val())
      });

      if (ids.length == 0)
        return
      context.fetch_data("/server/remove_user/", "POST", "ids=" + ids.join(",") + "&all=" + "false");
      context.load_res($('.exam :selected').val());
    });
    $(".delete").css({ "visibility": "hidden" })
    $("input[type='checkbox']").click(function () {
      $(".delete").css({ "visibility": "hidden" })
      $("input[type='checkbox']").each(function (this: any) {
        if ($(this).prop("checked"))
          $(".delete").css({ "visibility": "visible" })
      });
    });

  }

  open_all = () => {
    this.open_link("#check_res_det/?id=all")
  }

  get_exam = (id: any) => {
    var cat_str = this.fetch_data("/server/getexam/", "POST");
    let json_obj
    try {
      json_obj = JSON.parse(cat_str)
    } catch (error) {
      return
    }
    let val1: any, val2: any
    let txt = ""
    // txt = "<option value=\"all\">All</option>"
    for (val1 in json_obj) {
      txt += "<option  value=\"" + json_obj[val1]["id"] + "\">"
      txt += json_obj[val1]["e_name"] + "</option>"
    }
    $("#exam").html(txt)
    $("select option:eq(0)").attr("selected", "selected");
    this.view_user_det($('.exam :selected').val(), null);
    this.load_res($('.exam :selected').val());
  }





  view_user_det = (id: any = null, type: any = null) => {
    if (id == null)
      return "No details found"
    let str = ""
    if (type == "user")
      str = this.fetch_data("/server/view_res_user/", "POST", "id=" + id);
    else
      str = this.fetch_data("/server/view_cat_res/", "POST", "eid=" + id);
    if (str.match("syntax error")) {
      $("#result").html(
        "<br /><span className='error' style={{color:'red',padding:'15px',margin:'10px',fontSize: '30px'}}'>Syntax error!</span><br />&nbsp");
    }
    let json_obj = JSON.parse(str);
    let txt = "";
    // let txt = "<tr>";
    // for (var val in json_obj[0]) {
    //   txt += "<th>" + val + "</th>";
    // }
    // txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>";
      // for (val2 in json_obj[val1]){
      //   alert(val2)
      //   txt += "<td style='max-width: 100px;overflow-wrap: break-word'>" + json_obj[val1][val2] + "</td>";
      // }
      for (val2 in json_obj[val1])
        txt += "<td style='max-width: 100px;'><div class='Exam_info'><img src='"+this.state.images[val2]+"' class='image'/><div class='exam_info_text'><b>" + json_obj[val1][val2] + "</b><br/>" + val2 + "</div></div></td>";

      txt += "</tr>";
    }
    $(".user_det").html(txt)




  };

  print = () => {
    var pdf = new jsPDF('l', 'pt', 'a4'),
      htmlsource1 = $('#lets_see')[0],
      specialElementHandlers = {
        '#bypassme': function (element: any, renderer: any) {
          return true
        }
      },
      margins = {
        top: 80,
        bottom: 10,
        left: 50,
        width: 200
      };
    pdf.fromHTML(
      htmlsource1, // HTML string or DOM elem ref.
      margins.left, // x coord
      margins.top, { // y coord
      'width': margins.width, // max width of content on PDF
      'elementHandlers': specialElementHandlers
    },
      function (dispose: any) {

        pdf.save("pdf_name.pdf");
      }, margins);

  };

  _print(this: any, sel: string) {
    this.print_div(sel)
  }

  print_div(selecter: string) {
    // let w = window.open();
    // if(w!=null){
    //   w.document.write("<html><body>"+$(selecter).html()+"</html></body>");
    //   w.print();
    //   // w.close();
    // }
    // var printContents = $(selecter).html();
    // var originalContents =  $("#root").html();
    // console.log(originalContents)
    // $("#root").html(printContents);
    // window.print();
    // $("#root").html(originalContents);
    $("input").hide()
    window.print()
    $("input").show()
  }

  download_excel() {
    window.open("./details.xls")
  }



  render() {
    return (
      page(this)
    )
  }
}

export default Admin_view_result;
