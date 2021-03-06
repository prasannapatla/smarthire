
import './Code_populate.scss';
import page from './Code_populateHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Code_populate extends Myservice {

    constructor(props: any) {
        super(props);
    }

    componentDidMount() {
        this.get_exam("exam");
        super.componentDidMount();
    }

    componentDidUpdate() {
        super.componentDidUpdate();
    }

    get_exam = (id: any) => {
        var cat_str = this.fetch_data("/server/getexam/", "POST");
        let json_obj = JSON.parse(cat_str)
        let val1: any, val2: any
        let txt = "<option>Select exam</option>"
        for (val1 in json_obj) {
            txt += "<option  value=\"" + json_obj[val1]["id"] + "\">"
            txt += json_obj[val1]["e_name"] + "</option>"
        }
        $("#" + id).html(txt)
        let ctx=this
        $("#" + id).change(function(this:any){
          var remaining = JSON.parse(ctx.fetch_data("/server/rem_exam_dur/","POST",null,"exam=" + $(this).children("option:selected").val()))
          $(".remaining").text((remaining.remaining/60).toFixed(0)+" Mins.")
        });
    }

    create_que_set() {
        let exam_id = $('#exam option:selected').val();
        if ($("#exam").prop('selectedIndex') == 0) {
            swal(exam_id + " before submitting.", "", "warning")
            return false;
        }
        if ($('#dur').val() <= 0) {
            swal("Given duration is incorrect", "", "warning")
            return
        }
        if ($('#total').val() < 0) {
            swal("Value for number of questions is wrong", "", "warning")
            return
        }
        let dur = $('#dur').val()
        let total = $('#total').val()
        // this.show_msg(this.fetch_data("/server/add_code_que_set/", "POST", "exam="+exam_id+"&dur="+dur+"&total="+total, null));
        //sweet alert top right
        let status = this.fetch_data("/server/add_code_que_set/", "POST", "exam="+exam_id+"&dur="+dur+"&total="+total, null).split("&sep;")
        this.notify(status[1],status[0])
        $(".remaining").text("")
        this.get_exam("exam");
    }

    render() {
        return (
            page(this)
        )
    }
}

export default Code_populate;
