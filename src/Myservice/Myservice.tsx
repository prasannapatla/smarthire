
import React from 'react';
import { callbackify } from 'util';
// import * as $ from 'jquery';
var $ = require("jquery");
import html2canvas from "html2canvas"
var swal = require("sweetalert");
var Swal = require("sweetalert2");

class Myservice extends React.Component {

   file: any;

   componentDidMount() {
      console.log("----------Super class Component mounted-----------")
   }

   componentDidUpdate() {
      console.log("----------Super class Component Updated-----------")
   }
   shouldComponentUpdate(nextProps: any, nextState: any) {

      return false;
   }


   public fetch_data = (path: string, method: string = "POST", str_req: any = null, json_req: any = null, async_val: boolean = false, callback?: any, context: any = null): any => {
      let res: string = ""
      let json_str: any
      let data_to_be_send: any = []
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
               if (context != null)
                  callback(res, context);
               else
                  callback(res);
         },
         async: async_val
      });
      return res;
   }



   Upload: any
   myfileinit(path: string, json_data: any, callback: any, context: any) {

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
         for (let key in json_data) {
            formData.append(key, json_data[key]);
            console.log(key, json_data[key])
         }
         if (typeof this.file === "undefined")
            swal("Choose file before upload", "", "warning")
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
               callback(data, context)
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



   sleep(milliseconds: any) {
      var start = new Date().getTime();
      for (var i = 0; i < 1e7; i++) {
         if ((new Date().getTime() - start) > milliseconds) {
            break;
         }
      }
   }

   on_elem_load(attr_name: any, val: any, callback: any) {
      document.addEventListener(
         'load',
         function (event) {
            var elm = event.target;
            console.log($(elm).attr(attr_name))
            if ($(elm).attr(attr_name) === val) { // or any other filtering condition
               console.log("loded..." + $(elm).attr(attr_name))
               callback();
            }
         },
         true // Capture event
      );
   }

   download_page(_this?: any, selecter = ".sect", to = "#screenshot") {
      console.log(selecter, to)
      // $(window).scrollTop(0)
      $('html, body').animate({
         scrollTop: 0
      }, {
         duration: 150
      })
      $("body").append("<div className='screenshot' style='display:none' id='screenshot'></div>")
      //@ts-ignore
      html2canvas(document.querySelector(selecter)).then(canvas => {
         $(to).eq(0).html(canvas)
         var download = $("#download")[0];
         var image = $(to + " canvas")[0].toDataURL("image/png")
            .replace("image/png", "image/octet-stream");
         download.setAttribute("href", image);
         download.click();
      });
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
      if ((this.fetch_data("/server/test/", "POST")).match("No user logged in:")) {
         this.open_link("")
         return true
      }
      else
         return false
   }

   allow_admin = () => {
      if ((this.fetch_data("/server/admin_status/", "POST")).match("No user logged in:")) {
         this.open_link("")
         return true
      }
      else
         return false
   }

   user_logout = () => {
      if (localStorage.getItem("selectedPage") != null)
         localStorage.removeItem("selectedPage")
      if (this.fetch_data("/server/del/", "POST")) {
         this.open_link("")
         return true
      }
      else
         return false
   }

   show_msg(resp: string, callback?: any, context?: any) {
      let status = resp
      let msg: string[] = Array()
      try {
         msg = resp.split("&sep;")
      } catch (error) { }
      if (status.match("error&sep;") || status.match("success&sep;") || status.match("warning&sep;") || status.match("info&sep;"))
         swal(msg[1], "", msg[0]).then((value: any) => { callback(context, msg[0], value) });
      else
         swal(msg, "").then((value: any) => { context.callback(value) });
   }


   notify = (msg = "success", type = "success") => {
      const Toast = Swal.mixin({
         toast: true,
         position: 'top-end',
         showConfirmButton: false,
         timer: 5000,
         timerProgressBar: true,
         onOpen: (toast: any) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
         }
      })

      Toast.fire({
         icon: type,
         title: msg
      })
   }



   copyCSS = (elem: any, origElem: any) => {

      var supportsCSSText = getComputedStyle(document.body).cssText !== "";
      var computedStyle = getComputedStyle(origElem);

      if (supportsCSSText) {
         elem.style.cssText = computedStyle.cssText;

      } else {
         for (var prop in computedStyle) {
            if (isNaN(parseInt(prop, 10)) && typeof computedStyle[prop] !== 'function' && !(/^(cssText|length|parentRule)$/).test(prop)) {
               elem.style[prop] = computedStyle[prop];
            }
         }
      }

   }


   inlineStyles = (elem: any, origElem: any) => {

      var children = elem.querySelectorAll('*');
      var origChildren = origElem.querySelectorAll('*');

      // copy the current style to the clone
      this.copyCSS(elem, origElem);

      // collect all nodes within the element, copy the current style to the clone
      let ctx = this
      Array.prototype.forEach.call(children, function (child, i) {
         ctx.copyCSS(child, origChildren[i]);
      });

      // strip margins from the outer element
      elem.style.margin = elem.style.marginLeft = elem.style.marginTop = elem.style.marginBottom = elem.style.marginRight = '';

   }


   capture_html = (selector: any, quality: any = 1) => new Promise((resolve) => {

      let origElem = document.querySelector(selector)
      let ctx = this

      var elem = origElem.cloneNode(true);

      var canvas_set = elem.querySelectorAll("canvas");

      canvas_set.forEach((canvas: any) => {
         let canvas_to_img_base64 = canvas.toDataURL("image/png")

         const replace_canvas_with_img = document.createElement('img');
         replace_canvas_with_img.src = canvas_to_img_base64
         canvas.parentNode.replaceChild(replace_canvas_with_img, canvas);
      });


      var svg_set = elem.querySelectorAll("svg");
      console.log(svg_set)

      svg_set.forEach(async (svg: any) => {
         let svg_to_img_base64 = await ctx.svg_to_png(svg.cloneNode(true))
         console.log("svg_to_img_base64",svg_to_img_base64)
         const replace_svg_with_img = document.createElement('img');
         replace_svg_with_img.src = svg_to_img_base64
         //Because i got a probleom in anychart
         svg.parentNode.appendChild(replace_svg_with_img)
         // svg.parentNode.replaceChild(replace_svg_with_img, svg);         
      });


      // inline all CSS (ugh..)
      this.inlineStyles(elem, origElem);

      // unfortunately, SVG can only eat well formed XHTML
      elem.setAttribute("xmlns", "http://www.w3.org/1999/xhtml");

      // serialize the DOM node to a String
      var serialized = new XMLSerializer().serializeToString(elem);

      // Create well formed data URL with our DOM string wrapped in SVG
      var dataUri = "data:image/svg+xml," +
         "<svg xmlns='http://www.w3.org/2000/svg' width='" + (origElem.offsetWidth) + "' height='" + ((origElem.offsetHeight)) + "'>" +
         "<foreignObject width='100%' height='100%' >" +
         serialized +
         "</foreignObject>" +
         "</svg>";

      // // create new, actual image
      // var img = new Image();
      // img.crossOrigin = "anonymous";
      // img.src = dataUri;
      // img.onload = () => {
      //    alert(dataUri)
      //    var canvas = document.createElement("canvas")
      //    canvas.style.display = "none"
      //    // canvas.width = $(selector).outerWidth()
      //    // canvas.height = $(selector).outerHeight()
      //    canvas.width = img.width
      //    canvas.height = img.height
      //    let cttx = canvas.getContext('2d')
      //    if (cttx) {
      //       cttx.scale(quality, quality);
      //       cttx.drawImage(img, 0, 0,img.width,img.height);
      //    }
      //    let base64=canvas.toDataURL("image/png", quality)
      //    canvas.remove()
      //    resolve(base64)
      // }


      let svg = "<svg xmlns='http://www.w3.org/2000/svg' width='" + (origElem.offsetWidth) + "' height='" + ((origElem.offsetHeight)) + "'>" +
         "<foreignObject width='100%' height='100%' >" +
         serialized +
         "</foreignObject>" +
         "</svg>";



      ctx.svg_to_png(svg).then(base64 => resolve(base64))

   })


   utf8_to_b64(str: string) {
      return window.btoa(unescape(encodeURIComponent(str)));
   }

   colorToRGBA=(color:string)=>{
      var cvs, ctx;
      cvs = document.createElement('canvas');
      cvs.height = 1;
      cvs.width = 1;
      ctx = cvs.getContext('2d');
      if(ctx){  // let data = context.getImageData(0, 0, w, h);
         // var compositeOperation = context.globalCompositeOperation;
         // context.globalCompositeOperation = "destination-over";   
         // context.fillStyle = '#fff'; 
         // context.fillRect(0, 0, w, h);
         // context.putImageData(data, 0, 0);
         return ctx.getImageData(0, 0, 1, 1).data;
      }
      else
         return color
  }

  change_bg_of_transparent=(imgData:any)=>{

  }


   async svg_to_png(svgString: string) {
      let base64_svg = "data:image/svg+xml;base64," + this.utf8_to_b64(svgString)
      // console.log(base64_svg)
      var img = new Image();
      img.crossOrigin = "anonymous";
      var canvas = document.createElement("canvas")
      canvas.style.display = "none"
      // canvas.style.backgroundColor="white"
      img.src = base64_svg;

      await new Promise((resolve) => {
         img.onload = function () {
            let w = img.width
            let h = img.height
            canvas.width = w
            canvas.height = h
            // set to draw behind current content
            let context = canvas.getContext("2d");
            
            if(context){
               context.drawImage(img, 0, 0, w, h);
               // let data = context.getImageData(0, 0, w, h);
               // var compositeOperation = context.globalCompositeOperation;
               // context.globalCompositeOperation = "destination-over";   
               // context.fillStyle = '#fff'; 
               // context.fillRect(0, 0, w, h);
               // context.putImageData(data, 0, 0);
               // context.globalCompositeOperation = compositeOperation;

            }
            resolve()
         }
      })

      let url = canvas.toDataURL("image/png")
      canvas.remove()

      return url
   }





}


export default Myservice;
