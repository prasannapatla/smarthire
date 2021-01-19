const proxy = require('http-proxy-middleware');

// proxy middleware options
var options = {
    target: 'http://127.0.0.1:7000/', // target host
    changeOrigin: true, // needed for virtual hosted sites
    ws: true, // proxy websockets
    pathRewrite: {
      '^/server/test_code/': '/test_code/',
      "^/server/test": "/test/",
      "^/server/admin_status": "/admin_status/",
      "^/server/sess": "/sess/",
      "^/server/del": "/del/",
      "^/server/login": "/login/",
      "^/server/signup": "/signup/",
      "^/server/que": "/que/",
      "^/server/get_code_que": "/get_code_que/",
      "^/server/addcat": "/addcat/",
      "^/server/setexam": "/setexam/",
      "^/server/addque": "/addque/",
      "^/server/addexam": "/addexam/",
      "^/server/addset": "/addset/",
      "^/server/getcat": "/getcat/",
      "^/server/getexam": "/getexam/",
      "^/server/ver": "/ver/",
      "^/server/count_malpractices": "/count_malpractices/",
      "^/server/exam_status": "/exam_status/",
      "^/server/view_res_user/$": "/view_res_user/",
      "^/server/view_cat_res/$": "/view_cat_res/",
      "^/server/view_res/$": "/view_res/",
      "^/server/view_det_res": "/view_det_res/",
      "^/server/remove_user": "/remove_user/",
      "^/server/remove_cat": "/remove_cat/",
      "^/server/send_cred": "/send_cred/",
      "^/server/sent_cred": "/sent_cred/",
      "^/server/exam_del": "/exam_del/",
      "^/server/get_questions": "/get_questions/",
      "^/server/get_select_que_count": "/get_select_que_count/",
      "^/server/bulk_reg": "/bulk_reg/",
      "^/server/retrive_email_status": "/retrive_email_status/",
      "^/server/email_status_in_db": "/email_status_in_db/",
      "^/server/remove_questions": "/remove_questions/",
      "^/server/get_temp_update": "/get_temp_update/"
    }
  };
   

module.exports = function(app) {
  app.use('/server', proxy(options));
};

