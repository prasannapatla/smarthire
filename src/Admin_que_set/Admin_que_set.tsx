
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
    this.get_cat();
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  get_cat = () => {
    var cat_str = this.fetch_data("/server/getcat/", "POST");
    let json_obj = JSON.parse(cat_str)
    let val1: any, val2: any
    let txt = "<tr><th>Category</th><th>Number of questions</th></tr>"
    for (val1 in json_obj) {
      txt += "<tr id='cat" + json_obj[val1]["id"] + "'>"
      // txt += "<td><input type='checkbox' class='checkbox' value='" + json_obj[val1]["id"] + "' /> &nbsp;&nbsp;" + json_obj[val1]["cat"] + "  </td>";
      // txt += "<td><input type='number' id='total' value='20' /> / " + json_obj[val1]["available"] + "</td>"
      txt += "<td><div class='check'><label class='round'><input type='checkbox' id='checkbox' value='" + json_obj[val1]["id"] + "' /><span class='checkmark'></span><span class='stem'></span></label></div><div class='checked'>" + json_obj[val1]["cat"] + "  </div></td>";
      txt += "<td><input type='number' id='total' value='20' /> / " + json_obj[val1]["available"] + "</td>"
      txt += "</tr>"
    }
    $("#category").html(txt)
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


  create_question_set = () => {
    var context = this
    $(document).ready(function () {
      var myjson = ""
      var json_arr = Array()

      if ($('#dur').val() <= 0) {
        swal("Given duration is incorrect","","warning")
        return
      }


      if ($("input[type='checkbox']:checked").length == 0) {
        swal("Select atleast one category before submitting.","","warning")
        return false;
      }

      var sel2 = $('#exam option:selected').val();
      if ($("#exam").prop('selectedIndex') == 0) {
        swal(sel2 + " before submitting.","","warning")
        return false;
      }

      let next=true

      $("input[type='checkbox']").each(function (this: any) {
        if ($(this).prop('checked')) {
          var row = $("#cat" + $(this).val());
          var total = (row.find("#total")).val();
          row.find("#total").css({border:"solid silver 1px"})
          if(total<0){           
            row.find("#total").css({border:"solid red 1px"})
            next=false
          }
          var cat = $(this).val()
          myjson = '{'
          myjson += '"total":"' + total + '",'
          myjson += '"cat":"' + cat + '"'
          myjson += '}'
          json_arr.push(myjson)
        }
      });

      if(!next){
        swal("Incorrect value","","error")
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
          }).then((result:any) => {
            if (result.value)
            context.show_msg(context.fetch_data("/server/addset/", "POST", null, json_str));
          })          

      }
      else
      context.show_msg(context.fetch_data("/server/addset/", "POST", null, json_str));

    });
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
