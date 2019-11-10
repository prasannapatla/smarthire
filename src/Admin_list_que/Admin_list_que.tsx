
import './Admin_list_que.scss';
import page from './Admin_list_queHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Admin_list_que extends Myservice {

  constructor(props: any) {
    super(props);
  }

  componentDidMount() {
    if (this.allow_admin())
      return;
    this.load_cat();
    this.list_que("all")
    let context = this;
    $("#cat").on("change", function (this: any) {
      var sel = $('#cat :selected').val();
      if (sel.match("Select a category"))
        context.list_que("all")
      else
        context.list_que(sel)
    });
    $(".del_que_btn").on("click", function (this: any) {
      var ids: any = []
      $(".que_sel").each(function (this: any) {
        if ($(this).prop("checked"))
          ids.push($(this).val())
      });

      context.fetch_data("/server/remove_questions/", "POST", null, "ids=" + ids.join(",") + "&from=all");
      var sel = $('#cat :selected').val();
      if (sel.match("Select a category"))
        context.list_que("all")
      else
        context.list_que(sel)
    });

    $(".sel_all").click(function (this: any) {
      $('input:checkbox').each(function (this: any) {
        if ($(this).prop('checked'))
          $(this).prop('checked', false);
        else
          $(this).prop('checked', true);
      });
    });


    $("select").eq(0).focus()
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
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


  list_que = (id: any) => {
    let count = 1;
    let str = this.fetch_data("/server/get_questions/", "POST", null, "id=" + id);
    let json_obj = JSON.parse(str);
    let txt = "";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      console.log(json_obj[val1]);
      txt += "<tr>"
      txt += "<td colspan='4' class='que_ind' style='max-width:100%;text-indent:-20px;'><b>Q." + (count++) + " </b>" + json_obj[val1]["question"] + "</td>";
      txt += "<td><input style=' vertical-align: middle' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel' /></td>"
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
    $(".list_que").html(txt)
    $(".val td").css({ "max-width": "250px" })
    $("td div").css({ "display": "inline" })
    $("td").css({ "padding-left": "20px"})
    $(".que_ind pre").css({ "padding-left": "20px"})
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

export default Admin_list_que;
