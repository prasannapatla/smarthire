import React from 'react';
import './Examstart.scss';
import page from './ExamstartHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require('@sweetalert/with-react')
import emoji from '../assets/output-onlinepngtools.png'

class Examstart extends Myservice {
  myWindow: any = null;
  c: number = 0;
  timeout: any = null
  constructor(props: any) {
    super(props);

  }

  componentDidMount() {
    if (this.allow_user())
      return;

    this.c = 0;
    document.addEventListener("contextmenu", event => event.preventDefault());
    var context = this
    window.onbeforeunload = function () {
      context.fetch_data("/server/del/", "POST");
    }
    this.available_exam();
    this.timeout = setInterval(() => {
      context.available_exam()
    }, 2000);
    this.disable_btns();
    window.onbeforeunload = function () {
      if (context.timeout != null)
        clearInterval(context.timeout)
    };
    super.componentDidMount();
  }


  available_exam() {
    let json_resp = null
    try {
      json_resp = JSON.parse(this.fetch_data("/server/all_exam_status/", "POST"))
    } catch (error) {
      return
    }
    // alert(Number(json_resp[0].status_code))
    $(".mcq_dur").text(json_resp[0]["duration"])
    $(".code_dur").text(json_resp[0]["code_duration"])
    $(".mcq_total").text(json_resp[0]["total_mcq_que"])
    $(".code_total").text(json_resp[0]["total_code_que"])
    $(".start_date").text(json_resp[0]["start_date"])
    $(".end_date").text(json_resp[0]["end_date"])
    if (Number(json_resp[0].status_code) == 2) {
      $(".mcq").hide()
      $(".coding").css({ width: "100%", float: "unset" })
    }
    if (Number(json_resp[0].status_code) == 1) {
      $(".coding").hide()
      $(".mcq").css({ width: "100%", float: "unset" })
    }
    if (Number(json_resp[0].status_code) == 3) {
      $(".coding").hide()
      $(".mcq,#title,#logout").hide()
      let text = `
      <br /><br />
          <h1>Thank you for your participation</h1><br />
          <h4>Results will be shared by the HR Team</h4>             
      `
      $(".instr").html(text)
      return false
    }
  }


  componentDidUpdate() {
    super.componentDidUpdate();
  }

  openWin = (page: string) => {
    this.c = 0;
    var context = this;
    //this.myWindow = window.open("/exampage", "guru", "'fullscreen=yes, scrollbars=auto,menubar=no,toolbar=no,titlebar=no'"); 
    //this.myWindow = window.open("/exampage", "_blank ");   // Opens a new window
    this.myWindow = window.open("#" + page, "_blank", "fullscreen=yes, scrollbars=1");
    this.set_sess("login_status", "logged in")
    // // this.go_full_screen(this.myWindow.document.documentElement);
    document.addEventListener("contextmenu", event => event.preventDefault());
    document.addEventListener("keydown", event => event.preventDefault());
    this.go_full_screen(this.myWindow.document);
    this.toTop();
    this.go_full_screen(this.myWindow.document);

    this.myWindow.addEventListener('resize', () => {
      context.toTop();
    });
    this.myWindow.addEventListener("blur", () => context.close_win());
    this.myWindow.addEventListener("visibilitychange", () => {
      if (this.myWindow.document.visibilityState == 'hidden') {
        // if (this.c > 0 && this.c < 3 && context.get_sess("login_status") != null)
        //   swal(4 - this.c + " Warning! \nIf you try to minimize or resize the window,Your exam will be closed", "", "warning")
        if (context.myWindow.screenX <= 0 || context.myWindow.screenY <= 0)
          context.close_win();
      }
    });
    let n = 0;

    this.disable_btns();
  }


  openWin2 = () => {
    let context = this
    this.myWindow = window.open("#code_editor", "_blank", "fullscreen=yes, scrollbars=1");
  }

  // redirect() {
  //   this.router.navigate([' ']);
  // }

  toTop() {
    // this.myWindow.moveTo(0, 0);
    // this.myWindow.resizeTo(screen.availWidth, screen.availHeight)
    // this.myWindow.focus();
  }

  close_win = (): any => {
    if (this.c > 1) {
      this.myWindow.close();
      this.available_exam();
      return
    }

    this.c++;
    if (this.c > 0) {
      this.myWindow.confirm("If you try to minimize or resize the window,Your exam will be closed")
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

  disable_btns() {
    if (this.fetch_data("/server/exam_status/", "POST").match("closed")) {
      $(".mcq").find("button").css({ cursor: "not-allowed" })
      $(".mcq").find("button").prop('disabled', true);
    }
  }

  onPick(value: any) {
    let context = this
    swal("Thanks for your rating!", `You rated us ${value}/5`, "success")
      .then(() => {
        this.fetch_data("/server/feedback/", "POST", "feedback=" + value)
        context.signout()
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

  user_signout() {
    let context = this
    let json_resp = JSON.parse(this.fetch_data("/server/all_exam_status/", "POST"))

    if (Number(json_resp[0].status_code) == 3) {
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
          context.signout()
          return
        });
    }
    else
      context.signout()

  }

  signout() {
    if (this.timeout != null)
      clearInterval(this.timeout)
    if (this.myWindow != null)
      this.myWindow.close()
    console.log("signout")
    this.user_logout()
  }

  render() {
    return (
      page(this)
    )
  }
}

export default Examstart;
