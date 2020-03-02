
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
    $(document).ready(function () {

      var btn = $('#button');

      $(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
          $("#button").css({ "opacity": "1" })
        } else {
          $("#button").css({ "opacity": "0" })
        }
      });

      btn.on('click', function (e: any) {
        e.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, '100');
      });

    });

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
      var count = 0;
      $(".que_sel").each(function (this: any) {
        count = $(".que_sel:checked").length
        if ($(this).prop("checked"))
          ids.push($(this).val())
        if (count == 1) {
          swal("Deleted " + count + " question", "", "success")
        } else {
          swal("Deleted " + count + " questions", "", "success")
        }
      });

      context.fetch_data("/server/remove_questions/", "POST", null, "ids=" + ids.join(",") + "&from=all");
      var sel = $('#cat :selected').val();
      if (sel.match("Select a category"))
        context.list_que("all")
      else
        context.list_que(sel)
    });

    $(".sel_all").click(function (this: any) {
      $(".delete").hide()
      $('input:checkbox').each(function (this: any) {
        if ($(this).prop('checked'))
          $(this).prop('checked', false);
        else
          $(this).prop('checked', true);
        if ($(this).prop("checked"))
          $(".delete").show()
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
      txt += "<td colspan='4' class='que_ind' style='max-width:100%;text-indent:-20px;'><div><b>Q." + (count++) + " </b></div><div>" + json_obj[val1]["question"] + "</div></td>";
      txt += "<td style='width:50px'><label class='container1'><input style=' vertical-align: middle' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel full' /><span class='checkmark'></span></label></td>"
      txt += "</tr>"
      txt += "<tr class='val'>"
      txt += "<td class='options'>A. " + json_obj[val1]["opt1"] + "</td>";
      txt += "<td class='options'>B. " + json_obj[val1]["opt2"] + "</td>";
      txt += "<td class='options'>C. " + json_obj[val1]["opt3"] + "</td>";
      txt += "<td class='options'>D. " + json_obj[val1]["opt4"] + "</td>";
      let ans = ""
      if (json_obj[val1]["opt1"] == json_obj[val1]["ans"])
        ans = "A. "
      else if (json_obj[val1]["opt2"] == json_obj[val1]["ans"])
        ans = "B. "
      else if (json_obj[val1]["opt3"] == json_obj[val1]["ans"])
        ans = "C. "
      else
        ans = "D. "
      txt += "</tr><tr><td colspan='4'><b>Ans </b>: " + ans + json_obj[val1]["ans"] + "</td></tr>";
      txt += "<tr><td colspan='4'><b>Category </b>: " + json_obj[val1]["cat"] + "</td></tr><tr></tr><tr></tr>";

    }
    $(".list_que").html(txt)
    $(".val td").css({ "max-width": "250px" })
    $("td div").css({ "display": "inline", " margin-left": "15px" })
    $("td").css({ "padding-left": "20px" })
    $(".que_ind pre").css({ "padding-left": "20px" })
    $(".options").css({ "color": "grey", "width": "200px" })

    $(".delete").hide()
    $("input[type='checkbox']").click(function () {
      $(".delete").hide()
      $("input[type='checkbox']").each(function (this: any) {
        if ($(this).prop("checked"))
          $(".delete").show()
      });
    });

    // $(".sel_all").click(function (this: any) {
    //   $('input:checkbox').each(function (this: any) {
    //     console.log($(this).prop('checked'))
    //     if ($(this).prop('checked'))
    //       $(this).prop('checked', false);
    //     else
    //       $(this).prop('checked', true);
    //   });
    //   $(".delete").css({ "visibility": "hidden" })
    //   $("input[type='checkbox']").each(function (this: any) {
    //     if ($(this).prop("checked"))
    //       $(".delete").css({ "visibility": "visible" })
    //   });
    // });

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
