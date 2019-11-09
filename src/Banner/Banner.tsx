
import './Banner.scss';
import page from './BannerHtml'
import Myservice from '../Myservice/Myservice'
var $ = require("jquery");
var swal = require("sweetalert");

class Banner extends Myservice {

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

export default Banner;
    