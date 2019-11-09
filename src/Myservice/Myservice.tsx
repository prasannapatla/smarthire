
import React from 'react';
import { callbackify } from 'util';
// import * as $ from 'jquery';
var $ = require("jquery");


class Myservice extends React.Component {

  file: any;

  componentDidMount() {
    console.log("----------Super class Component mounted-----------")
  }

  componentDidUpdate() {
    console.log("----------Super class Component Updated-----------")
  }
  shouldComponentUpdate(nextProps:any, nextState:any) {
        
    return false;
  }


  public fetch_data = (path: string, method: string = "POST", str_req: any = null, json_req: any = null, async_val: boolean = false, callback?: any,context:any=null): any => {
    let res: string = ""
    let json_str: any
    let data_to_be_send:any = []
    if (str_req != null) {
      let data_arr: any = str_req.split("&");
      if (data_arr.length > 1) {
        for (let val1 in data_arr) {
          //let data_key_val = data_arr[val1].split("=")
          let data_key_val = data_arr[val1].split("=");
          data_key_val[1] = data_key_val.slice(1).join("=")
          console.log(("\"" + data_key_val[0] + "\":\"" + data_key_val[1] + "\""))
          data_to_be_send.push("\"" + data_key_val[0] + "\":\"" + data_key_val[1] + "\"")
        }
      }
      else {
        let data_key_val = data_arr[0].split("=")
        data_to_be_send.push("\"" + data_key_val[0] + "\":\"" + data_key_val[1] + "\"")
      }

      json_str = JSON.parse("{" + data_to_be_send.join(",") + "}")
    }
    else if (json_req != null) {
      json_str = json_req;
    }
    else {
      json_str = "{ }"
    }
    //alert(JSON.stringify( json_str));
    $.ajax({
      type: method,
      url: path,
      data: json_str,
      success: function (response: any) {
        res = response
        if (async_val == true)
          if(context!=null)
            callback(res,context);
          else
            callback(res);
      },
      async: async_val
    });
    return res;
  }



  Upload: any
  myfileinit(path:string,json_data:any,callback:any,context:any) {

    this.Upload = function (file: any) {
      this.file = file;
    };

    this.Upload.prototype.getType = function () {
      return this.file.type;
    };
    this.Upload.prototype.getSize = function () {
      return this.file.size;
    };
    this.Upload.prototype.getName = function () {
      return this.file.name;
    };
    this.Upload.prototype.doUpload = function () {
      var that = this;
      var formData = new FormData();

      // add assoc key values, this will be posts values
      for(let key in json_data){
        formData.append(key, json_data[key]);
        console.log(key, json_data[key])
      }
      formData.append("file", this.file, this.getName());
      // formData.append("upload_file", true);
      $.ajax({
        type: "POST",
        url: path,
        xhr: function () {
          var myXhr = $.ajaxSettings.xhr();
          if (myXhr.upload) {
            myXhr.upload.addEventListener('progress', that.progressHandling, false);
          }
          return myXhr;
        },
        success: function (data: any,) {
         callback(data,context)
        },
        error: function (err: any) {
          console.log(err)
        },
        async: true,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        timeout: 60000
      });
    };

    this.Upload.prototype.progressHandling = function (event: any) {
      var percent = 0;
      var position = event.loaded || event.position;
      var total = event.total;
      if (event.lengthComputable) {
        percent = Math.ceil(position / total * 100);
        console.log(percent)
        $(".progress").html(percent);
      }
    };
  }



  sleep(milliseconds:any) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
      if ((new Date().getTime() - start) > milliseconds){
        break;
      }
    }
  }

  on_elem_load(attr_name:any,val:any,callback:any){
    document.addEventListener(
        'load',
        function(event){
            var elm = event.target;
            console.log($(elm).attr(attr_name))
            if( $(elm).attr(attr_name) === val){ // or any other filtering condition
              console.log("loded..."+$(elm).attr(attr_name))
                callback();
            }
        },
        true // Capture event
    );
}

  set_sess = (key: any, value: any) => {
    localStorage.setItem(key, value);
  }
  get_sess = (key: any) => {
    if (key in localStorage && localStorage.getItem(key) != null)
      return localStorage.getItem(key)
    else
      return null;
  }
  del_sess = (key: any) => {
    if (key in localStorage)
      localStorage.removeItem(key);
  }

  open_link(link: string) {
    window.location.assign("#" + link)
  }



  allow_user = () => {
    if ((this.fetch_data("/server/test/", "POST")).match("No user logged in:"))
    {
      this.open_link("")
      return true
    }
    else 
      return false
  }

  allow_admin = () => {
    if ((this.fetch_data("/server/admin_status/", "POST")).match("No user logged in:"))
    {
      this.open_link("")
      return true
    }
    else 
      return false
  }

  user_logout = () => {
    if ( this.fetch_data("/server/del/", "POST"))
    {
      this.open_link("")
      return true
    }
    else 
      return false
  }


}


export default Myservice;
