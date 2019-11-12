
import './Add_code.scss';
import page from './Add_codeHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Add_code extends Myservice {

    _timeout: any = null

    constructor(props: any) {
        super(props);
    }

    componentDidMount() {
        if (this.allow_admin())
            return;
        let context = this
        $(".sample_input textarea").keyup(function (this: any) {
            if (context._timeout != null)
                clearTimeout(context._timeout)
            context._timeout = setTimeout(() => {
                $("body *").css({ cursor: "wait" })
                if ($.trim($("#code").val()) == "" && $("#lang").val() == "")
                    return
                let json_str = {
                    code: $.trim($("#code").val()),
                    cmd: $("#lang").val(),
                    inputs: $(this).val()
                }
                context.fetch_data("/server/get_expected_output/", "POST", null, json_str, true, context.callback, this);
            }, 2000);
        });
        $(".sample_input textarea").focusout(function (this: any) {
            $("body *").css({ cursor: "wait" })
            if ($.trim($("#code").val()) == "" && $("#lang").val() == "")
                return
            let json_str = {
                code: $.trim($("#code").val()),
                cmd: $("#lang").val(),
                inputs: $(this).val()
            }
            context.fetch_data("/server/get_expected_output/", "POST", null, json_str, true, context.callback, this);
        });

        super.componentDidMount();
    }
    callback(data: any, _this: any) {
        $(".exp_op" + $(_this).attr('id').split("_")[2]).text(data)
        $("body *").css({ cursor: "auto" })
    }



    temp_interval: any = null
    bulk_upload() {
        var sel2 = $('#lang2 :selected').val();
        if ($("#lang2").prop('selectedIndex') == 0) {
            swal(sel2 + " before submitting.").then(() => {
                $("#lang2").focus()
            })
            return false;
        }
        try {
            $("body *").css({ cursor: "wait" })
            this.myfileinit("/server/bulk_code_que/",
                {
                    lang: sel2
                },
                this.callback2,
                this
            );

            this.temp_interval = setInterval(
                () => {
                    $(".progress").html("<pre>" + this.fetch_data("/server/get_temp_update/", "POST") + "</pre>");
                }
                , 500)
            
            var file = $(".upload_file")[0].files[0];
            new this.Upload(file).doUpload();
        }
        catch (err) {
            swal(err, "Upload failed:")
        }
    }
    callback2(data: any, context: any) {
        clearInterval(context.temp_interval)
        $(".progress").html("<pre>" + data + "</pre>")
        $("body *").css({ cursor: "auto" })
        swal("Uploaded", "")
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }



    render() {
        return (
            page(this)
        )
    }


    add_code = () => {
        var context = this;
        $(document).ready(function (this: any) {
            let json_str = {
                pblm_stmt: $.trim($("#pblm_stmt").val()),
                code: $.trim($("#code").val()),
                sample_input: $.trim($("#spl_inp").val()),
                t_inp_1: $.trim($("#t_inp_1").val()),
                t_inp_2: $.trim($("#t_inp_2").val()),
                t_inp_3: $.trim($("#t_inp_3").val()),
                t_inp_4: $.trim($("#t_inp_4").val()),
                exp_out_1: $.trim($(".exp_op1").text()),
                exp_out_2: $.trim($(".exp_op2").text()),
                exp_out_3: $.trim($(".exp_op3").text()),
                exp_out_4: $.trim($(".exp_op4").text()),
                lang: $("#lang").val()
            }
            let data = context.fetch_data("/server/addcode/", "POST", null, json_str);
            if (data == "success")
                swal(data, "", "success")
            else
                swal(data, "", "error")
    
            $("textarea").each(function (this: any) {
                $(this).val("")
            });
            $("tr").each(function (this: any) {
                $(this).find("td").eq(1).find("pre").text("Expected output")
            });
        });
    }



    logout = () => {
        this.fetch_data("/server/del/", "POST");
        this.open_link("")
    }
}

export default Add_code;
