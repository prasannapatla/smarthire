import './App.css';
import Myservice from '../Myservice/Myservice'
import Page from "./AppHtml"
var $ = require("jquery");
var swal = require("sweetalert");

class App extends Myservice {
  constructor(props: any) {
    super(props);
    this.state = { color: "red" };
  }


  guru() {
    swal("hi","")
  }
  test(a: any) {
    swal(a)
  }

  render() {
    return (
      Page(this)
    )
  }


  componentDidMount() {
    $(".wel").css({ 'color': 'red' })

    $(".test").click(function () {
      alert("Guru");
    });

    console.log("fetch" + this.fetch_data("http://199.34.21.253:8080/server/test_code/", "GET", null, null, true, this.test))
    super.componentDidUpdate();
  }

  componentDidUpdate() {
    super.componentDidUpdate();
  }


}

export default App;
