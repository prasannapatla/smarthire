
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
        if (this.allow_admin())
            return;
        this.list_que();

        let context = this
        $(".del_que_btn").on("click", function (this: any) {
            var ids: any = []
            $(".que_sel").each(function (this: any) {
                if ($(this).prop("checked"))
                    ids.push($(this).val())
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
        let count=1
        for (val1 in json_obj) {

            txt += "<h4>"+(count++)+". &nbsp;<b><input style=' vertical-align: top' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel' /> Problem statement</b></h4><pre>" + json_obj[val1]["pbm_stmt"] + "</pre>";
            txt += "<h4><b>Language:</b>" + json_obj[val1]["lang"] + "</h4><pre class='pre_tag'>" + json_obj[val1]["code"].replace(/[&]/g, "&amp;").replace(/[<]/g, "&lt;").replace(/[>]/g, "&gt;") + "</pre>";
            txt += "<table><tbody><tr>"
            txt += "<th>Example input</th><th>Test input1</th><th>Test input2</th><th>Test input3</th><th>Test input4</th></tr><tr>"
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1]["example_input"] + "</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1]["test_input1"] + "</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1]["test_input2"] + "</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1]["test_input3"] + "</td>";
            txt += "<td style='maxWidth: 100px;overflowWrap:break-word;'>" + json_obj[val1]["test_input4"] + "</td>";
            // txt += "<td><input style=' vertical-align: middle' type='checkbox' value='" + json_obj[val1]["id"] + "' class='que_sel' /></td>"
            txt += "</tr></tbody></table><br /><br />"
        }
        txt += "</tbody>"
        $(".list_que").html(txt)
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
