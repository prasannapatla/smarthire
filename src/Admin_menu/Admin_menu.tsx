
import './Admin_menu.scss';
import page from './Admin_menuHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Admin_menu extends Myservice {

    constructor(props:any) {
        super(props);
    }

     componentDidMount() {
      if(localStorage.getItem("selectedPage")==null)
      localStorage.setItem("selectedPage",$("li:first").text())

      $("li").click(function(this:any){
         localStorage.setItem("selectedPage",$(this).text())
       });

       $("li").each(function(this:any){
         if(localStorage.getItem("selectedPage")==$(this).text())
         $(this).css({"background-color": "rgb(130,136,170)",
            "background": "linear-gradient(90deg, #72789C, rgba(103,109,144,1) 38%, rgba(72,76,97,1) 95%)","border-right":"solid 4px #E63284"})
       
      });
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    guru() {
         swal("hi","")
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Admin_menu;
    