
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
    