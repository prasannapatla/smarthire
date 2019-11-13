
import './Users.scss';
import page from './UsersHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Users extends Myservice {

    constructor(props: any) {
        super(props);
    }

    componentDidMount() {
        this.list_user();
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    list_user() {
        let json_data = [
            {
                id: 1,
                name: "guru",
                email: "email@gmail.com",
                password: "1234",
                super_admin: true
            },

            {
                id: 2,
                name: "raj",
                email: "emai2@gmail.com",
                password: "1234",
                super_admin: true
            },

            {
                id: 2,
                name: "someone",
                email: "emai3@gmail.com",
                super_admin: false
            }
        ]
        for (let row in json_data) {
            let html_data = "<tr class='id" + json_data[row]["id"] + "'>"
            html_data += "<td>" + json_data[row]["name"] + "</td>\n"
            html_data += "<td>" + json_data[row]["email"] + "</td>\n"           
            if (typeof json_data[row]["password"] !== "undefined"){
                html_data += "<td><input type='text' value='" + json_data[row]["password"] + "' class='pwd' /></td>\n"
                html_data += "<td><input type='checkbox' class='full' value='" + json_data[row]["id"] + "' /></td>\n"
            }                
            else{
                html_data += "<td><input type='text' value='' class='pwd' /></td>\n"
                html_data += "<td><input type='checkbox' checked='true' class='full' value='" + json_data[row]["id"] + "' /></td>\n"      
              }
                
            html_data += "<td><input type='checkbox' class='del' value='" + json_data[row]["id"] + "' /></td>\n"
            html_data += "</tr>"
            $(".user_data").append(html_data)
            if (typeof json_data[row]["password"] === "undefined"){
                $(".id" + json_data[row]["id"] + " td .pwd").blur()
                $(".update").hide()
                $(".add_user").hide()
            }
        }
    }

    update() {

    }

    add() {
        alert("hi")
        return false
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Users;
