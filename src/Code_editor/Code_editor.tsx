import './Code_editor.scss'
// import '../edit_area/edit_area_full'
// import './editor_settings'
import page from './Code_editorHtml'
import Myservice from '../Myservice/Myservice'
import { bool } from 'prop-types';
var $ = require("jquery");
var swal = require("sweetalert");

class Code_editor extends Myservice {

    c: number = 0;
    constructor(props: any) {
        super(props);

    }
    loaded = 0;
    load_sucess = false
    sec_inc = 0;
    time_out: any = null
    sec: number = 0;
    timer1: any = null
    blur: boolean = false;

    componentDidMount() {
        if (this.allow_user())
            return;

        this.c = 0;
        window.confirm = function (para = "!") {
            context.myalert(para)
            return true;
        }

        $(".Code_editor").css({ display: "none" })
        if (this.fetch_data("/server/code_exam_status/", "POST").match("closed")) {
            swal("Exam closed")
                .then(() => {
                    window.close();
                    return
                })
        }

        let context = this;
        this.loaded = 0
        this.time_out = setInterval(() => context.set_syntax_lang("python"), 1000)

        window.confirm = function (para = "!") {
            context.myalert(para)
            return true;
        }


        $(window).blur(function () {
            // alert( $('iframe').is(":focus"))
            console.log("code  blur", blur)
            if (context.blur)
                context.close_win()
        });

        $("#pgm_lang").change(function () {
            context.hightlight_syntax();
        });
        this.on_elem_load("id", "frame_code", this.after_load.bind(this))


        // document.addEventListener("contextmenu", event => event.preventDefault());
        // document.addEventListener("keydown", event => event.preventDefault());


        this.set_sess("login_status", "logged in")
        this.go_full_screen(window.document);
        this.toTop();
        window.addEventListener('resize', () => {
            console.log("resize")
            context.toTop()
        });
        window.addEventListener("visibilitychange", () => {
            console.log("visibilitychange")
            if (window.document.visibilityState == 'hidden') {
                if (this.c >= 0 && this.c <= 3 && context.get_sess("login_status") != null)
                    swal(4 - this.c + " Warning! \nIf you try to minimize or resize the window,Your exam will be closed", "", "warning")
                if (window.screenX <= 0 || window.screenY <= 0)
                    context.close_win();
            }
        });
        let n = 0;

        window.onbeforeunload = function () {
            context.submit_code();
        };

        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    after_load() {
        this.load_sucess = true;
        let context = this
        let iframe = $('iframe')
        iframe.mouseover(function () {
            context.blur = false
            console.log("frame  blur", blur)
        });
        iframe.mouseout(function () {
            context.blur = true
            console.log("frame  blur", blur)
        });
        this.get_que();
    }


    componentWillMount() {
        let script = document.createElement("script");
        script.src = "edit_area/edit_area_full.js";
        script.async = false;
        script.onload = () => this.scriptLoaded();
        document.body.appendChild(script);
    }

    scriptLoaded(): any {
        let context = this
        this.loaded++;
        if (this.loaded == 1) {
            let script = document.createElement("script");
            script.src = "./editor_settings.js";
            script.async = false;
            script.onload = () => this.scriptLoaded();
            document.body.appendChild(script);
        }
        if (this.loaded == 2) {
            var interval2 = setInterval(
                () => {
                    context.sec_inc++;
                    console.log("checking..." + context.sec_inc)
                    if (context.sec_inc > 1 && !context.load_sucess) {
                        console.log(context.load_sucess)
                        window.location.reload();

                    }
                    if (context.sec_inc > 1) {
                        clearInterval(interval2)
                    }
                }
                , 1000)
        }
        console.log("loded" + this.loaded)
    }



    set_syntax_lang(lang: any): any {
        if (this.loaded >= 2) {
            console.log("loded" + this.loaded, this.time_out)
            // window.set_syntax(lang)
            if (this.time_out != null) {
                clearInterval(this.time_out);
                this.time_out = null
            }
        }
    }

    hightlight_syntax() {
        switch ($('#pgm_lang :selected').text().trim().toLowerCase()) {
            case 'c': this.set_syntax_lang("c");
                break;
            case 'c++': this.set_syntax_lang("CPP");
                break;
            case 'java': this.set_syntax_lang("JAVA");
                break;
            case 'python3':
            case 'python2': this.set_syntax_lang("python");
                break;
            case 'javascript': this.set_syntax_lang("js");
                break;
            default: this.set_syntax_lang($('#pgm_lang :selected').text().trim().toLowerCase());
        }
    }

    run_code() {
        $("body").css({ cursor: "wait" })
        $(".loading").css({ visibility: "visible" })
        // this.hightlight_syntax();
        let json_str =
        {
            cmd: $("#pgm_lang option:selected").val(),
            code: window.get_text("code"),
            inputs: $("#inputs").val(),
            arg: "test1 test2"
        }
        console.log(json_str)
        let out = this.fetch_data("/server/test_code/", "POST", null, json_str, true, this.callback)
    }

    callback(out: any) {
        let json_obj = null
        try {

            json_obj = JSON.parse(out)
        } catch (error) {
            return
        }
        $("#output").val(json_obj["user"] + "\n" + json_obj["output"])
        $(".testcase").text(json_obj["score"] + " testcase are passed")
        if (json_obj["score"] == 5)
            $(".testcase").css({ color: "green" })
        else if (json_obj["score"] > 0)
            $(".testcase").css({ color: "yellow" })
        else
            $(".testcase").css({ color: "red" })
        $(".loading").css({ visibility: "hidden" })
        $("body").css({ cursor: "auto" })
    }

    get_que() {
        $("body").css({ cursor: "wait" })

        let questions = this.fetch_data("/server/get_code_que/", "POST");
        console.log("--------que", questions)
        $("body").css({ cursor: "auto" })
        if (questions == "&end;") {
            swal("Exam finished", "", "info")
                .then(() => {
                    window.close();
                    return
                })
        }
        else if (questions == "&close;") {
            $(".Code_editor").css({ display: "none" })
            swal("Exam has been closed", "", "info")
                .then(() => {
                    window.close();
                    return
                })
        }
        else if (questions == "&start;") {
            $(".Code_editor").css({ display: "none" })
            swal("Exam has not yet started", "", "info")
                .then(() => {
                    window.close();
                    return
                })
        }
        else if (questions == "&range;") {
            $(".Code_editor").css({ display: "none" })
            swal("Exam has not yet started or the exam has been closed")
                .then(() => {
                    window.close();
                    return
                })
        }
        else
            $(".Code_editor").css({ display: "block" })

        let question_arr = questions.split("&sep;")
        $(".recv_que").text(question_arr[0])
        let io = `<br /><br />
            <table>
                <tbody>
                    <tr><td colspan=2>Example:</td></tr>
                    <tr>
                        <td>
                            Input:
                        </td>
                        <td>
                            <pre>`+ question_arr[1] + `</pre>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Output:
                        </td>
                        <td>
                        <pre>`+ question_arr[2] + `</pre>
                        </td>
                    </tr>
                    </tr>
                </tbody>
            </table>
        `
        $(".recv_que").append(io)
        $(".recv_que table tr").find("td").css({ "vertical-align": "top" })
        $(".recv_que table tr").find("pre").css({ "vertical-align": "middle" })
        $(".inputs").val(question_arr[1])
        if (this.timer1 == null) {
            this.timer(question_arr[3]);
        }
    }


    timer = (dur = 3600) => {
        this.sec = dur
        this.timer1 = setInterval(() => {
            $("#timer").html(parseInt((this.sec / 60).toString(), 10).toFixed(0) + ":" + this.sec % 60);
            this.sec--;
            if (this.sec == 5) {
                this.del_sess("login_status")
                window.close();
                this.fetch_data("/server/code_exam_logout/", "POST")
                return
            }
            if (this.sec == 0) {
                this.closeWin("Exam timeout!\n Your responses are saved");
            }

        }, 1000);
    }
    closeWin = (msg: any) => {
        alert(msg)
        this.del_sess("login_status")
        window.close();
        this.fetch_data("/server/code_exam_logout/", "POST")
        return
    }

    submit_code() {
        this.fetch_data("/server/submit_code/", "POST");
        try {
            window.setval("code", "")
        } catch (error) {

        }
        this.get_que();
        $('html, body').animate({
            scrollTop: 0
        }, {
            duration: 200
        })
    }

    myalert(txt: any) {
        swal({
            title: "Warning!",
            text: txt,
            icon: "warning",
            dangerMode: true,
        });

    }

    toTop() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight)
        window.focus();
    }

    close_win = (): any => {
        console.log("close", this.c)
        if (this.c >= 3) {
            console.log("close", this.c)
            window.close();
            return
        }

        this.c++;
        if (this.c > 0) {
            window.confirm("If you try to minimize or resize the window,Your exam will be closed")
            this.fetch_data("/server/count_malpractices/", "POST");
        }
        this.toTop()

    }

    go_full_screen = (elem: any) => {
        //var elem = document.documentElement;
        if (elem.requestFullscreen) {
            elem.requestFullscreen();
        } else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullscreen) {
            elem.webkitRequestFullscreen();
        }
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Code_editor;
