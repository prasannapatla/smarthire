from django.conf.urls import url
from smart import views

 
urlpatterns = [ 
    url(r'^signup/$', views.user_signup),
    url(r'^login/$', views.user_login),
    url(r'^test_code/$', views.ver_code_que),
    url(r'^test/$', views.get_login_status),
    url(r'^admin_status/$', views.get_admin_status),
    url(r'^sess/$', views.set_sess),
    url(r'^del/$', views.del_sess),
    url(r'^addcat/$', views.addcat),
    url(r'^addque/$', views.addque),
    url(r'^addexam/$', views.add_exam),
    url(r'^addset/$', views.add_que_set),
    url(r'^add_code_que_set/$', views.add_code_que_set),
    url(r'^addcode/$', views.addcode),
    url(r'^setexam/$', views.set_cur_exam),
    url(r'^getcat/$', views.get_cat),
    url(r'^getexam/$', views.get_exam),
    url(r'^que/$', views.get_q),
    url(r'^ver/$', views.ver_q),
    url(r'^exam_logout/$', views.exam_logout),
    url(r'^code_exam_logout/$', views.code_exam_logout),
    url(r'^code_exam_status/$', views.code_exam_status),
    url(r'^get_code_que/$', views.get_code_que),
    url(r'^submit_code/$', views.submit_code),
    url(r'^feedback/$', views.feedback),
    url(r'^count_malpractices/$', views.count_malpractices),
    url(r'^exam_status/$', views.exam_status),
    url(r'^view_res/$', views.view_res),
    url(r'^view_code_res/$', views.view_code_res),
    url(r'^view_det_res/$', views.view_det_res),
    url(r'^view_res_user/$', views.view_res_user),
    url(r'^view_graph/$', views.view_graph),
    url(r'^view_cat_res/$', views.view_cat_res),
    url(r'^remove_user/$', views.del_user),
    url(r'^remove_cat/$', views.del_cat),
    url(r'^exam_del/$', views.exam_del),
    url(r'^send_cred/$', views.send_cred),
    url(r'^sent_cred/$', views.sent_cred),
    url(r'^get_questions/$', views.get_questions),
    url(r'^list_code_questions/$', views.list_code_questions),
    url(r'^get_select_que_count/$', views.get_select_que_count),
    url(r'^remove_questions/$', views.del_questions),
    url(r'^remove_code_questions/$', views.del_code_questions),
    url(r'^bulk_reg/$', views.bulk_reg),
    url(r'^bulk_que/$', views.bulk_que),
    url(r'^bulk_code_que/$', views.bulk_code_que),
    url(r'^retrive_email_status/$', views.retrive_email_status),
    url(r'^cur_email_status/$', views.cur_email_status),
    url(r'^email_status_in_db/$', views.email_status_in_db),
    url(r'^get_temp_update/$', views.get_temp_update),
    url(r'^get_expected_output/$', views.get_expected_output),
    url(r'^all_exam_status/$', views.all_exam_status),
    url(r'^video_stream/$', views.video_stream),
    ]