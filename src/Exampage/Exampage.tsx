
import React from 'react';
import './Exampage.scss';
import page from './ExampageHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require('@sweetalert/with-react')
import emoji from '../assets/output-onlinepngtools.png'

class Exampage extends Myservice {

    constructor(props: any) {
        super(props);

    }

    sec: number = 0;
    timer1: any = null
    timeout: any;

    componentDidMount() {
        if (this.allow_user())
            return;

        let context = this;
        if (this.fetch_data("/server/exam_status/", "POST").match("closed")) {
            this.closeWin("Exam closed");
        }
        window.onbeforeunload = function () {
            context.save_ans();
            context.closeWin("Exam closed");
        };
        this.timeout = null;
        window.confirm = function (para = "!") {
            context.myalert(para)
            return true;
        }
        this.sec = 60000;
        document.addEventListener("contextmenu", event => event.preventDefault());
        document.addEventListener("keydown", event => event.preventDefault());
        this.load_que();
        super.componentDidMount();
    }



    componentDidUpdate() {
        super.componentDidUpdate();
    }

    timer = (dur = 3600) => {
        this.sec = dur
        this.timer1 = setInterval(() => {
            $("#timer").html(parseInt((this.sec / 60).toString(), 10).toFixed(0) + ":" + this.sec % 60);
            this.sec--;
            if (this.sec == 5) {
                this.save_ans();
            }
            if (this.sec == 0) {
                this.exam_end("Exam timeout!\n Your responses are saved");
            }

        }, 1000);
    }


    load_que = () => {
        let str = this.fetch_data("/server/que/", "POST")
        var context = this
        //alert(str)
        if (str.match("&end;")) {
            this.exam_end("Thank you. Your responses are saved!");
        }
        else
            if (str.match("&timeout;")) {
                this.closeWin("Timeout");
            }
            else if (str.match("&empty;")) {
                this.closeWin("No Questions alloted");
            }
            else if (str.match("&range;")) {
                this.closeWin("Exam has not yet started or the exam has been closed");
            }
            else {
                $(".save_btn").prop('disabled', true);
                let data = str.split("&sep;");
                // $("#opt1").attr("checked", "checked");
                $("input[type='radio']").each(function (this: any) {
                    console.log($(this).val())
                    $(this).prop('checked', false);
                });
                $(document).ready(function () {
                    $("#id").val(data[0]);
                    $("#cnt").text(data[data.length - 3] + "/" + data[data.length - 2]);
                    $("#Q").html(data[1]);
                    $("#opt1").val(data[2]);
                    $("#opt2").val(data[3]);
                    $("#opt3").val(data[4]);
                    $("#opt4").val(data[5]);
                    $(".opt1").text(data[2]);
                    $(".opt2").text(data[3]);
                    $(".opt3").text(data[4]);
                    $(".opt4").text(data[5]);
                    if (context.timer1 == null) {
                        context.timer(data[data.length - 1]);
                    }

                    $(".save_btn").prop('disabled', false);
                });
            }


    }

    save_ans = () => {
        // var str = "id="+$("#id").val()+"&"
        var sel = $("input[type='radio']:checked");

        var answer = "null"
        if (typeof sel.val() !== 'undefined')
            answer = sel.val();
        // $.ajax({
        //   type: "POST",
        //   url: "/server/ver/",
        //   data: {
        //     id:$("#id").val(),
        //     ans:answer
        //   },
        //   success: function(){

        //   },
        //   async:false
        // });

        let json_str = {
            id: $("#id").val(),
            ans: answer
        }
        $(".save_btn").prop('disabled', true);
        this.fetch_data("/server/ver/", "POST", null, json_str);
    }

    // go_full_screen=(elem)=>{
    //   if (elem.requestFullscreen) {
    //     elem.requestFullscreen();
    //   } else if (elem.msRequestFullscreen) {
    //     elem.msRequestFullscreen();
    //   } else if (elem.mozRequestFullScreen) {
    //     elem.mozRequestFullScreen();
    //   } else if (elem.webkitRequestFullscreen) {
    //     elem.webkitRequestFullscreen();
    //   }
    // }

    onPick(value: any) {
        swal("Thanks for your rating!", `You rated us ${value}/5`, "success")
            .then(() => {
                this.fetch_data("/server/feedback/", "POST", "feedback=" + value)
                this.del_sess("login_status")
                window.close();
                this.fetch_data("/server/exam_logout/", "POST")
                return
            });
    }



    MoodButton = ({ rating, onClick }: any) => {
        let inv_rating = 5 - rating + 1
        let scale = inv_rating * 60;
        if (inv_rating != 1)
            scale += 4 * inv_rating


        return (
            <button
                style={{ width: "60px", height: "60px", background: "url('" + emoji + "')", backgroundPosition: scale + 'px -130px', border: "none" }}
                data-rating={rating}
                className="mood-btn rate"
                onClick={() => onClick(rating)}
            //   {_this.openWin.bind(_this)}
            />

        )
    }



    closeWin = (msg: any) => {
        alert(msg)
        this.del_sess("login_status")
        window.close();
        this.fetch_data("/server/exam_logout/", "POST")
        return
    }
    exam_end(msg: any) {
        swal({
            text: "\nHow was your experience?",
            buttons: {
                cancel: "Close",
            },
            content: (

                <div>
                    <this.MoodButton
                        rating={1}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={2}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={3}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={4}
                        onClick={this.onPick.bind(this)}
                    />
                    <this.MoodButton
                        rating={5}
                        onClick={this.onPick.bind(this)}
                    />
                </div>
            )

        })
            .then(() => {
                window.close();
                this.fetch_data("/server/exam_logout/", "POST")
                return
            });


    }
    myalert(txt: any) {
        swal({
            title: "Warning!",
            text: txt,
            icon: "warning",
            dangerMode: true,
        });
        // $(".msg").html(text)
        // if (this.timeout != null)
        //     clearTimeout(this.timeout);
        // $('#myalert_box').fadeIn(100);
        // this.timeout = setTimeout(() => {
        //     $('#myalert_box').fadeOut('slow');
        //     clearTimeout(this.timeout);
        // }, 5000);
    }

    next_que() {
        this.save_ans();
        this.load_que();
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Exampage;
