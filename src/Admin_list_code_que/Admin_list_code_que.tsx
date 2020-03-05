
import './Admin_list_code_que.scss';
import page from './Admin_list_code_queHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Admin_list_code_que extends Myservice {

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
        this.list_que();

        let context = this
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
            context.fetch_data("/server/remove_code_questions/", "POST", null, "ids=" + ids.join(","));
            context.list_que();
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

    list_que() {
        let str = this.fetch_data("/server/list_code_questions/", "POST");
        console.log(str)
        if (str.match("syntax error") || str.match("[]")) {
            $("#code_result").html(
                "<br /><span className='error' style='color:red;padding:15px;margin:10px;font-size: 30px;'>Syntax error!</span><br />&nbsp");
        }
        let json_obj = JSON.parse(str);
        let txt = "";
        let val1: any, val2: any;
        let count = 1
        for (val1 in json_obj) {

            txt += "<h4><b><label class='container1'><input style=' vertical-align: top' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel full' /><span class='checkmark'></span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Q" + (count++) + ".Problem statement</b></h4><pre style='font-size:14px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["pbm_stmt"] + "</pre>";
            txt += "<h4><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Language:</b>" + json_obj[val1]["lang"] + "</h4><pre class='pre_tag'>" + json_obj[val1]["code"].replace(/[&]/g, "&amp;").replace(/[<]/g, "&lt;").replace(/[>]/g, "&gt;") + "</pre>";
            txt += "<table><tbody><tr>"
            txt += "<th style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example input&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><th style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test input1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><th style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test input2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><th style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test input3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><th style='font-size:16px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test input4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th></tr><tr>"
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["example_input"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["test_input1"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["test_input2"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["test_input3"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json_obj[val1]["test_input4"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            // txt += "<td><input style=' vertical-align: middle' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel' /></td>"
            txt += "</tr></tbody></table><br /><br />"
        }
        txt += "</tbody>"
        $(".list_que").html(txt)

        $(".delete").hide()
        $("input[type='checkbox']").click(function () {
            $(".delete").hide()
            $("input[type='checkbox']").each(function (this: any) {
                if ($(this).prop("checked"))
                    $(".delete").show()
            });
        });
    }


    componentDidUpdate() {
        super.componentDidUpdate();
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Admin_list_code_que;
