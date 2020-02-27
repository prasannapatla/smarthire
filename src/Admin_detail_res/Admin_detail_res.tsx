
import './Admin_detail_res.scss';
import page from './Admin_detail_resHtml'
import Myservice from '../Myservice/Myservice'
import { array } from 'prop-types';
var jsonQuery = require('json-query')
var $ = require("jquery");
var swal = require("sweetalert");
var Chart = require('chart.js');
import html2canvas from "html2canvas"

class Admin_detail_res extends Myservice {
  params: any = []
  my_json2: any
  constructor(props: any) {
    super(props);
    try {
      this.params = this.get_params(props)

    } catch (error) {
      console.error(error)
    }
    let my_json_val = [
      {

      }
    ]


    this.state = {
      orig_json: my_json_val,
      pi_json: my_json_val,
      bar_json: my_json_val,
    }


  }

  get_params(props: any) {
    let params = []
    let search = props.location.search.substring(1).split("&");
    for (let val1 in search)
      params.push(search[val1].split("=")[1])
    return params
  }

  componentDidMount() {
    if (typeof this.params[0] === 'undefined')
      $(".sect").css({ 'display': 'block' })
    if (this.allow_admin())
      return;
    if (this.params[1] != null) {
      this.view_user_det(this.params[1], "exam");
    }
    else if (this.params[0] != null) {
      this.view_user_det(this.params[0], "user");
      if (this.params[1] == null)
        this.load_res(this.params[0]);
    }
    this.myfilter();
    $(document).ready(function () {
      //@ts-ignore
      html2canvas(document.querySelector(".content")).then(canvas => {
        $("#screenshot").eq(0).html(canvas)
        var download = $("#download")[0];
        var image = $("#screenshot canvas")[0].toDataURL("image/png")
          .replace("image/png", "image/octet-stream");
        download.setAttribute("href", image);
      });
    })
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }
  load_res = (id: any = "all", param = "group=all") => {

    let str = this.fetch_data("/server/view_det_res/", "POST", null, "id=" + id + "&" + param);
    if (str.match("syntax error")) {
      $("#result").html(
        "<tbody><br /><span className='error' style={{color:'red',padding:'15px',margin:'10px',fontSize: '30px'}}'>Syntax error!</span><br />&nbsp</tbody>");
    }
    let grap_json = Object.create(null)
    try {
      let strict = ""
      if ($(".strict").prop("checked"))
        strict = "strict=gyes"
      else
        strict = "strict=gno"
      grap_json = JSON.parse(this.fetch_data("/server/view_graph/", "POST", null, "id=" + id + "&where=g" + $(".where").val() + "&" + strict));
      if (Object.keys(grap_json).length == 0)
        throw "No output"
      $(".pichart").css({ display: "block" })
      $(".chart").css({ display: "inline" })
      // this.setState({my_json:  JSON.parse(grap_str)})
      console.log(JSON.stringify(grap_json))
      this.setState({ orig_json: grap_json });
      let pi_grap_str: any = []
      let colors = ["red", "blue", "yellow", "orange", "purple", "violet", "green", "brown"]
      let i = 0;
      for (let row in grap_json) {
        // var randomColor = "#000000".replace(/0/g,function(){return (~~(Math.random()*16)).toString(16);});
        // let myjson={
        //   title:grap_json[row].category,
        //   value:Number(grap_json[row].correct),
        //   color:colors[i++]
        // }
        let myjson = [grap_json[row].category, Number(grap_json[row].duration)]
        pi_grap_str.push(myjson);
      }
      let bar_grap_str: any = []
      for (let row in grap_json) {
        // var randomColor = "#000000".replace(/0/g,function(){return (~~(Math.random()*16)).toString(16);});
        let my_arr = [grap_json[row].category, Number(grap_json[row].correct), Number(grap_json[row].wrong)]
        bar_grap_str.push(my_arr);
      }
      if (!param.match("group=all")) {
        this.setState({ pi_json: pi_grap_str });
        this.setState({ bar_json: bar_grap_str });
      }
      console.log(pi_grap_str)
      let lab: string[] = Array()
      let correct: number[] = Array()
      let wrong: number[] = Array()
      for (let val in bar_grap_str) {
        lab.push(bar_grap_str[val][0])
        correct.push(bar_grap_str[val][1])
        wrong.push(bar_grap_str[val][2])
      }

      let chart_colors = ["#311b92", "#ef5350", "#ab47bc", "#26c6da", "#ffa726", "#d4e157", "#bdbdbd", "#26a69a", "#01579b", "#1de9b6", "#66bb6a", "#ff8f00", "#bdbdbd"]
      let req_color = chart_colors.slice(0, correct.length)

      //Line chart
      var ctx = $('#myChart');
      var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: lab,

          datasets: [{
            label: 'Passed',
            data: correct,
            fill: false,
            backgroundColor: "blue",
            borderColor: "Green",

          }, {
            label: 'Failed',
            data: wrong,
            fill: false,
            backgroundColor: "pink",
            borderColor: "Red",

          }]
        },
        options: {
          responsive: true,
          legend: {
            position: 'top',
          },
          animation: {
            animateScale: true,
            animateRotate: true
          },
          scales: {
            yAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'value',
              },
              stacked: false
            }]
          }
        }

      });





      //Pi chart
      var ctx = $('#PiChart');
      var myLineChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: lab,
          datasets: [{
            label: 'Correct',
            data: correct,
            fill: false,
            backgroundColor: req_color,
            borderColor: "white",
            borderWidth: 2

          }]
        },
        options: {
          responsive: true,
          legend: {
            position: 'top',
          },
          animation: {
            animateScale: true,
            animateRotate: true
          },
          scales: {
            yAxes: [{
              scaleLabel: {
                display: true,
                labelString: 'value',
              },
              stacked: false
            }]
          }
        }

      });






      this.forceUpdate()
    } catch (error) {
      console.log(error)
      $(".pichart").css({ display: "none" })
      $(".chart").css({ display: "none" })
    }

    let count = 1;
    // swal(JSON.stringify(
    //   jsonQuery("[*Result=Correct].Category", {
    //     data:  JSON.parse(str)
    //   }).value
    // ))
    let json_obj = JSON.parse(str);
    let txt = "<tbody>";
    // txt = "<tr >";
    // for (var val in json_obj[0]) {
    //   if (val == "Questions")
    //     continue;
    //   txt += "<th>" + val + "</th>";
    // }
    // txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>";
      for (val2 in json_obj[val1]) {
        if (val2 == "Questions")
          txt += "</tr><tr><td colspan='4' style='overflow-wrap:break-word;border:none;'><b>Q." + (count++) + " </b>" + json_obj[val1][val2] + "</td></tr><tr>";
        else if (val2 == "Correct Answer")
          txt += "</tr><tr><td colSpan={2} style='overflow-wrap:break-word;border:none;'><b>Correct Answer: </b>" + json_obj[val1][val2] + "</td><td colspan='2';style='overflow-wrap:break-word;border:none;'><b>Submitted Answer: </b>" + json_obj[val1]["Submitted Answer"] + "</td></tr><tr>";
        else if (val2 == "Submitted Answer")
          continue;
        else if (val2 == "Result")
          if (json_obj[val1][val2] == "Correct")
            txt += "<td style='overflow-wrap:break-word;border:none;'><b>" + val2 + ": </b><span style='color:green'>" + json_obj[val1][val2] + "</span></td>";
          else
            txt += "<td style='overflow-wrap:break-word;border:none;'><b>" + val2 + ": </b><span style='color:red'>" + json_obj[val1][val2] + "</span></td>";
        else
          txt += "<td style='overflow-wrap:break-word;border:none;'><b>" + val2 + ": </b>" + json_obj[val1][val2] + "</td>";
        try {
          if (typeof json_obj[val1]["User ID"] !== "undefined") {
            txt += "<input type='hidden' value='" + json_obj[val1]["User ID"] + "' />";
            $("table .del_btns").css({ "display": "table-row" })
          }
        } catch (e) { }
      }
      txt += "</tr><tr ><td style='padding-bottom:10px;border:none;'></td></tr></tbody>";
    }
    $("#result").html(txt)
    this.view_user_code_res(id)
  }

  view_user_det(id: any = null, type: any = null) {
    if (id == null)
      return "No details found"
    let str = ""
    if (type == "user")
      str = this.fetch_data("/server/view_res_user/", "POST", null, "id=" + id);
    else
      str = this.fetch_data("/server/view_cat_res/", "POST", null, "eid=" + id);
    if (str.match("syntax error")) {
      $("#result").html(
        "<br /><span className='error' style='color:red;padding:15px;margin:10px;font-size: 30px;'>Syntax error!</span><br />&nbsp");
    }
    let json_obj = JSON.parse(str);
    let txt = "<tbody><tr>";
    for (var val in json_obj[0]) {
      txt += "<th>" + val + "</th>";
    }
    txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>";
      for (val2 in json_obj[val1])
        txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1][val2] + "</td>";
      txt += "</tr></tbody>";
    }
    $(".user_det").html(txt)
  }

  view_user_code_res(id: any) {
    if (id == null)
      return "No details found"
    let str = this.fetch_data("/server/view_code_res/", "POST", null, "id=" + id);
    if (str.match("syntax error") || str.match("[]")) {
      $("#code_result").html(
        "<br /><span className='error' style='color:red;padding:15px;margin:10px;font-size: 30px;'>Syntax error!</span><br />&nbsp");
    }
    let json_obj = JSON.parse(str);
    let txt = "<tbody><tr>";
    for (var val in json_obj[0]) {
      txt += "<th>" + val + "</th>";
    }
    txt += "</tr>";
    let val1: any, val2: any;
    for (val1 in json_obj) {
      txt += "<tr>";
      for (val2 in json_obj[val1])
        if (val2 == "User code")
          txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'><pre>" + json_obj[val1][val2] + "</pre></td>";
        else if (val2 == "Duration(Mins)")
          txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + Math.floor(json_obj[val1][val2] / 60)+"Min "+json_obj[val1][val2]%60 + "Secs</td>";
        else
          txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1][val2] + "</td>";
      txt += "</tr></tbody>";
    }
    $("#code_result").html(txt)
  }


  txt: any = [];
  timeout: any = null;
  myfilter() {
    let context = this;
    context.txt = [];
    if (typeof this.params[1] !== 'undefined' && context.params[1] != null) {
      $(".where").val("exid=" + context.params[1])
      $(".group").val("ema id");
    }
    context.txt.push("where=g" + $(".where").val());
    context.txt.push("group=g" + $(".group").val());
    context.txt.push("having=g" + $(".having").val());
    context.txt.push("agg=g" + $('.agg :selected').val());
    context.txt.push("order=g" + $(".order").val());
    if ($(".strict").prop("checked")) context.txt.push("strict=gyes");
    else context.txt.push("strict=gno");
    //alert("group="+this.txt)
    $("table .del_btns").css({ "display": "none" })
    if (this.timeout != null) clearTimeout(this.timeout);
    this.timeout = setTimeout(function () {
      console.log(context.txt.join("&"))
      if (typeof context.params[0] !== 'undefined')
        context.load_res(context.params[0], context.txt.join("&"));
      else
        context.load_res("all", context.txt.join("&"));
    }, 800);
  };

  del_user = (cases: any) => {
    var ids: any = []
    $("input[type=hidden]").each(function (this: any) {
      if (ids.indexOf($(this).val()) == -1)
        ids.push($(this).val())
    });
    if (cases == 1)
      alert(this.fetch_data("/server/remove_user/", "POST", null, "ids=" + ids + "&all=" + "false"));
    else
      alert(this.fetch_data("/server/remove_user/", "POST", null, "ids=" + ids + "&all=" + "true"));
    this.load_res(this.params[0]);
    $(":input[type='text'").val("")

  }

  print_page() {
    window.print();
  }

  render() {
    return (
      page(this)
    )
  }

  test(e: any, data: any, index: any) {
    console.log(e, data, index)
  }

}

export default Admin_detail_res;
