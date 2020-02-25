
import './Admin_que_set.scss';
import page from './Admin_que_setHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");
var swal2 = require("sweetalert2");

class Admin_que_set extends Myservice {

  constructor(props: any) {
    super(props);
  }

  componentDidMount() {
    if (this.allow_admin())
      return;
    this.get_exam("exam");
    this.get_exam("exam1");
    this.get_cat();
    // $("#exam").change(function (this: any) {
    //   $('#exam1 option[value="' + $('#exam option:selected').val() + '"]').prop('selected', true)
    // });
    // $("#exam1").change(function (this: any) {
    //   $('#exam option[value="' + $('#exam1 option:selected').val() + '"]').prop('selected', true)
    // });
    super.componentDidMount();

  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  get_cat = () => {
    var cat_str = this.fetch_data("/server/getcat/", "POST");
    let json_obj = JSON.parse(cat_str)
    let val1: any, val2: any
    let txt = "<tr><th style='font-size:16px'>Category</th><th style='font-size:16px'>Number of questions</th></tr><tr><td>&nbsp;</td></tr>"
    for (val1 in json_obj) {
      txt += "<tr id='cat" + json_obj[val1]["id"] + "'>"
      txt += "<td style='width': '35%'><div class='check'><label class='container1'><input type='checkbox' class='full' id='checkbox' value='" + json_obj[val1]["id"] + "' /><span class='checkmark'></span></label></div><div class='checked'>" + json_obj[val1]["cat"] + "  </div></td>";
      txt += "<td class='inputEnterNum'><input type='number' class='entryNumber' id='total' value='20' /> / " + json_obj[val1]["available"] + "</td>"
      txt += "</tr>"
    }
    $("#category").html(txt)
  }

  get_exam = (id: any) => {
    var cat_str = this.fetch_data("/server/getexam/", "POST");
    let json_obj = JSON.parse(cat_str)
    let val1: any, val2: any
    let txt = "<option class='ex_op'>Select exam</option>"
    for (val1 in json_obj) {
      txt += "<option class='ex_op' value=\"" + json_obj[val1]["id"] + "\">"
      txt += json_obj[val1]["e_name"] + "</option>"
    }
    $("#" + id).html(txt)
    let ctx = this
    $("#" + id).change(function (this: any) {
      var remaining = JSON.parse(ctx.fetch_data("/server/rem_exam_dur/", "POST", null, "exam=" + $(this).children("option:selected").val()))
      if (id == 'exam')
        $(".remaining").text((remaining.remaining / 60).toFixed(0) + " Mins.")
      else
        $(".remaining1").text((remaining.remaining / 60).toFixed(0) + " Mins.")
    });
  }


  create_question_set = () => {
    var context = this
    $(document).ready(function () {
      var myjson = ""
      var json_arr = Array()

      if ($('#dur').val() <= 0) {
        swal("Given duration is incorrect", "", "warning")
        return
      }


      if ($("input[type='checkbox']:checked").length == 0) {
        swal("Select atleast one category before submitting.", "", "warning")
        return false;
      }

      var sel2 = $('#exam option:selected').val();
      if ($("#exam").prop('selectedIndex') == 0) {
        swal(sel2 + " before submitting.", "", "warning")
        return false;
      }

      let next = true

      $("input[type='checkbox']").each(function (this: any) {
        if ($(this).prop('checked')) {
          var row = $("#cat" + $(this).val());
          var total = (row.find("#total")).val();
          row.find("#total").css({ border: "solid silver 1px" })
          if (total < 0) {
            row.find("#total").css({ border: "solid red 1px" })
            next = false
          }
          var cat = $(this).val()
          myjson = '{'
          myjson += '"total":"' + total + '",'
          myjson += '"cat":"' + cat + '"'
          myjson += '}'
          json_arr.push(myjson)
        }
      });

      if (!next) {
        swal("Incorrect value", "", "error")
        return
      }


      myjson = "[" + json_arr.join(",") + "]"

      let json_str =
      {
        data: myjson,
        exam: sel2,
        dur: $('#dur').val(),
        total_score: $('#total_score').val()
      }
      if (context.fetch_data("/server/get_select_que_count/", "POST", null, "exam_id=" + sel2) != 0) {
        swal2.fire({
          title: 'Do you want to re-populate the exam?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, populate'
        }).then((result: any) => {
          if (result.value) {
            context.show_msg(context.fetch_data("/server/addset/", "POST", null, json_str));
            $(".remaining").text("")
            context.get_exam("exam");
          }

        })

      }
      else {
        context.show_msg(context.fetch_data("/server/addset/", "POST", null, json_str));
        $(".remaining").text("")
        context.get_exam("exam");
      }

    });


  }
  create_que_set() {
    let exam_id = $('#exam1 option:selected').val();
    if ($("#exam1").prop('selectedIndex') == 0) {
      swal(exam_id + " before submitting.", "", "warning")
      return false;
    }
    if ($('#code_dur').val() <= 0) {
      swal("Given duration is incorrect", "", "warning")
      return
    }
    if ($('#total').val() < 0) {
      swal("Value for number of questions is wrong", "", "warning")
      return
    }
    let dur = $('#code_dur').val()
    let total = $('#total').val()
    // this.show_msg(this.fetch_data("/server/add_code_que_set/", "POST", "exam="+exam_id+"&dur="+dur+"&total="+total, null));
    //sweet alert top right
    let status = this.fetch_data("/server/add_code_que_set/", "POST", "exam=" + exam_id + "&dur=" + dur + "&total=" + total, null).split("&sep;")
    this.notify(status[1], status[0])
    $(".remaining").text("")
    this.get_exam("exam1");
  }




  exam_del = () => {
    this.fetch_data("/server/exam_del/", "POST", null, "id=" + $('#cur_exam option:selected').val());
    this.get_exam("cur_exam");
    this.get_exam("exam");
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

export default Admin_que_set;
