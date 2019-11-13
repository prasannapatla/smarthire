
import './Users.scss';
import page from './UsersHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Users extends Myservice {

    constructor(props: any) {
        super(props);
    }

    timeout: any = null
    componentDidMount() {
        let context = this
        this.list_user();
        $("tr").on('keyup', function (this: any) {
            if (context.timeout != null)
                clearTimeout(context.timeout)
            context.timeout = setTimeout(
                () => {
                    context.update($(this).find(".user_id").val(), $(this).find(".pwd").val(), $(this).find(".full").is(":checked"))
                }
                , 1000)
        });
        $("tr").find("td").eq(2).on('change', function (this: any) {
            context.update($(this).parent().find(".user_id").val(), $(this).val(), $(this).parent().find(".full").is(":checked"))
        });
        $("tr td .full").on('change click', function (this: any) {
            context.update($(this).parent().parent().find(".user_id").val(), $(this).parent().parent().find(".pwd").val(), $(this).is(":checked"))
        });
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    list_user() {
        let json_data = this.fetch_data("/server/view_admin/", "POST")
        // console.log("json_data", json_data)
        try {
            json_data = JSON.parse(json_data)
        } catch (error) {
            return
        }
        for (let row in json_data) {
            let html_data = "<tr class='id" + json_data[row]["id"] + "' uid='" + json_data[row]["id"] + "' >"
            html_data += "<td>" + json_data[row]["name"] + "</td>\n"
            html_data += "<td>" + json_data[row]["email"] + "</td>\n"
            if (json_data[row]["password"] !== "") {
                html_data += "<td><input type='text' value='" + json_data[row]["password"] + "' class='pwd' /></td>\n"
            }
            else {
                console.log(".........")
                html_data += "<td><input type='text' value='' class='pwd' /></td>\n"
            }
            if (json_data[row]["super_admin"] == true)
                html_data += "<td><input type='checkbox' checked='true' class='full' value='" + json_data[row]["id"] + "' /></td>\n"
            else
                html_data += "<td><input type='checkbox' class='full' value='" + json_data[row]["id"] + "' /></td>\n"

            html_data += "<td><input type='checkbox' class='del' value='" + json_data[row]["id"] + "' />"
            html_data += "<td><input type='hidden' class='user_id' value='" + json_data[row]["id"] + "' /></td>\n"
            html_data += "</tr>"
            $(".user_data").append(html_data)
            if (json_data[row]["password"] == "") {
                // $(".id" + json_data[row]["id"] + " td .pwd").prop("disabled", true);
                $(".update").hide()
                $(".full,.del").prop("disabled", true);
                $(".add_user").hide()
            }
        }
    }

    del_user() {
        let ids = Array()
        $(".del:checked").each(function (this: any) {
            ids.push($(this).val())
        });
        this.show_msg(this.fetch_data("/server/remove_admin/", "POST", "ids=" + ids.join(",")), this.reload_users, this)
    }


    add() {
        let super_admin = 0
        if ($(".admin").is(":checked") == true)
            super_admin = 1
        let json_data = {
            name: $(".name").val(),
            email: $(".email").val(),
            password: $(".password").val(),
            super_admin: super_admin
        }
        this.show_msg(this.fetch_data("/server/add_admin/", "POST", null, json_data), this.reload_users, this)
        return false
    }

    update(uid: number, pwd: string, admin: boolean) {
        let json_data = {
            uid: uid,
            password: pwd,
            super_admin: (admin) ? 1 : 0
        }
        console.log(json_data)
        $(".update_status").text(this.fetch_data("/server/update_admin/", "POST", null, json_data).split("&sep;")[1])
    }



    reload_users(_this: any, status: string, v: any) {
        console.log(status, v, _this)
        $(".user_data").html("")
        _this.list_user();
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Users;
