
import './Lgdesign.scss';
import page from './LgdesignHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Lgdesign extends Myservice {

   params: any = [];

   constructor(props: any) {
      super(props);
      try {
         this.params = this.get_params(props)
      } catch (error) {
         console.error(error)
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
      if (localStorage.getItem("selectedPage") != null)
         localStorage.removeItem("selectedPage")
      let mySer = this
      $(document).keydown(function (e: any) {
         if (e.which === 13 && typeof (e.which) != "undefined") {

            // alert(e.which)
            let email = $("input").eq(0).val().trim()
            let password = $("input").eq(1).val().trim()
            let req = "email=" + email + "&password=" + password
            let resp = ""
            if (email.length >= 4 && password.length >= 4) {
               resp = mySer.fetch_data("/server/login/", "POST", req)
               if (resp == "valid")
                  mySer.open_link("examstart")
               else if (resp == "admin")
                  mySer.open_link("admin_view_result")
               else
                  $("#invalidprompt").text(resp)
            }
            else
               $("#invalidprompt").text("Invalid email or password length")
         }
      });

      let context = this
      $(document).ready(function () {
         $('.login-info-box').fadeOut();
         $('.login-show').addClass('show-log-panel');
         $('.login-reg-panel input[type="radio"]').on('change', function () {
            if ($('#log-login-show').is(':checked')) {
               $('.register-info-box').fadeOut();
               $('.login-info-box').fadeIn();

               $('.white-panel').addClass('right-log');
               $('.register-show').addClass('show-log-panel');
               $('.login-show').removeClass('show-log-panel');

            }
            else if ($('#log-reg-show').is(':checked')) {
               $('.register-info-box').fadeIn();
               $('.login-info-box').fadeOut();

               $('.white-panel').removeClass('right-log');

               $('.login-show').addClass('show-log-panel');
               $('.register-show').removeClass('show-log-panel');
            }
         });
         $(".Login").on('keypress', function (e: any) {
            if (e.which === 13) {
               $("input[type=button").trigger("click");
            }
         });
         try {
            $("input").eq(0).val(context.params[0])
            $("input").eq(1).val(context.params[1])
         } catch (error) { }

         if (window.location.href.match(/(https?:\/\/127.0.0.1|(http:\/\/localhost))/gi)) {
            $("input").eq(1).val("passme")
         }
         $("input").eq(1).focus()
      });

      super.componentDidMount();
   }

   componentDidUpdate() {
      super.componentDidUpdate();
   }

   login_user() {
      let email = $("input").eq(0).val().trim()
      let password = $("input").eq(1).val().trim()
      let req = "email=" + email + "&password=" + password
      let resp = ""
      if (email.length >= 4 && password.length >= 4) {
         resp = this.fetch_data("/server/login/", "POST", req)
         if (resp == "valid")
            this.open_link("examstart")
         else if (resp == "admin")
            this.open_link("admin_view_result")
         else
            $("#invalidprompt").text(resp)
      }
      else
         $("#invalidprompt").text("Invalid email or password length")
   }

   render() {
      return (
         page(this)
      )
   }
}

export default Lgdesign;
