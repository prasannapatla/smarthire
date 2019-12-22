
import './Vishdesign.scss';
import page from './VishdesignHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Vishdesign extends Myservice {

    constructor(props:any) {
        super(props);
    }

     componentDidMount() {
      //   //@ts-ignore
      //   document.getElementById("Vishdesign").style.height=window.screen.height+"px";
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    login_user() {
        let email=$("input").eq(0).val().trim()
        let password=$("input").eq(1).val().trim()
        let req="email=" + email + "&password=" + password
        let resp=""
        if (email.length >= 4 && password.length >= 4)
        {
            resp=this.fetch_data("/server/login/","POST",req)
            if(resp== "valid")
                this.open_link("examstart")
            else if(resp== "admin")
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

export default Vishdesign;
    