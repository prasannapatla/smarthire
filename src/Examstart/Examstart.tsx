
import './Examstart.scss';
import page from './ExamstartHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Examstart extends Myservice {
  myWindow: any;
  c: number = 0;
  constructor(props: any) {
    super(props);

  }

  componentDidMount() {
    if (this.allow_user())
      return;

    this.c = 0;
    document.addEventListener("contextmenu", event => event.preventDefault());
    var context = this
    // window.onbeforeunload = function () {
    //   context.fetch_data("/server/del/", "POST");
    // }

    this.disable_btns();
    super.componentDidMount();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }

  openWin = (page:string) => {
    this.c = 0;
    var context = this;
    //this.myWindow = window.open("/exampage", "guru", "'fullscreen=yes, scrollbars=auto,menubar=no,toolbar=no,titlebar=no'"); 
    //this.myWindow = window.open("/exampage", "_blank ");   // Opens a new window
    this.myWindow = window.open("#"+page, "_blank", "fullscreen=yes, scrollbars=1");
    this.set_sess("login_status", "logged in")
    // // this.go_full_screen(this.myWindow.document.documentElement);
    // document.addEventListener("contextmenu", event => event.preventDefault());
    // document.addEventListener("keydown", event => event.preventDefault());
    this.go_full_screen(this.myWindow.document);
    this.toTop();
    this.myWindow.addEventListener('resize', () => {
      context.toTop()
    });
    this.myWindow.addEventListener("blur", () => context.close_win());
    this.myWindow.addEventListener("visibilitychange", () => {
      if (this.myWindow.document.visibilityState == 'hidden') {
        if (this.c > 0 && this.c < 3 && context.get_sess("login_status") != null)
          swal(4 - this.c + " Warning! \nIf you try to minimize or resize the window,Your exam will be closed","","warning")
        if (context.myWindow.screenX <= 0 || context.myWindow.screenY <= 0)
          context.close_win();
      }
    });
    let n = 0;

    this.disable_btns();
  }


  openWin2 = () => {
    window.open("#code_editor", "_blank", "fullscreen=yes, scrollbars=1");
  }

  // redirect() {
  //   this.router.navigate([' ']);
  // }

  toTop() {
    this.myWindow.moveTo(0, 0);
    this.myWindow.resizeTo(screen.availWidth, screen.availHeight)
    this.myWindow.focus();
  }

  close_win = (): any => {
    if (this.c >= 3) {
      this.myWindow.close();    
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

  disable_btns(){
    if (this.fetch_data("/server/exam_status/", "POST").match("closed")) {
      $(".mcq").find("button").css({cursor: "not-allowed"})
      $(".mcq").find("button").prop('disabled', true);     
  }
}

  render() {
    return (
      page(this)
    )
  }
}

export default Examstart;
