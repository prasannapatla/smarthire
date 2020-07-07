
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
    timeout2: any = null
    componentDidMount() {
        this.list_user();
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

        $(".user_data").html("")
        for (let row in json_data) {
            let html_data = "<tr class='id" + json_data[row]["id"] + "' uid='" + json_data[row]["id"] + "' >"
            html_data += "<td style='padding-right:30px;font-size:12px'>" + json_data[row]["name"] + "</td>\n"
            html_data += "<td style='padding-right:20px;font-size:12px'>" + json_data[row]["email"] + "</td>\n"
            if (json_data[row]["password"] !== "") {
                html_data += "<td><input type='text' style='font-size:12px;width:80%' value='" + json_data[row]["password"] + "' class='pwd pwd_active' /></td>\n"
            }
            else {
                console.log(".........")
                html_data += "<td><input type='text'  style='font-size:12px;width:80%' readonly value='********' class='pwd' /></td>\n"
            }
            if (json_data[row]["super_admin"] == true)
                html_data += "<td><label class='container1' style='margin-left:30px'><input type='checkbox' checked='true' class='full' value='" + json_data[row]["id"] + "' /><span class='checkmark'></span></label></td>\n"
            else
                html_data += "<td><label class='container1' style='margin-left:30px'><input type='checkbox' class='full' value='" + json_data[row]["id"] + "' /><span class='checkmark'></span></label></td>\n"

            html_data += "<td><label class='container1' style='margin-left:30px'><input type='checkbox' class='del' value='" + json_data[row]["id"] + "' /><span class='checkmark'></span></label>"
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
        this.update_event_reg()
    }

    del_user() {
        let ids = Array()
        $(".del:checked").each(function (this: any) {
            ids.push($(this).val())
        });
        // this.show_msg(this.fetch_data("/server/remove_admin/", "POST", "ids=" + ids.join(",")), this.reload_users, this)
        let status = this.fetch_data("/server/remove_admin/", "POST", "ids=" + ids.join(","))
        let toNotify = status.split("&sep;")
        this.notify(toNotify[1], toNotify[0])
        this.list_user();
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


    update_event_reg() {
        let context = this
        $("tr").on('keyup', function (this: any) {
            if (context.timeout != null)
                clearTimeout(context.timeout)
            context.timeout = setTimeout(
                () => {
                    if( $(this).find(".pwd_active").length)
                    context.update($(this).find(".user_id").val(), $(this).find(".pwd_active").val(), $(this).find(".full").is(":checked"))
                }
                , 1000)
        });
        $("tr td .pwd .pwd_active").on('change', function (this: any) {
            alert("hi")
            context.update($(this).parent().parent().parent().find(".user_id").val(), $(this).parent().parent().parent().find(".pwd").val(), $(this).parent().parent().parent().find(".full").is(":checked"))
        });
        $("tr td .full").on('change', function (this: any) {
            context.update($(this).parent().parent().parent().find(".user_id").val(), $(this).parent().parent().parent().find(".pwd").val(), $(this).is(":checked"))

        });
        // $("tr").on('change', function (this: any) {
        //     alert("hi")
        // });

    }

    update(uid: number, pwd: string, admin: boolean) {
        let context = this
        let json_data = {
            uid: uid,
            password: pwd,
            super_admin: (admin) ? 1 : 0
        }
        console.log(json_data)
        let status = this.fetch_data("/server/update_admin/", "POST", null, json_data).split("&sep;")[1]
        // swal(status,"","success")
        this.notify(status, "success")
        if (this.timeout != null)
            clearTimeout(this.timeout)
        this.timeout = setTimeout(
            () => {
                context.list_user();
            }
            , 1000)
        // $(".user_data").html("")
        // this.list_user();
    }



    reload_users(_this: any, status: string, v: any) {
        console.log(status, v, _this)
        _this.list_user();
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Users;
