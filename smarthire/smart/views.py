# from django.shortcuts import render

# from django.contrib.auth.models import User
# from rest_framework import viewsets
# from .serializers import UsersSerializer
# from .models import Users

# # Create your views here.
# class UsersViewSet(viewsets.ModelViewSet):
#     """
#     API endpoint that allows users to be viewed or edited.
#     """
#     queryset = Users.objects.all()
#     serializer_class = UsersSerializer



from django.shortcuts import render 
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser 
from rest_framework import status

from django.http.response import StreamingHttpResponse as HttpResponse
     
from .models import Users,Questions,Categories,Selected_questions,Exam,Result_set,Email_status,Code_questions,Selected_code_questions,Coding_result_set
from .serializers import UsersSerializer


from django.db import connection
import random
import json
import re,os
import datetime,time,pytz
from django.utils.dateparse import parse_datetime
from django.utils import timezone
from html import escape,unescape
from django.core.mail import EmailMultiAlternatives
import imaplib
import email
import threading 
from multiprocessing import Manager

     
# @csrf_exempt
# def user_signup(request):
#     if request.method == 'POST':
#         user_data = JSONParser().parse(request)
#         user_serializer = UsersSerializer(data=user_data)
#         if user_serializer.is_valid():
#             if(user_serializer.save()):
#             return JsonResponse(user_serializer.data, status=status.HTTP_201_CREATED) 
#         return JsonResponse(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
  
 
from django.contrib.auth.models import User
import hashlib 
from Crypto.Cipher import AES
import base64
KEY="This is a key123"


IMAP_SERVER='imap.gmail.com'
EMAIL_HOST_USER = 'terralogic.smarthire@gmail.com'
EMAIL_HOST_PASSWORD = 'vjtohoaprxvfxfab'


@csrf_exempt
def user_signup(request):
    if  request.method == 'POST' and ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            obj = AES.new(KEY, AES.MODE_CBC, 'This is an IV456')
            user_serializer = Users()
            user_serializer.name=request.POST.get("name").strip()
            email_id=request.POST.get("email").strip()
            regexp_str="^[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?$"
            if not re.match(regexp_str,email_id):
                return HttpResponse("Invalid email id",content_type="text")
            user_serializer.email=email_id
            user_serializer.exam_id=request.POST.get("exam")
            password = User.objects.make_random_password(length=6) 
            sha_code=hashlib.sha256(email_id.strip().encode()).hexdigest()
            if re.match("^(127\.0\.0\.1)|localhost",request.get_host()):
                password="passme"
                sha_code=hashlib.sha256("brg".strip().encode()).hexdigest()
                # print("------SHA-----------"+password+sha_code[:10])
            enc_pwd=obj.encrypt(password+sha_code[:10])
            user_serializer.password=base64.b64encode(enc_pwd).decode()
            user_serializer.score=-1
            user_serializer.save()
            if Users!=None:
                mythread=threading.Thread(target=delete_mail_delivery_status, args=(email_id,))
                mythread.start()
                # mythread.join()
                mythread=threading.Thread(target=delete_mail, args=(email_id,))
                mythread.start()
                # mythread.join()
                return HttpResponse("success",content_type="text")
            else:
                return HttpResponse("Registration Failed",content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")
    else:
        return HttpResponse("Only permitted to admin",content_type="text")


@csrf_exempt
def user_login(request):
    request.session["logged_in"]=None
    if request.method == 'POST': 
        email_id=request.POST.get("email").strip()
        user_pwd=request.POST.get('password').strip()
        if (email_id=="admin@terralogic.com" or email_id=="ADMIN@TERRALOGIC.COM") and (user_pwd=="terralogic" or user_pwd=="TERRALOGIC"):
            request.session["admin"]=request.POST.get('email')
            return HttpResponse("admin",content_type="text")
        
        regexp_str="^[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?$"
        if not re.match(regexp_str,email_id):
            return HttpResponse("Invalid email id",content_type="text")
        if len(user_pwd)!=6:
            return HttpResponse("Password should consist of 6 character, current length is "+str(len(user_pwd)),content_type="text")
        obj = AES.new(KEY, AES.MODE_CBC, 'This is an IV456')
        sha_code=hashlib.sha256(email_id.strip().encode()).hexdigest()
        if re.match("^(127\.0\.0\.1)|localhost",request.get_host()):
            sha_code=hashlib.sha256("brg".strip().encode()).hexdigest()
        enc_pwd=obj.encrypt(user_pwd.strip()+sha_code[:10])
        validuser = Users.objects.filter(email=request.POST.get('email'),password__exact=base64.b64encode(enc_pwd).decode())
        usersserializer = UsersSerializer(validuser, many=True)
        if(len(usersserializer.data)>0):
            request.session["logged_in"]=request.POST.get('email');
            return HttpResponse("valid",content_type="text")
        else:
            return HttpResponse("Invalid Credentials!",content_type="text")
    else:
        return HttpResponse("Failed to login")


@csrf_exempt
def get_login_status(request):
    txt=""    
    # for key, val in request.session.items():
    #     txt+=key+"=>"+val+"\n";
    # txt+="\n\n"
    # auth = re.compile(r'^myAuth_.+$')
    # for header in request.META:
    #     if auth.match(header):
    #         return HttpResponse(request.META[header],content_type="text")
    #     txt+=header+"\t"+str(request.META[header])+"\n"
    if ("logged_in" in request.session) and (request.session["logged_in"]!=None):
        txt+="user in: "+request.session["logged_in"]
    else:
        txt+="No user logged in:"
    return HttpResponse(txt,content_type="text")
    # return JsonResponse(usersserializer.data, safe=False)


@csrf_exempt
def get_admin_status(request):
    txt=""    
    # for key, val in request.session.items():
    #     txt+=key+"=>"+val+"\n";
    # txt+="\n\n"
    # auth = re.compile(r'^myAuth_.+$')
    # for header in request.META:
    #     if auth.match(header):
    #         return HttpResponse(request.META[header],content_type="text")
    #     txt+=header+"\t"+str(request.META[header])+"\n"
    if ("admin" in request.session) and (request.session["admin"]!=None):
        txt+="user in: "+request.session["admin"]
    else:
        txt+="No user logged in:"
    return HttpResponse(txt,content_type="text")
    # return JsonResponse(usersserializer.data, safe=False)   


@csrf_exempt
def set_sess(request):
    request.session["guru"]=str(datetime.datetime.now())
    return HttpResponse(request.session["guru"],content_type="text")

    
@csrf_exempt
def del_sess(request):
    request.session.clear()
    return HttpResponse("done",content_type="text")

@csrf_exempt
def addcat(request):  
    if  request.method == 'POST' and ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            if len(request.POST.get("cat"))<2 :
                raise Exception('values are null')
            print(request.POST.get("cat"))
            categories = Categories()
            categories.cat=request.POST.get("cat").strip()
            try:
                categories.save()
            except Exception as e:
                print(str(e))
                return HttpResponse("Category already exists",content_type="text")  
            if categories!=None:
                return HttpResponse("Category added",content_type="text")
            else:
                return HttpResponse("Failed",content_type="text")     
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")   
    else:
        return HttpResponse("invalid req",content_type="text")  


def utc_to_ist():
    return datetime.datetime.now(tz.gettz("Asia/Kolkata")).strftime('%m/%d/%Y %H:%M:%S %Z')


@csrf_exempt
def add_exam(request):  
    if  request.method == 'POST' and ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            today=datetime.datetime.today()
            s_date=datetime.datetime.strptime(request.POST.get("s_date"), "%d/%m/%Y %H:%M")
            e_date=datetime.datetime.strptime(request.POST.get("e_date"), "%d/%m/%Y %H:%M")
            print(today,s_date,e_date)
            if(today>s_date):
                return HttpResponse("Inavalid start/time date",content_type="text")  
            if(s_date>e_date):
                return HttpResponse("Inavalid date/time range",content_type="text")  
            if(len(request.POST.get("e_name"))<=1):
                return HttpResponse("Enter exam name",content_type="text")  
                        
            exam = Exam()
            exam.e_name=request.POST.get("e_name").strip()
            exam.start_date=s_date
            exam.end_date=e_date
           
            try:
                exam.save()
            except Exception as e:
                print(str(e))
                return HttpResponse("Exam already exists",content_type="text")  
            if exam!=None:
                return HttpResponse("success",content_type="text")
            else:
                return HttpResponse("Failed",content_type="text")                
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")   
    else:
        return HttpResponse("invalid req method",content_type="text")  

@csrf_exempt
def add_que_set(request):  
    if  request.method == 'POST' and ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            print(request.POST.get("exam"))
            myjson=json.loads(request.POST.get("data"))
            print(str(myjson))
            total_mark=0
            try:
                Selected_questions.objects.filter(exam_id=request.POST.get("exam")).delete()
            except Exception as e:
                print(str(e))
            for val in myjson:
                cursor = connection.cursor()     
                exam=Exam.objects.filter().values()[0]   
                stmt="select id from smart_questions where cat_id='"+str(val["cat"])+"' order by RAND() LIMIT "+val["total"]+";"
                cursor.execute(stmt)
                questions= cursor.fetchall() 
                #questions=Questions.objects.filter(cat=str(val["cat"])).values()[0:int(val["total"])]
                total_mark+=len(questions)
                for val2 in questions:
                    selected_questions=Selected_questions()
                    selected_questions.que_id=val2[0]
                    selected_questions.exam_id=request.POST.get("exam")
                    cursor = connection.cursor()
                    duration=abs(int(request.POST.get("dur")))*60
                    stmt="UPDATE smart_exam SET duration = \'"+str(duration)+"\',total_marks = \'"+str(total_mark)+"\' WHERE id=\'"+request.POST.get("exam")+"\';"
                    cursor.execute(stmt)
                    cursor.close()
                    try:
                        selected_questions.save()
                    except:
                        pass  

            return HttpResponse("Exam Populated",content_type="text")  
        except Exception as e:
            return HttpResponse("Enter valid details",content_type="text")  
    else:
        return HttpResponse("Invalid req",content_type="text")  


@csrf_exempt
def addque(request):      
    if ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            if len(request.POST.get("quetions"))<2 or len(request.POST.get("opt1"))<1 or len(request.POST.get("opt2"))<1 or len(request.POST.get("opt3"))<1 or len(request.POST.get("opt4"))<1 or len(request.POST.get("ans"))<1:
                raise Exception('values are null')
            questions = Questions()
            sent_que="<div>"+escape(request.POST.get("quetions")).replace("\n","<br />")+"</div>"
            if(request.POST.get("formated_para")!="nothing"):
                sent_que+="\n"+"<pre>"+escape(request.POST.get("formated_para"))+"</pre>"
            questions.question=sent_que
            questions.opt1=request.POST.get("opt1")
            questions.opt2=request.POST.get("opt2")
            questions.opt3=request.POST.get("opt3")
            questions.opt4=request.POST.get("opt4")
            questions.ans=request.POST.get("ans")
            questions.cat_id=request.POST.get("cat")
            questions.save()
            if questions!=None:
                return HttpResponse("success",content_type="text")
            else:
                return HttpResponse("Failed",content_type="text")     
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")   
    else:
        return HttpResponse("invalid req",content_type="text")  


@csrf_exempt
def set_cur_exam(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            cursor = connection.cursor()
            stmt="UPDATE smart_exam SET on_going_exam = \'false\';"
            cursor.execute(stmt)
            stmt="UPDATE smart_exam SET on_going_exam = \'true\' where id=\'"+request.POST.get("exam_id")+"\';"
            print(stmt+"\n")
            cursor.execute(stmt)
            print("Update:"+str(cursor.rowcount)+"\n")
            connection.commit()
            cursor.close()
            if(cursor.rowcount>0):
                return HttpResponse("sucess",content_type="text")  
            else:                
                return HttpResponse("no change",content_type="text")  
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")   
    else:
        return HttpResponse("invalid req",content_type="text")  

@csrf_exempt
def get_cat(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        stmt='''
        SELECT cat,c.id,count(q.cat_id) AS available
                FROM    smart_questions q
                RIGHT JOIN smart_categories c
                ON c.id=q.cat_id
                GROUP BY c.id
        '''
      
        return HttpResponse(make_query(stmt),content_type="text")
        # return HttpResponse(json.dumps([dict(item) for item in Categories.objects.all().values('cat','id')]),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")
@csrf_exempt
def get_exam(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        return HttpResponse(json.dumps([dict(item) for item in Exam.objects.all().values('e_name','id')]),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

@csrf_exempt
def get_select_que_count(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        return HttpResponse(str(len(Selected_questions.objects.filter(exam_id=request.POST.get("exam_id")).values())),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

@csrf_exempt
def get_questions(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if(request.POST.get("id")=="all"):
            # return HttpResponse(json.dumps([dict(item) for item in Questions.objects.all().values('question','id','opt1','opt2','opt3','opt4','ans')]),content_type="text")
            stmt='''
            SELECT 
                    DISTINCT sq.id,question, opt1, opt2, opt3, opt4, ans,cat
                    FROM   smart_questions AS sq 
                    INNER JOIN smart_categories AS ct
                            ON sq.cat_id = ct.id
            '''
          
            return HttpResponse(make_query(stmt),content_type="text")
        elif(('type' in request.POST) and request.POST.get("type")=="exam"):
            stmt='''
            SELECT 
                     DISTINCT sq.id,question, opt1, opt2, opt3, opt4, ans,cat
                    FROM   smart_questions AS sq 
                    INNER JOIN smart_selected_questions AS ssq
                            ON ssq.que_id = sq.id
                    INNER JOIN smart_categories AS ct
                            ON sq.cat_id = ct.id
                    WHERE ssq.exam_id=\''''+request.POST.get("id")+'''\'
            '''

          
            return HttpResponse(make_query(stmt),content_type="text")
        else:
            stmt='''
            SELECT 
                     DISTINCT sq.id,question, opt1, opt2, opt3, opt4, ans,cat
                    FROM   smart_questions AS sq 
                    INNER JOIN smart_categories AS ct
                            ON sq.cat_id = ct.id
                    WHERE ct.id=\''''+request.POST.get("id")+'''\'
            '''
          
            return HttpResponse(make_query(stmt),content_type="text")
            # return HttpResponse(json.dumps([dict(item) for item in Questions.objects.filter(cat_id=request.POST.get("id")).values( 'question','id','opt1','opt2','opt3','opt4','ans')]),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")


# @csrf_exempt
# def get_sel_que(request):
#     if ("admin" in request.session) and (request.session["admin"]!=None):
#         if(request.POST.get("id")=="all"):
#             # return HttpResponse(json.dumps([dict(item) for item in Questions.objects.all().values('question','id','opt1','opt2','opt3','opt4','ans')]),content_type="text")
#             stmt='''
#             SELECT 
#                     DISTINCT sq.id,question, opt1, opt2, opt3, opt4, ans,cat
#                     FROM   smart_questions AS sq 
#                     INNER JOIN smart_categories AS ct
#                             ON sq.cat_id = ct.id
#             '''
#           
#             return HttpResponse(make_query(stmt),content_type="text")
#         elif(('type' in request.POST) and request.POST.get("type")=="exam"):

# def check_attend(request):  
#     user = Users.objects.filter(email=request.session["logged_in"]).values()
#     return len(user.get("score"))>0

def check_attend(request):  
    user = Users.objects.filter(email=request.session["logged_in"],score="-1").values()
    return len(user)>0


def time_to_sec(cur_time):
    cur_time_arr=cur_time.split(":")
    print(cur_time_arr)
    cur_time_in_sec=int(cur_time_arr[2])+int(cur_time_arr[1])*60+int(cur_time_arr[0])*3600
    return cur_time_in_sec

from django.db.models import Q

@csrf_exempt
def get_q(request):  
    #expire session on browser close
    request.session.set_expiry(0)   
    print("\n\n--------------------------------------------------------------------")
    if request.method == 'POST' and (check_attend(request) or "qno" in request.session):
        print("----------------get_q----------------------------------------------------")
        if ("qno" not in request.session):
            request.session["qno"]=0
        else:
            request.session["qno"]+=1
        q_str=""
        txt=""
        q_set=[]

        try:
            today=timezone.now()
            print(today)
            exam=Exam.objects.filter(id=(Users.objects.filter(email=request.session["logged_in"]).values())[0]["exam_id"],start_date__lte=today,end_date__gte=today).values()[0]
        except Exception as e:
            print("range: "+str(e))
            return HttpResponse("&range;",content_type="text")
        if ("timer" not in request.session):
            request.session["timer"]=datetime.datetime.now().strftime("%H:%M:%S")
        
        if(time_to_sec(datetime.datetime.now().strftime("%H:%M:%S"))-time_to_sec(request.session["timer"])>exam["duration"]):
            return HttpResponse("&timeout;",content_type="text")
        #set initial score=0 to mark as attended
        
        # print(quetions)     
        #save prepared/shuffled quetion to session

       

        if("quetion_set" not in request.session):
            cursor = connection.cursor()        
            stmt="select q.id,q.question,q.opt1,q.opt2,q.opt3,q.opt4,q.ans,sq.exam_id from smart_selected_questions as sq INNER JOIN smart_questions as q ON  sq.que_id=q.id where sq.exam_id=\'"+str(exam["id"])+"\';"
            cursor.execute(stmt)
            quetions= cursor.fetchall()   
            cursor = connection.cursor()         
            if(len(quetions)<1):
                return HttpResponse("&empty;",content_type="text")
            stmt="UPDATE smart_users SET score = \'0\' WHERE email=\'"+request.session["logged_in"]+"\' and score = \'-1\';"
            cursor.execute(stmt)
            print(stmt+"\nUpdate smart_users:"+str(cursor.rowcount)+"\n")
            cursor.close()
            
            for val in quetions:
                ind_que=list()
                for unescape_col in val:
                    print(unescape_col)
                    ind_que.append(unescape(str(unescape_col)))
                ind_que[1]=str(val[1])
                txt=str(ind_que[0])+"&sep;"+("&sep;".join(ind_que[1:len(ind_que)-1]))
                txt+="&sep;"+str(ind_que[len(ind_que)-1])
                q_str+=txt+"&diff"
            q_set=q_str.split("&diff")
            print("\n prepared quetion saved to session\n")
            request.session["quetion_set"]=q_set[:len(q_set)-1]
            random.shuffle(request.session["quetion_set"])
            print(str(request.session["quetion_set"])+"\n")
        # print("\n"+str(request.session["quetion_set"]))
        if(len(request.session["quetion_set"])>request.session["qno"]):
            quetion_to_be_send=request.session["quetion_set"][request.session["qno"]]
            quetion_to_be_send_arr=quetion_to_be_send.split("&sep;")
            exam_id=quetion_to_be_send_arr[len(quetion_to_be_send_arr)-1]
            #remove answer
            quetion_to_be_send_arr=quetion_to_be_send_arr[:len(quetion_to_be_send_arr)-2]
            quetion_to_be_send="&sep;".join(quetion_to_be_send_arr)
            print(quetion_to_be_send+"&sep;"+str(request.session["qno"]+1)+"&sep;"+str(len(request.session["quetion_set"])))
            
            result_set=Result_set()
            result_set.que_id=quetion_to_be_send_arr[0]
            result_set.user_id=Users.objects.filter(email=request.session["logged_in"]).values()[0]["id"]
            result_set.exam_id=exam_id
            result_set.date_f=datetime.date.today().strftime("%Y-%m-%d")
            result_set.s_time=datetime.datetime.now().strftime("%H:%M:%S")
            result_set.save()
            if result_set!=None:
                print("\nsucess:")
            else:
                print("\nFailed: ")
            # except Exception as e:
            #     print("\ninsert: "+str(e))
            return HttpResponse(quetion_to_be_send+"&sep;"+str(request.session["qno"]+1)+"&sep;"+str(len(request.session["quetion_set"]))+"&sep;"+str(exam["duration"]),content_type="text")
        else:
            return HttpResponse("&end;",content_type="text")
    else:
        return HttpResponse("closed")



from django.db import connection
@csrf_exempt
def ver_q(request):  
    if ("logged_in" in request.session) and (request.session["logged_in"]!=None):
        print("----------------ver_q----------------------------------------------------")
        qid=request.POST.get('id')
        ans=request.POST.get('ans')

        if ("prev_que" not in request.session) or (request.session["prev_que"]==None):
            request.session["prev_que"]=qid
        elif(request.session["prev_que"]==qid):
            print("no inc")
            return HttpResponse("no inc",content_type="text")

        request.session["prev_que"]=qid
        print("Recived from candidate")
        print(str(request.session["qno"])+")"+request.session["logged_in"]+","+str(qid)+","+ans+"\n")

        # print(str(request.session["quetion_set"])+"\n")

        quetion_sent=request.session["quetion_set"][request.session["qno"]]
        quetion_sent_arr=quetion_sent.split("&sep;")
        exam_id=quetion_sent_arr[len(quetion_sent_arr)-1]
        #from stored values in session
        #print(str(quetion_sent_arr)+"\n")
        print("In the DB")
        print("id="+quetion_sent_arr[0]+","+"ans="+quetion_sent_arr[len(quetion_sent_arr)-2]+"\n")

        if ("score" not in request.session):
            request.session["score"]=0   
        try:
            cursor = connection.cursor()
            stmt="UPDATE smart_result_set SET ans = \'"+escape(str(ans))+"\',e_time=\'"+datetime.datetime.now().strftime("%H:%M:%S")+"\' WHERE user_id=\'"+str(Users.objects.filter(email=request.session["logged_in"]).values()[0]["id"])+"\' and  que_id=\'"+str(qid)+"\' and exam_id=\'"+exam_id+"\' ;"
          
            cursor.execute(stmt)
            print("UPDATE smart_result_set: "+str(cursor.rowcount)+"\n")
        except Exception as e:
            print(str(e))

        print("----Current score Before Match: "+str(request.session["score"]))
        if(re.match("^"+re.escape(str(ans))+"$",quetion_sent_arr[len(quetion_sent_arr)-2])):
            request.session["score"]+=1
            print("----Current score After Match:  "+str(request.session["score"]))
            try:
                cursor = connection.cursor()
                exam=Exam.objects.filter(id=(Users.objects.filter(email=request.session["logged_in"]).values())[0]["exam_id"]).values()[0]
                print("---------Exam: "+str(exam))
                stmt="UPDATE smart_users SET score = \'"+str(request.session["score"])+"/"+str(exam["total_marks"])+"\' WHERE email=\'"+request.session["logged_in"]+"\';"
                print(stmt+"\n")
                cursor.execute(stmt)
                print("Update smart_users:"+str(cursor.rowcount)+"\n")
                connection.commit()
                cursor.close()
            except Exception as e:
                print("\n upadte:"+str(e))
            return HttpResponse("inc",content_type="text")
        else:        
            return HttpResponse("no inc",content_type="text")
    else:
            return HttpResponse("Invalid req",content_type="text")


@csrf_exempt
def feedback(request):  
    if("logged_in" in request.session) and (request.session["logged_in"]!=None):
        try:
            cursor = connection.cursor()
            stmt="UPDATE smart_users SET feedback="+str(request.POST.get("feedback"))+" WHERE email=\'"+str(request.session["logged_in"])+"\';"
          
            cursor.execute(stmt)
            print("UPDATE smart_result_set: "+str(cursor.rowcount)+"\n")
            return HttpResponse("update status: "+str(cursor.rowcount),content_type="text")
        except Exception as e:            
            return HttpResponse("update failed",content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")

 

from django.db import connection
@csrf_exempt
def count_malpractices(request):  
    if("logged_in" in request.session) and (request.session["logged_in"]!=None):
        try:
            cursor = connection.cursor()
            stmt="UPDATE smart_users SET malpractices=malpractices+1  WHERE email=\'"+str(request.session["logged_in"])+"\';"
          
            cursor.execute(stmt)
            print("UPDATE smart_result_set: "+str(cursor.rowcount)+"\n")
            return HttpResponse("update status: "+str(cursor.rowcount),content_type="text")
        except Exception as e:            
            return HttpResponse("update failed",content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")
@csrf_exempt
def exam_status(request): 
    if check_attend(request):
        return HttpResponse("open",content_type="text")
    else:
        return HttpResponse("closed",content_type="text")

@csrf_exempt
def exam_logout(request): 
    if("logged_in" in request.session):
        del request.session['qno']
        return HttpResponse("Deleted",content_type="text")
    else:
        return HttpResponse("closed",content_type="text")

@csrf_exempt
def view_res(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if ('exam' in request.POST):
            stmt='''
                    SELECT t1.ID,Username,Score,coding_score AS Score2,total_dur AS 'Total Duration',Feedback from
                    (
                        SELECT 
                            su.id AS ID,
                            su.email AS Username,
                            su.score AS Score,      
                            SUM(IF(q.ans=rs.ans,1,0)) AS score1,
                            SUM(Round(Abs(TIMEDIFF(rs.s_time , rs.e_time)), 0)) AS total_dur,
                            su.coding_score AS coding_score,
                            su.feedback AS Feedback
                
                        FROM smart_result_set AS rs               
                            INNER JOIN smart_questions AS q
                                    ON q.id = rs.que_id 
                            RIGHT JOIN   smart_users AS su
                                    ON su.id = rs.user_id
                            WHERE su.exam_id=\''''+request.POST.get("exam")+'''\'
                            GROUP BY  su.id
                    ) as t1
                    LEFT JOIN
                    (
                        SELECT 
                            su.id AS ID  ,
                            count(*) AS count,
                            SUM(crs.total_testcase_passed) AS score2
    
                        FROM smart_coding_result_set AS crs              
                        INNER JOIN   smart_users AS su
                                ON su.id = crs.user_id
                        WHERE su.exam_id= \''''+request.POST.get("exam")+'''\'
                        GROUP BY  su.id) as t2
                    ON t1.id=t2.id
                    ORDER BY (score1+IF(score2 is NULL,0,score2)) DESC;                   
            '''
          
            return HttpResponse(make_query(stmt),content_type="text")
        else:        
            stmt='''
             SELECT t1.ID,Username,Score,coding_score AS Score2,total_dur AS 'Total Duration',Feedback from
                    (
                        SELECT 
                            su.id AS ID,
                            su.email AS Username,
                            su.score AS Score,      
                            SUM(IF(q.ans=rs.ans,1,0)) AS score1,
                            SUM(Round(Abs(TIMEDIFF(rs.s_time , rs.e_time)), 0)) AS total_dur,
                            su.coding_score AS coding_score,
                            su.feedback AS Feedback
                
                        FROM smart_result_set AS rs               
                            INNER JOIN smart_questions AS q
                                    ON q.id = rs.que_id 
                            RIGHT JOIN   smart_users AS su
                                    ON su.id = rs.user_id
                            GROUP BY  su.id
                    ) as t1
                    LEFT JOIN
                    (
                        SELECT 
                            su.id AS ID  ,
                            count(*) AS count,
                            SUM(crs.total_testcase_passed) AS score2
    
                        FROM smart_coding_result_set AS crs              
                        INNER JOIN   smart_users AS su
                                ON su.id = crs.user_id
                        GROUP BY  su.id) as t2
                    ON t1.id=t2.id
                    ORDER BY (score1+IF(score2 is NULL,0,score2)) DESC;  
            '''
          
            return HttpResponse(make_query(stmt),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

from decimal import Decimal
def default(o):
    if isinstance(o, (datetime.date, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, (datetime.time, datetime.datetime)):
        return o.isoformat()
    if isinstance(o, Decimal):
        return str(o)

# def get_stmt(myregex,fields_dict,dict_arr):
#     temp_arr=[None]*len(dict_arr)
#     temp_str=[None]*len(dict_arr)
#     for val in fields_dict:
#         if(re.search(myregex,val,re.IGNORECASE)):
#             for dict_arr_val in dict_arr:
#                 temp_arr[dict_arr_val].append(dict_arr[dict_arr_val][val])
#     if len(temp_arr[0])>0:
#         for dict_arr_val in dict_arr:
#             temp_str[dict_arr_val]=",".join(temp_arr[dict_arr_val])
#     return temp_str

from collections import OrderedDict 


def make_query(stmt):
    cursor = connection.cursor() 
    try:
        cursor.execute(stmt)
    except:
        return "syntax error"
    det=cursor.fetchall()
    # print(det)
    header=[]
    for val in cursor.description:
        header.append(val[0])
    header_arr=[]
    mylist=[]
    c=0
    for val in det:          
        try:
            c=0
            list1=OrderedDict()
            for value in val:
                list1.update(OrderedDict({cursor.description[c][0]: unescape(str(value))}))
                c+=1
            mylist.append(list1)
        except Exception as e:
            print(str(e))  
    return str(json.dumps(mylist,sort_keys=False,indent=1,default=default))

@csrf_exempt
def view_det_res(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):

        where_case=group_case=order_case=having_case=strict=cond=agg=dist=""
        user_id=request.POST.get("id")
        try:
            dist=request.POST.get("dist")[1:len(request.POST.get("dist"))]
        except:
            pass
        try:
            where_case=request.POST.get("where")[1:len(request.POST.get("where"))]
        except:
            pass
        try:
           group_case=request.POST.get("group")[1:len(request.POST.get("group"))]
        except:
            pass
        try:
           having_case=request.POST.get("having")[1:len(request.POST.get("having"))]
        except:
            pass
        try:
           agg=request.POST.get("agg")[1:len(request.POST.get("agg"))]
        except:
            pass
        try:
            order_case=request.POST.get("order")[1:len(request.POST.get("order"))]
        except:
            pass
        try:
           strict=request.POST.get("strict")[1:len(request.POST.get("strict"))]
        except:
            pass
        
        # having_case=request.POST.get("having")
        
        print("------------\n"+user_id+"\n"+where_case+"\n"+group_case+"\n"+having_case+"\n"+order_case+"\n"+strict)

        sql_var="""
        DECLARE @cnt INT(11),
        DECLARE @txt LONGTEXT
        
        
        """
        fields=""  
        where_con=""
        groups_by=""
        having=""
        orders_by=""
        limits=""

        group_arr=[]
        fields_arr=[]
        order_arr=[]
        where_arr=[]
        having_arr=[]


        fields_dict=dict()
        fields_dict["question"]="q.question"
        fields_dict["correct"]="q.ans AS 'Correct Answers'"
        fields_dict["submitted"]="IF(rs.ans='undefined' or rs.ans='null','-',rs.ans) AS 'Submitted'"
        fields_dict["duration"]=""" ABS(TIMEDIFF(rs.s_time , rs.e_time)) AS 'Duration'"""
        fields_dict["valid"]="IF(q.ans=rs.ans,1,0) AS 'Result'"

        fields_dict["totalduration"]="""SUM(IF(rs.s_time - rs.e_time < rs.s_time,
                Round(Abs(rs.s_time - rs.e_time), 0), '-')) AS 'Total Duration'"""
        fields_dict["totalvalid"]="SUM(IF(q.ans=rs.ans,1,0)) AS 'Total Score'"
        fields_dict["date"]="rs.date_f AS 'Date'"
        fields_dict["category"]="ct.cat AS 'Category'"
        fields_dict["score"]="IF(su.score >= 0, su.score, '-') AS score"
        fields_dict["id"]="rs.user_id AS 'User ID'"
        fields_dict["username"]="user.email AS 'Username'"
        fields_dict["email"]="user.email AS 'Email'"
        fields_dict["exid"]="s_exam.id AS 'Exam ID'"

        field_key=dict()
        field_key["question"]="q.question"
        field_key["correct"]="q.ans"
        field_key["submitted"]="rs.ans"
        field_key["duration"]="rs.s_time,rs.e_time"
        field_key["valid"]="q.ans,rs.ans"
        field_key["date"]="rs.date_f"
        field_key["category"]="ct.cat"
        field_key["score"]="su.score"
        field_key["id"]="rs.user_id"
        field_key["username"]="user.email"
        field_key["email"]="user.email"
        field_key["exid"]="s_exam.id"


        having_dict=dict()
        having_dict["duration"]="""ABS(TIMEDIFF(rs.s_time , rs.e_time))"""
        having_dict["valid"]="IF(q.ans=rs.ans,1,0)"
        having_dict["question"]="q.question"
        having_dict["correct"]="q.ans"
        having_dict["submitted"]="rs.ans"
        having_dict["date"]="rs.date_f"
        having_dict["category"]="ct.cat"
        having_dict["score"]="su.score"
        having_dict["id"]="rs.user_id"
        having_dict["username"]="user.email"
        having_dict["email"]="user.email"
        having_dict["exid"]="s_exam.id"

        agg_dict=dict()
        agg_dict["count"]="COUNT"
        agg_dict["sum"]="SUM"
        agg_dict["max"]="MAX"
        agg_dict["min"]="MIN"
        agg_dict["avg"]="AVG"


  


        if(user_id=="all"):
            fields=fields_dict["username"]+","
        else:
            where_con="WHERE "+field_key["id"]+"='"+user_id+"'"
        fields+="""
            q.question AS Questions,
            q.ans AS  'Correct Answer',
            IF(rs.ans='undefined' or rs.ans='null','-',rs.ans) AS 'Submitted Answer',
            IF(q.ans =rs.ans,'Correct','Wrong') AS 'Result',
            ABS(TIMEDIFF(rs.s_time , rs.e_time)) AS 'Duration(sec)',
            ct.cat AS Category
        """  
        dist_arr=dist.split(" ")
        if group_case!="all" and group_case.strip()!="":
            group_arr=[]
            fields_arr=[]
            myregex="("+group_case.strip().replace(" ","|")+")"
            for val in field_key:
                if(re.search("^"+myregex,val,re.IGNORECASE)):
                    flag=False
                    if(len(dist)>0):
                        for dist_val in dist_arr:
                            if(re.search(dist_val,val,re.IGNORECASE)):
                                flag=True
                                break
                    if flag==True:
                        fields_arr.append("DISTINCT "+(fields_dict[val]))
                    else:
                        fields_arr.append((fields_dict[val]))
                    group_arr.append(field_key[val])
            if len(fields_arr)>0:
                fields=fields_dict["totalvalid"]+","+fields_dict["totalduration"]+","+(",".join(fields_arr))
                groups_by="GROUP BY "+(",".join(group_arr))
        if having_case.strip()!="":
            having_arr=[]
            myregex_arr=having_case.strip().split(",")
            for val in having_dict:
                try:
                    if isinstance(having_arr, list):
                        for myregex in myregex_arr:
                            having_key_val= re.split("[=<>]{1,2}",myregex)
                            gap=len(myregex)-(len(having_key_val[0])+len(having_key_val[1]))
                            symbols=myregex[len(having_key_val[0]):len(having_key_val[0])+gap]
                            print(str(having_key_val)+","+val)
                            if(re.match(having_key_val[0],val,re.IGNORECASE)):                           
                                try:
                                    having_arr.append(agg_dict[agg]+"("+fields_dict[val].split("AS")[0].strip()+")"+symbols+int(having_key_val[1]))
                                except:
                                    having_arr.append(agg_dict[agg]+"("+fields_dict[val].split("AS")[0].strip()+")"+symbols+"'"+having_key_val[1]+"'")
                                
                except Exception as e:
                    print(str(e))
            if len(having_arr)>0:
                having+=" HAVING "+(" and ".join(having_arr))
                print(where_con)
                
        if where_case.strip()!="":
            where_arr=[]
            myregex_arr=where_case.strip().split(",")
            for val in field_key:
                try:
                    if isinstance(myregex_arr, list):
                        for myregex in myregex_arr:
                            where_key_val= re.split("[=<>]{1,2}",myregex)
                            gap=len(myregex)-(len(where_key_val[0])+len(where_key_val[1]))
                            symbols=myregex[len(where_key_val[0]):len(where_key_val[0])+gap]
                            print(str(where_key_val)+","+val)
                            if(re.match(where_key_val[0],val,re.IGNORECASE)):
                                print("matched")
                                if(strict=="yes"):
                                    try:
                                        where_arr.append(fields_dict[val].split("AS")[0].strip()+symbols+str(int(where_key_val[1])))
                                    except Exception as e:
                                        print(str(e))
                                        where_arr.append(fields_dict[val].split("AS")[0].strip()+symbols+"'"+where_key_val[1]+"'")
                                else:
                                    where_arr.append(field_key[val]+" LIKE '%"+where_key_val[1]+"%'")
                except Exception as e:
                    print(str(e))
            if len(where_arr)>0:
                where_con="WHERE "+(" and ".join(where_arr))
                if(user_id!="all"):
                    where_con+=" and "+field_key["id"]+"='"+user_id+"'"
                print(where_con)
        if order_case.strip()!="":
            order_arr=[]
            myregex_arr=order_case.strip().split(",")
            for val in field_key:
                for myregex in myregex_arr:
                    order_val=myregex.split(" ")
                    if len(order_val)>1:
                        print(str(order_val)+","+val)
                        if(re.search(order_val[0],val,re.IGNORECASE)):
                            if(order_val[1]=="desc"):
                                order_arr.append(field_key[val]+" DESC")
                            else:                        
                                order_arr.append(field_key[val]+" ASC")
                    else:
                        if(re.search(order_val[0],val,re.IGNORECASE)):                      
                            order_arr.append(field_key[val]+" ASC")
            if len(order_arr)>0:
                orders_by="ORDER BY "+(",".join(order_arr))


        
            

        #################################################################################
        stmt="""
        SELECT 
        """+fields+"""
        FROM   smart_users AS su
            INNER JOIN smart_result_set AS rs
                    ON su.id = rs.user_id
            INNER JOIN smart_questions AS q
                    ON rs.que_id = q.id
            INNER JOIN smart_categories AS ct
                    ON ct.id = q.cat_id  
            INNER JOIN smart_users AS user
                    ON su.id = user.id    
            INNER JOIN smart_exam AS s_exam
                    ON s_exam.id = rs.exam_id      """
        stmt+=" "+where_con+" "
        stmt+=" "+groups_by+" "
        stmt+=" "+having+" "
        stmt+=" "+orders_by+" "
        stmt+=";"
        print("\n"+stmt+"\n")

        return HttpResponse(make_query(stmt),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

'''
SELECT 
			DISTINCT su.name AS Name,
            su.email AS Username,
            su.score AS Score,
            rs.date_f AS Date,
            s_exam.e_name AS Exam
        
        FROM   smart_users AS su
            INNER JOIN smart_result_set AS rs
                    ON su.id = rs.user_id
            INNER JOIN smart_users AS user
                    ON su.id = user.id    
            INNER JOIN smart_exam AS s_exam
                    ON s_exam.id = rs.exam_id       WHERE rs.user_id='12'       ;
'''


@csrf_exempt
def view_cat_res(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        stmt='''
        SELECT 
            e_name AS Exam,
            total_marks AS 'Total Marks',
            start_date AS Date,
            CEILING(ROUND((duration /60))) AS 'Total Time(Mins)'
                
        FROM   
        smart_exam WHERE id=\''''+request.POST.get("eid")+'''\'
        '''

        print(request.POST.get("eid"))
        data=make_query(stmt)
        print(data)
        try:
            return HttpResponse(data,content_type="text")
        except Exception as e:
            print(str(e))
    else:
        return HttpResponse("Invalid req",content_type="text")

@csrf_exempt
def view_graph(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        # stmt='''
        # SELECT 
        #     s_cat.cat as category,count(*) as count
            
        #     FROM   smart_users AS su
        #         INNER JOIN smart_result_set AS rs
        #                 ON su.id = rs.user_id
        #         INNER JOIN smart_users AS user
        #                 ON su.id = user.id    
        #         INNER JOIN smart_exam AS s_exam
        #                 ON s_exam.id = rs.exam_id  
        #         INNER JOIN smart_questions AS s_que
        #             ON s_que.id = rs.que_id
        #         INNER JOIN smart_categories AS s_cat
        #             ON s_cat.id = s_que.cat_id  
                        
        #                     WHERE su.id=\''''+request.POST.get("id")+'''\' and s_que.ans=rs.ans
        #     GROUP BY(s_que.cat_id )
        # '''
        user_id=request.POST.get("id")
        where_case=""
        strict=""
        try:
            where_case=request.POST.get("where")[1:len(request.POST.get("where"))]
        except:
            pass

        try:
           strict=request.POST.get("strict")[1:len(request.POST.get("strict"))]
        except:
            pass
        where_con=""
        print("where_case:\t"+where_case)

        fields_dict=dict()
        fields_dict["question"]="s_que.question"
        fields_dict["correct"]="s_que.ans AS 'Correct Answers'"
        fields_dict["submitted"]="IF(rs.ans='undefined' or rs.ans='null','-',rs.ans) AS 'Submitted'"
        fields_dict["duration"]=""" ABS(TIMEDIFF(rs.s_time , rs.e_time)) AS 'Duration'"""
        fields_dict["valid"]="IF(s_que.ans=rs.ans,1,0) AS 'Result'"

        fields_dict["totalduration"]="""SUM(IF(rs.s_time - rs.e_time < rs.s_time,
                Round(Abs(rs.s_time - rs.e_time), 0), '-')) AS 'Total Duration'"""
        fields_dict["totalvalid"]="SUM(IF(s_que.ans=rs.ans,1,0)) AS 'Total Score'"
        fields_dict["date"]="rs.date_f AS 'Date'"
        fields_dict["category"]="s_cat.cat AS 'Category'"
        fields_dict["score"]="IF(su.score >= 0, su.score, '-') AS score"
        fields_dict["id"]="rs.user_id AS 'User ID'"
        fields_dict["username"]="su.email AS 'Username'"
        fields_dict["email"]="su.email AS 'Email'"
        fields_dict["exid"]="s_exam.id AS 'Exam ID'"



        field_key=dict()
        field_key["question"]="s_que.question"
        field_key["correct"]="s_que.ans"
        field_key["submitted"]="rs.ans"
        field_key["duration"]="rs.s_time,rs.e_time"
        field_key["valid"]="s_que.ans,rs.ans"
        field_key["date"]="rs.date_f"
        field_key["category"]="s_cat.cat"
        field_key["score"]="su.score"
        field_key["id"]="rs.user_id"
        field_key["username"]="su.email"
        field_key["email"]="su.email"
        field_key["exid"]="s_exam.id"

        if(user_id!="all"):
            where_con="WHERE "+field_key["id"]+"='"+user_id+"'"
       
        if where_case.strip()!="":
            where_arr=[]
            myregex_arr=where_case.strip().split(",")
            for val in field_key:
                try:
                    if isinstance(myregex_arr, list):
                        for myregex in myregex_arr:
                            where_key_val= re.split("[=<>]{1,2}",myregex)
                            gap=len(myregex)-(len(where_key_val[0])+len(where_key_val[1]))
                            symbols=myregex[len(where_key_val[0]):len(where_key_val[0])+gap]
                            print(str(where_key_val)+","+val)
                            if(re.match(where_key_val[0],val,re.IGNORECASE)):
                                print("matched")
                                if(strict=="yes"):
                                    try:
                                        where_arr.append(fields_dict[val].split("AS")[0].strip()+symbols+str(int(where_key_val[1])))
                                    except Exception as e:
                                        print(str(e))
                                        where_arr.append(fields_dict[val].split("AS")[0].strip()+symbols+"'"+where_key_val[1]+"'")
                                else:
                                    where_arr.append(field_key[val]+" LIKE '%"+where_key_val[1]+"%'")
                except Exception as e:
                    print(str(e))
            if len(where_arr)>0:
                where_con="WHERE "+(" and ".join(where_arr))
                if(user_id!="all"):
                    where_con+=" and "+field_key["id"]+"='"+user_id+"'"
                print(where_con)
       
        stmt='''
        SELECT 
            s_cat.cat as category,
 			SUM(IF(s_que.ans=rs.ans,1,0)) AS 'correct',
            SUM(IF(s_que.ans<>rs.ans,1,0)) AS 'wrong' ,
            count(*) AS Total,
            SUM(ABS(TIMEDIFF(rs.s_time , rs.e_time))) AS duration
            
            FROM   smart_users AS su
                INNER JOIN smart_result_set AS rs
                        ON su.id = rs.user_id
                INNER JOIN smart_exam AS s_exam
                        ON s_exam.id = rs.exam_id  
                INNER JOIN smart_questions AS s_que
                    ON s_que.id = rs.que_id
                INNER JOIN smart_categories AS s_cat
                    ON s_cat.id = s_que.cat_id  

                           '''+where_con+'''
            GROUP BY(s_que.cat_id )
        '''
        print("stmt\n"+stmt)
        data=make_query(stmt)
        try:
            return HttpResponse(data,content_type="text")
        except Exception as e:
            print(str(e))
    else:
        return HttpResponse("Invalid req",content_type="text")


@csrf_exempt
def view_res_user(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        stmt='''
        SELECT 
                    DISTINCT su.name AS Name,
                    su.email AS Username,
                    su.score AS Score,
                    rs.date_f AS Date,
                    s_exam.e_name AS Exam
                
                FROM   smart_users AS su
                    INNER JOIN smart_result_set AS rs
                            ON su.id = rs.user_id
                    INNER JOIN smart_users AS user
                            ON su.id = user.id    
                    INNER JOIN smart_exam AS s_exam
                            ON s_exam.id = rs.exam_id       WHERE rs.user_id=\''''+request.POST.get("id")+'''\'
        '''
        return HttpResponse(make_query(stmt),content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

@csrf_exempt
def del_user(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        resp=""
        try:
            int_list=list(map(int,request.POST.get("ids").split(",")))
            for id in int_list:
                cmd="sudo userdel $(grep -oi '^smarthire_user_"+str(id)+"_[0-9][0-9]*' /etc/passwd)"
                print(cmd)
                print("deluser: \t",subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.read().decode())
            print(str(request.POST.get("ids").split(","))+"\n"+str(int_list))
            resp=str(Result_set.objects.filter( user_id__in=int_list ).delete())+"\n"
            resp+=str(Coding_result_set.objects.filter( user_id__in=int_list ).delete())+"\n"
            if re.match("^(127\.0\.0\.1)|localhost",request.get_host()):
                Users.objects.filter(id__in=int_list).update(score='-1')
                Users.objects.filter(id__in=int_list).update(coding_score='-1')
            if request.POST.get("all")=="true":
                resp+=str(Users.objects.filter(id__in=int_list).delete())
            print(resp)
            return HttpResponse("sucess: "+resp,content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("fail",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")


@csrf_exempt
def del_cat(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        int_list=list(map(int,request.POST.get("ids").split(",")))
        print(str(request.POST.get("ids").split(","))+"\n"+str(int_list))
        resp=""
        try:
            que_set=list(Questions.objects.filter(cat_id__in=int_list).values("id"));
            q_id=[val["id"] for val in que_set]
            res_set=Result_set.objects.filter( que_id__in=q_id).values("user_id")
            u_id=[val["user_id"] for val in res_set]
            resp+="uid: "+str(u_id)
            resp+="\nResult_set: "+str(Result_set.objects.filter( user_id__in=u_id).delete())
            resp+="\nCategories :"+str(Categories.objects.filter(id__in=int_list).delete())
            print(resp)
            return HttpResponse(resp,content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("fail",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")


@csrf_exempt
def exam_del(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            int_list=list(map(int,request.POST.get("ids").split(",")))
            status=str(Exam.objects.filter(id__in=int_list).delete())
            return HttpResponse("sucess: "+status,content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("fail",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")


@csrf_exempt
def del_questions(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        int_list=list(map(int,request.POST.get("ids").split(",")))
        print(str(request.POST.get("ids").split(","))+"\n"+str(int_list))
        resp=""
        try:
            if(request.POST.get("from")=="all"):
                print("--from all")
                resp=str(Questions.objects.filter(id__in=int_list ).delete())+"\n"
            else:
                print("--from selected que")
                resp=str(Selected_questions.objects.filter(que_id__in=int_list ).delete())+"\n"
            print(resp)
            return HttpResponse("sucess: "+resp,content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("fail",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")

# sent_emails=list()
manager=Manager()
# sent_emails=manager.list()
email_sending_status=False
email_delivery_status=list()
thread_stop=False


def add_mails(status):
    try:
        email_status_obj=Email_status()
        email_status_obj.status=status
        print(email_status_obj.save())
    except Exception as e:
        print(str(e))



def get_inbox_mails(mail_id,request): 
    global email_delivery_status,thread_stop
    try:
        # print("---Start---",threading.current_thread().ident)
        mail = imaplib.IMAP4_SSL(IMAP_SERVER,993)
        mail.login(EMAIL_HOST_USER,EMAIL_HOST_PASSWORD)
        # for i in mail.list()[1]:
        #     print(i)
        # mail.select('inbox')
        mail.select('"[Gmail]/All Mail"')
        #get sent mail first
        type2, data2 = mail.search(None, 'To', mail_id)
        #get its delivery status
        typ, data = mail.search(None, 'FROM', "mailer-daemon@googlemail.com", 'BODY',mail_id)
        # type, data = mail.search(None,  'All')
        # type, data = mail.search(None, 'SUBJECT', 'Smart hire from terralogic')

        id_list = list(data[0].split())
        total=len(id_list)           
        print(mail_id,"delivary total: ",total) 
        print(mail_id,"send_to total: ",len(list(data2[0].split())))
        if len(list(data2[0].split()))==0 or len(id_list)>0:
            Users.objects.filter(email=mail_id).update(email_sent_status=False)
        else:
            Users.objects.filter(email=mail_id).update(email_sent_status=True)             
        if len(id_list)==0:
            print("--------------------No mails--Thread aborted...")
            mail.close()
            mail.logout()
            return False
        for i in id_list:
            if thread_stop:
                print("------------------------------Thread aborted...")
                break
            typ, data = mail.fetch(str(i.decode()), '(RFC822)' )
            for response_part in data:
                if isinstance(response_part, tuple):
                    try:                        
                        msg = email.message_from_string(response_part[1].decode())
                        # txt+=(str(msg.__dict__))+"\n\n"
                        # if("terralogic.smarthire@gmail.com"==msg["To"]):
                        #     continue
                        txt=msg["X-Failed-Recipients"]+"\t"
                        txt+=msg[ 'Date']
                        # print(txt)
                        email_delivery_status.append(txt)
                    except Exception as e:
                        print(mail_id+"-"+str(e))
        mail.close()
        mail.logout()
        # print("---End---",threading.current_thread().ident)
    except Exception as e:
        print("get_inbox_mails-"+str(e))

def delete_mail_delivery_status(mail_id):
    try:
        mail = imaplib.IMAP4_SSL(IMAP_SERVER,993)
        mail.login(EMAIL_HOST_USER,EMAIL_HOST_PASSWORD)
        mail.select('"[Gmail]/All Mail"')
        typ, data = mail.search(None, 'FROM', "mailer-daemon@googlemail.com", 'BODY',mail_id)
        # type, data = mail.search(None, 'SUBJECT', 'Smart hire from terralogic')
        id_list = data[0].split()  
        total=len(id_list)
        print("del delivery total: ",total) 
        for i in id_list:
            typ, data = mail.fetch(str(i.decode()), '(RFC822)' )
            for response_part in data:
                if isinstance(response_part, tuple):
                    try:
                        msg = email.message_from_string(response_part[1].decode())
                        if msg["X-Failed-Recipients"]==None:
                            continue
                        print("deleting1... "+msg["X-Failed-Recipients"])
                        mail.store(i, '+FLAGS', '\\Deleted')
                    except Exception as e:
                        print("deleting1: "+str(e))
        print("Delete status1:  ",mail.expunge())
        mail.close()
        mail.logout()
    except Exception as e:
        print("delete_mail_delivery_status-"+str(e))


def delete_mail(mail_id):
    try:
        mail = imaplib.IMAP4_SSL(IMAP_SERVER,993)
        mail.login(EMAIL_HOST_USER,EMAIL_HOST_PASSWORD)
        mail.select('"[Gmail]/All Mail"')
        typ, data = mail.search(None, 'To', mail_id)
        # type, data = mail.search(None, 'SUBJECT', 'Smart hire from terralogic')
        id_list = data[0].split()  
        total=len(id_list)
        print("del all total: ",total) 
        for i in id_list:
            typ, data = mail.fetch(str(i.decode()), '(RFC822)' )
            for response_part in data:
                if isinstance(response_part, tuple):
                    try:
                        msg = email.message_from_string(response_part[1].decode())
                        mail.store(i, '+X-GM-LABELS', '\\Trash')
                        print("deleting2... ",msg["To"])
                    except Exception as e:
                        print("deleting2: "+str(e))
        print("Move to trash status2:  ",mail.expunge())
        mail.select('[Gmail]/Trash')  # select all trash
        mail.store("1:*", '+FLAGS', '\\Deleted')  #Flag all Trash as Deleted
        print("delete from trash status2:  ",mail.expunge())
        mail.close()
        mail.logout()
    except Exception as e:
        print("delete_mail-"+str(e))

threads=list()

def check_email_status(request):
    global thread_stop,threads
    email_delivery_status.clear()
    users=Users.objects.all().values()
    # if len(threads)>=len(users):
    #     thread_stop=True
    #     threads.clear()
    thread_stop=True
    time.sleep(1)
    thread_stop=False
    ind=0
    for thread in threads:
        if not thread.isAlive():
            threads.pop(ind)
        ind+=1
    for user in users:
        threads.append(threading.Thread(target=get_inbox_mails, args=(user['email'],request,)))
    for thread in threads:
        try:
            if not thread.isAlive():
                thread.start()
        except Exception as e:
            print("email status: "+str(e))
    # for thread in threads:
    #     thread.join()

@csrf_exempt
def retrive_email_status(request):
    global email_delivery_status
    if ("admin" in request.session) and (request.session["admin"]!=None):
        check_email_status(request)
        return HttpResponse("Welcome",content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")

@csrf_exempt
def email_status_in_db(request):
    global email_delivery_status
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if not 'quick' in request.POST:
            check_email_status(request)
        if 'exam' in request.POST and request.POST.get("exam")!=None and request.POST.get("exam")!="undefined":
            print("exam",request.POST.get("exam"))
            return HttpResponse(json.dumps([dict(item) for item in Users.objects.filter(email_sent_status=False,exam_id=request.POST.get("exam")).values('email','exam')]),content_type="text")
        return HttpResponse(json.dumps([dict(item) for item in Users.objects.filter(email_sent_status=False).values('email','exam')]),content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")


@csrf_exempt
def send_cred(request):
    global email_sending_status
    if  request.method == 'POST':
        if ("admin" in request.session) and (request.session["admin"]!=None) and ('exam' in request.POST):
            if email_sending_status:
                add_mails("Already a user sending emails,wait until all email were sent")
                return HttpResponse("Already a user sending emails,wait until all email were sent",content_type="text")
            # # sent_emails.clear()
            # sent_emails[:]=[]
            add_mails("Sending email...")
            Email_status.objects.all().delete()
            email_sending_status=True
            try:
                
                if 'all' in request.POST:
                    Users.objects.filter(exam=request.POST.get("exam")).update(email_sent_status=False)
                    users=Users.objects.filter(exam=request.POST.get("exam")).values()
                    print("sending all...")
                else:
                    users=Users.objects.filter(exam=request.POST.get("exam"),email_sent_status=False).values()
                    print("sending failed...")

                for row in users:  
                    print(row) 
                    mythread=threading.Thread(target=delete_mail_delivery_status, args=(row["email"],))
                    mythread.start()
                    mythread.join()
                    try:
                        enc_pwd=base64.b64decode(row["password"].encode())
                    except Exception as e:
                        print(str(e))
                        continue
                    obj = AES.new(KEY, AES.MODE_CBC, 'This is an IV456')
                    pwd=str(obj.decrypt(enc_pwd).decode("utf-8"))            
                    body="""
                        <h2>Your Credentials are:</h2>
                        <div style='font-size:15px;'>
                            <b>Email: </b><span style='color:red'>"""+row["email"]+"""</span><br />
                            <b>Password: </b><span style='color:red'><i>"""+pwd[:6]+"""</i></span><br />
                            <a href='http://"""+request.get_host()+"""/#/?email="""+row["email"]+"""'>Click here to start Exam</a><br />
                        </div>
                    """
                    # print(body)
                    for i in range(5):
                        try:
                            email=EmailMultiAlternatives('Smart hire from Terralogic',"Exam date dd/mm/yyyy" ,"terralogic.smarthire@gmail.com", to=[row["email"]])
                            email.attach_alternative(body, "text/html")
                            threading.Thread(target=delete_mail, args=(row["email"],)).start()
                            if(str(email.send())=="1"):
                                add_mails("Sent :"+"\t"+datetime.datetime.today().strftime("%Y-%m-%d %H:%M:%S")+"\t"+row["email"])
                                break  
                            else:
                                add_mails("Retrying "+str(i)+" :"+"\t"+datetime.datetime.today().strftime("%Y-%m-%d %H:%M:%S")+"\t"+row["email"])   
                                time.sleep(5)
                        except Exception as e:
                            print(str(e))
                            add_mails("Retrying.. "+str(i)+" :"+"\t"+datetime.datetime.today().strftime("%Y-%m-%d %H:%M:%S")+"\t"+row["email"])
                          
                add_mails("All mail are sent.")
                time.sleep(10)
                check_email_status(request)
                email_sending_status=False
                return HttpResponse("Mail sent successfully",content_type="text")
            except Exception as e:
                print("-------------Main Exce "+str(e))
                email_sending_status=False
                return HttpResponse("fail",content_type="text")
        else:
            return HttpResponse("Invalid user",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")




@csrf_exempt
def sent_cred(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        data=""
        status_val=Email_status.objects.all().values()
        if len(status_val)>0: 
            data=""
            for val in status_val:
                data+="data:"+val['status']+"\n"
            data+="data: \n\n"
        else:
            data="data:  \n\n"
        print(data)
        return HttpResponse(data,content_type='text/event-stream')
    else:
        print("Only for admin\n")
        return HttpResponse("data: Only for admin\n\n",content_type='text')

@csrf_exempt
def cur_email_status(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        data=""
        global email_delivery_status
        if len(email_delivery_status)>0: 
            data=""
            for val in list(set(email_delivery_status)):
                data+="data:"+val+"\n"
        else:
            data="data: Email Status: \n"
        data+="data: \n\n"
        print(data)
        return HttpResponse(data,content_type='text/event-stream')
    else:
        print("Only for admin\n")
        return HttpResponse("data: Only for admin\n\n",content_type='text')

from django.core.files.storage import FileSystemStorage

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+"/../"
MEDIA_URL = './uploads/'
UPLOAD_DIR = os.path.abspath(os.path.join(BASE_DIR, MEDIA_URL))


def upload(myfile):
    os.system("sudo chown -R :www-data "+UPLOAD_DIR)
    os.system("sudo chmod 777 -R "+UPLOAD_DIR)
    fs = FileSystemStorage(location=UPLOAD_DIR)
    filename = fs.save(myfile.name, myfile)
    os.system("sudo chmod 777 -R "+UPLOAD_DIR)
    return fs.url(filename)

@csrf_exempt
def get_temp_update(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if(request.session["temp_update"]!=None):
            return HttpResponse(request.session["temp_update"],content_type="text")
        else:
            return HttpResponse("No updates",content_type="text")           
    else:
        return HttpResponse("Only admin can",content_type="text")

import xlrd 
def read_excel(file):
    wb = xlrd.open_workbook(BASE_DIR+file) 
    sheet = wb.sheet_by_index(0) 
    sheet.cell_value(0, 0) 
    data=list()
    for i in range(1,sheet.nrows): 
        temp=list()
        for j in range(sheet.ncols): 
            temp.append(sheet.cell_value(i, j))
        data.append(temp)
    return data

@csrf_exempt
def bulk_reg(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if request.method == 'POST' and request.FILES['file']:
            if(not request.FILES['file'].name.lower().endswith(('.xls', '.xlsx'))):
                return HttpResponse("Invalid file format",content_type="text")
            uploaded=upload(request.FILES['file'])
            resp=str(uploaded)
            try:
                data=read_excel(uploaded)
                # resp+="\n"+str(data)
                if not request.POST._mutable:
                    request.POST._mutable = True
                for val in data:
                    if len(val)>=2 and len(val)<=3:
                        request.POST["name"]=val[0]
                        request.POST["email"]=val[1]
                        if len(val)==3:
                            request.POST["exam"]=Exam.objects.filter(e_name=val[2]).values("id")[0]["id"] 
                        responce=user_signup(request).__dict__
                        resp+="\n"+val[1]+" : "+"".join(responce["_iterator"])
                        request.session["temp_update"]=resp
                    else:
                        resp+="\nInvalid data format"
                request.session["temp_update"]=""
                return HttpResponse( resp,content_type="text")
            except Exception as e:
                return HttpResponse(resp+"\n"+str(e),content_type="text")
        else:            
            return HttpResponse("Invalid type of Req",content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")


@csrf_exempt
def bulk_que(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if request.method == 'POST' and request.FILES['file']:
            if(not request.FILES['file'].name.lower().endswith(('.xls', '.xlsx'))):
                return HttpResponse("Invalid file format",content_type="text")
            uploaded=upload(request.FILES['file'])
            resp=str(uploaded)
            try:
                data=read_excel(uploaded)
                # resp+="\n"+str(data)
                if not request.POST._mutable:
                    request.POST._mutable = True
                for val in data:
                    if len(val)>=7 and len(val)<=8:
                        request.POST["quetions"]=val[0]
                        request.POST["formated_para"]=val[1]
                        if val[1]=="" or val[1]=="-" or val[1].lower()=="null" or val[1].lower()=="none":
                            request.POST["formated_para"]="nothing"
                        request.POST["opt1"]=val[2]
                        request.POST["opt2"]=val[3]
                        request.POST["opt3"]=val[4]
                        request.POST["opt4"]=val[5]
                        request.POST["ans"]=val[int(val[6])+1]
                        if len(val)==8 and val[7]!="":
                            request.POST["cat"]=val[7]
                        responce=addque(request).__dict__
                        que_len=len(val[0])
                        if que_len>100:
                            que_len=100
                        resp+="\n"+val[0][:que_len-1]+" : "+"".join(responce["_iterator"])
                       
                    else:
                        resp+="\nInvalid data format"
                    request.session["temp_update"]=resp
                request.session["temp_update"]=""
                return HttpResponse( resp,content_type="text")
            except Exception as e:
                return HttpResponse(resp+"\n"+str(e),content_type="text")
        else:            
            return HttpResponse("Invalid type of Req",content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")


import subprocess,os

def run_cmd(cmd):
    # print(cmd)
    return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.read().decode()


def run_code(command,code,username,inputs=None,args="",pgm_dir="",pgm_name="pgm"):
    print("command: ",command)
    txt=""
    path="/temp"
    user_home=path+"/"+username
    print("username: "+username)
    print(run_cmd("sudo mkdir "+path))
    print(run_cmd("sudo chmod 777 "+path))
    # print(run_cmd("sudo mount -t tmpfs -o size=100m myramdisk "+path))
    print(run_cmd("sudo mkdir "+user_home))
    print(run_cmd("sudo useradd -r -m "+username+" -d "+user_home))
    print(run_cmd("sudo passwd -l "+username))
    print(run_cmd("sudo mkdir "+user_home+"/"+pgm_dir))
    print(run_cmd("sudo chown "+username+":www-data -R "+user_home))
    print(run_cmd("sudo chmod 771 -R "+user_home))
    # print(run_cmd("sudo ls -l -R "+path+" && sudo tree "+path))
    pre_cmd=""
    if(inputs!=None and len(inputs)!=0):
        pre_cmd="printf \""+inputs+"\" | "
    cmd=""
    ext=""
    file_name=user_home+"/"+pgm_dir+pgm_name+"."
    if command=='cpp':
        file_name+="cpp"
        cmd="g++ "+file_name+" -o "+user_home+"/a.out && "+pre_cmd+user_home+"/a.out"+" "+args
    elif command=='java':
        file_name+="java"
        cmd="javac "+file_name+" && cd "+user_home+"/"+pgm_dir+" && "+pre_cmd+" java "+pgm_name+" "+args
    elif command=='py':
        file_name+="py"
        cmd=pre_cmd+"python "+file_name+" "+args
    elif command=='py3':
        file_name+="py"
        cmd=pre_cmd+"python3 "+file_name+" "+args
    elif command=='js':
        file_name+="js"
        cmd=pre_cmd+"node "+file_name+" "+args
    else:
        cmd="echo 'Invalid command: "+command+"'"

    # code=re.sub("\s*public\s+class\s+[a-zA-Z0-9]+\s*{","public class pgm{",code)
    
    f = open(file_name, "w")
    f.write(code)
    f.close()
    # print(run_cmd("sudo chown "+username+":www-data -R "+user_home))
    # print(run_cmd("sudo chmod 771 -R "+user_home))
   
    # cmd="sudo login -f students & "+cmd
    cmd="cd "+user_home+"/"+pgm_dir+" && sudo su "+username+" -c '"+cmd+"'"
    # os.system("sudo chmod 777 "+file_name)           
    print(cmd)
    # print("Code: \n"+code)
    txt="\n"+run_cmd(cmd)
    # print(run_cmd("tree "+path+" && ls -l -R "+user_home))
    # print(txt)
    return txt

@csrf_exempt
def get_expected_output(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        out=escape(run_code(request.POST["cmd"],request.POST["code"],"validater",request.POST["inputs"]))
        return HttpResponse(out,content_type="text")
    else:
        return HttpResponse("Only admin can",content_type="text")

@csrf_exempt
def get_code_que(request):
    if ("logged_in" in request.session):
        try:
            today=timezone.now()
            print(today)
            exam=Exam.objects.filter(id=(Users.objects.filter(email=request.session["logged_in"]).values())[0]["exam_id"],start_date__lte=today,end_date__gte=today).values()[0]
        except Exception as e:
            print("range: "+str(e))
            return HttpResponse("&range;",content_type="text")
        user=Users.objects.filter(email=request.session["logged_in"]).values("id","exam")[0]
        username="smarthire_user_"+str(user["id"])+"_"+str(user["exam"])
        if "que_cnt" not in request.session:
            request.session["que_cnt"]=0
        if "selected_code_questions" not in request.session or ("selected_code_questions"  in request.session and len(request.session["selected_code_questions"])<1):
            cursor = connection.cursor()        
            stmt="SELECT q.id,q.pbm_stmt,q.code,q.lang,q.example_input,q.test_input1,q.test_input2,q.test_input3,q.test_input4,q.expected_output1,q.expected_output2,q.expected_output3,q.expected_output4 FROM smart_code_questions as q INNER JOIN smart_selected_code_questions as sq on q.id=sq.code_questions_id WHERE sq.exam_id=\'"+str(user["exam"])+"\' order by RAND();"
            cursor.execute(stmt)
            request.session["selected_code_questions"]= cursor.fetchall()   
        if request.session["que_cnt"]<len(request.session["selected_code_questions"]):
            cur_que=request.session["selected_code_questions"][request.session["que_cnt"]]
            quetions_to_be_send=""
            quetions_to_be_send+=cur_que[1]+"&sep;"
            quetions_to_be_send+=cur_que[4]+"&sep;"
            quetions_to_be_send+=run_code(cur_que[3],unescape(cur_que[2]),"validater",cur_que[4],"",username+"/")
            print(quetions_to_be_send)
            try:
                crs=Coding_result_set()
                crs.user_id=int(user["id"])
                crs.code_questions_id=int(cur_que[0])
                crs.exam_id=int(user["exam"])
                crs.s_time=datetime.datetime.now().strftime("%H:%M:%S")
                crs.save()
            except Exception as e:
                print(str(e))
            return HttpResponse(quetions_to_be_send,content_type="text")
        else:
            return HttpResponse("&end;",content_type="text")
       
        return HttpResponse("nothing",content_type="text")
    else:
        return HttpResponse("No user logged in",content_type="text")

@csrf_exempt
def ver_code_que(request):
    txt="Welcome: \n"+request.get_host()+"\n"
    if ("admin" in request.session) and (request.session["admin"]!=None):
        print("admin\t",request.POST["code"])
        txt+="as an Admin\n"
        txt+="\n"+request.POST["code"]
        txt+="\n"+subprocess.Popen(request.POST["code"], shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.read().decode()
    elif ("logged_in" in request.session):
        if request.method == 'POST' and  (check_code_attend(request) or "que_cnt" in request.session):
            if re.match("^(c|cpp|java|py|py3|js|cat)$",request.POST["cmd"]):
                # sudo login -f students
                txt+="as an "+request.session["logged_in"]+"\n"
                user=Users.objects.filter(email=request.session["logged_in"]).values("id","exam")[0]
                username="smarthire_user_"+str(user["id"])+"_"+str(user["exam"])
                if request.session["que_cnt"]<len(request.session["selected_code_questions"]):
                    cur_que=request.session["selected_code_questions"][request.session["que_cnt"]]
                    actual_output=""
                    score=0
                    if("inputs" in request.POST):
                        if (len(cur_que[4])>=1 and len(request.POST["inputs"])>=1) or len(cur_que[4])<1:
                            expected_output=escape(run_code(cur_que[3],unescape(cur_que[2]),"validater",cur_que[4],"",username+"/"))
                            actual_output=escape(run_code(request.POST["cmd"],request.POST["code"],username,cur_que[4],request.POST["arg"]))
                            if expected_output==actual_output:
                                score+=1
                            for i in range(5,9):
                                try:
                                    expected_output=escape(cur_que[i+4])
                                    actual_output=escape(run_code(request.POST["cmd"],request.POST["code"],username,cur_que[i],request.POST["arg"]))               
                                    if expected_output.strip()==actual_output.strip():
                                        score+=1
                                except Exception as e:
                                    print(str(e))   
                            actual_output=run_code(request.POST["cmd"],request.POST["code"],username,request.POST["inputs"],request.POST["arg"])      
                        else:
                            txt+="Input is needed\n"      
                    expected_output=run_code(cur_que[3],cur_que[2],"validater",cur_que[4],"",username+"/")     
                    data={}
                    data["user"]=txt
                    data["qno"]=request.session["que_cnt"]
                    data["output"]=actual_output
                    data["score"]=score
                    txt=json.dumps(data)
                    if "coding_score" not in request.session:
                        request.session["coding_score"]=0
                    request.session["coding_score"]+=score
                    e_time=datetime.datetime.now().strftime("%H:%M:%S")
                    Coding_result_set.objects.filter(code_questions=int(cur_que[0])).update(user_code=escape(request.POST["code"]),lang=request.POST["cmd"],e_time=e_time,total_testcase_passed=score)
                else:
                    txt="&end;"

            else:
                cmd="echo 'invalid cmd'"
        else:
            txt="&closed;"
    else:
        txt+="No user logged in"
    # que = Questions.objects.all().values()
    # for q in que:
    #     txt+=str(q["id"])+" Q:"+str(Questions.objects.filter(id=q["id"]).update(question="<div>"+escape(q["question"][5:len(q["question"])-6])+"</div>"))
    #     txt+="\n"
    #     txt+=str(q["id"])+" opt1:"+str(Questions.objects.filter(id=q["id"]).update(opt1=escape(q["opt1"])))
    #     txt+="\n"
    #     txt+=str(q["id"])+" opt2:"+str(Questions.objects.filter(id=q["id"]).update(opt2=escape(q["opt2"])))
    #     txt+="\n"
    #     txt+=str(q["id"])+" opt3:"+str(Questions.objects.filter(id=q["id"]).update(opt3=escape(q["opt3"])))
    #     txt+="\n"
    #     txt+=str(q["id"])+" opt4:"+str(Questions.objects.filter(id=q["id"]).update(opt4=escape(q["opt4"])))
    #     txt+=str(q["id"])+" ans:"+str(Questions.objects.filter(id=q["id"]).update(ans=escape(q["ans"])))
    #     txt+="\n"
    #     txt+="\n\n"
    # get_inbox_mails("cxg@fg.fygdrt",request)
    return HttpResponse(txt,content_type="text")



@csrf_exempt
def submit_code(request):
    if ("logged_in" in request.session):
        print("----------------next que--------------------")
        if request.session["que_cnt"]<len(request.session["selected_code_questions"]) and "coding_score" in request.session:
            Users.objects.filter(email=request.session["logged_in"]).update(coding_score=str(request.session["coding_score"])+"/"+str(5*len(request.session["selected_code_questions"])))        
        cur_que=request.session["selected_code_questions"][request.session["que_cnt"]]
        e_time=datetime.datetime.now().strftime("%H:%M:%S")
        Coding_result_set.objects.filter(code_questions=int(cur_que[0])).update(e_time=e_time)
        if "que_cnt" not in request.session:
            request.session["que_cnt"]=0
        else:
            request.session["que_cnt"]+=1
        return HttpResponse("next \n",content_type="text")
    else:
        return HttpResponse("No user logged in: \n",content_type="text")
 

def check_code_attend(request):  
    # user = Users.objects.filter(email=request.session["logged_in"],coding_score="-1").values()
    user=Coding_result_set.objects.filter(user_id=(Users.objects.filter(email=request.session["logged_in"]).values())[0]["id"])  
    return not len(user)>0


@csrf_exempt
def code_exam_status(request): 
    if check_code_attend(request):
        return HttpResponse("open",content_type="text")
    else:
        return HttpResponse("closed",content_type="text")

@csrf_exempt
def code_exam_logout(request): 
    if("logged_in" in request.session):
        del request.session['qno']
        return HttpResponse("Deleted",content_type="text")
    else:
        return HttpResponse("closed",content_type="text")

@csrf_exempt
def video_stream(request):
    print("post",request.POST)
    print("get",request.GET)

@csrf_exempt
def addcode(request):      
    if ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            code_que = Code_questions()
            code_que.pbm_stmt=request.POST.get("pblm_stmt")
            code_que.code=escape(request.POST.get("code"))
            code_que.lang=request.POST.get("lang")
            code_que.example_input=request.POST.get("sample_input")
            code_que.test_input1=request.POST.get("t_inp_1")
            code_que.test_input2=request.POST.get("t_inp_2")
            code_que.test_input3=request.POST.get("t_inp_3")
            code_que.test_input4=request.POST.get("t_inp_4")
            code_que.expected_output1=request.POST.get("exp_out_1")
            code_que.expected_output2=request.POST.get("exp_out_2")
            code_que.expected_output3=request.POST.get("exp_out_3")
            code_que.expected_output4=request.POST.get("exp_out_4")
            code_que.save()
            if code_que!=None:
                return HttpResponse("success",content_type="text")
            else:
                return HttpResponse("Failed",content_type="text")     
        except Exception as e:
            print(str(e))
            return HttpResponse("Failed",content_type="text")   
    else:
        return HttpResponse("invalid req",content_type="text")


@csrf_exempt
def view_code_res(request):      
    if ("admin" in request.session) and (request.session["admin"]!=None):
        if request.method == 'POST':
            stmt='''
            SELECT 
                cq.pbm_stmt AS 'Probleom statement',
                crs.user_code AS 'User code',
                crs.lang 'Programming language',
                crs.total_testcase_passed AS "Number of testcase passed",
                ABS(TIME_TO_SEC(crs.e_time)-TIME_TO_SEC(crs.s_time)) AS 'Duration'

            FROM smart_coding_result_set AS crs
                INNER JOIN smart_code_questions AS cq
                    ON cq.id=crs.code_questions_id
                INNER JOIN smart_users su
                    ON su.id=crs.user_id
                WHERE su.id=\''''+request.POST.get("id")+'''\'

            '''

            return HttpResponse(make_query(stmt),content_type="text")
        else:
            return HttpResponse("Invalid req",content_type="text")
    else:
        return HttpResponse("Only for admin",content_type="text")


    
@csrf_exempt
def add_code_que_set(request):  
    if  request.method == 'POST' and ("admin" in request.session) and (request.session["admin"]!=None):
        try:
            print(request.POST.get("exam"),request.POST.get("total"),request.POST.get("dur"))
            try:
                Selected_code_questions.objects.filter(exam_id=request.POST.get("exam")).delete()
            except Exception as e:
                print(str(e))
            cursor = connection.cursor()     
            stmt="select id from smart_code_questions order by RAND() LIMIT "+str(request.POST.get("total"))+";"
            print(stmt)
            cursor.execute(stmt)
            questions= cursor.fetchall() 
            print(questions)
            for val2 in questions:
                selected_questions=Selected_code_questions()
                selected_questions.code_questions_id=val2[0]
                selected_questions.exam_id=request.POST.get("exam")
                cursor = connection.cursor()
                duration=abs(int(request.POST.get("dur")))*60
                stmt="UPDATE smart_exam SET code_duration = \'"+str(duration)+"\',code_total_marks = \'"+str(len(questions)*5)+"\' WHERE id=\'"+request.POST.get("exam")+"\';"
                cursor.execute(stmt)
                cursor.close()
                try:
                    selected_questions.save()
                except:
                    pass  
            return HttpResponse("Exam Populated",content_type="text")  
        except Exception as e:
            return HttpResponse("Enter valid details",content_type="text")  
    else:
        return HttpResponse("Invalid req",content_type="text")  

@csrf_exempt
def list_code_questions(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        stmt='''
        SELECT 
            id,pbm_stmt,code,lang,example_input,test_input1,test_input2,test_input3,test_input4 
        FROM 
            smart_code_questions
        '''
        return HttpResponse(make_query(stmt),content_type="text")
    else:
        return HttpResponse("Only for admin",content_type="text")

@csrf_exempt
def del_code_questions(request):
    if ("admin" in request.session) and (request.session["admin"]!=None):
        int_list=list(map(int,request.POST.get("ids").split(",")))
        print(str(request.POST.get("ids").split(","))+"\n"+str(int_list))
        resp=""
        try:
            resp=str(Code_questions.objects.filter(id__in=int_list ).delete())+"\n"
            return HttpResponse("sucess: "+resp,content_type="text")
        except Exception as e:
            print(str(e))
            return HttpResponse("fail",content_type="text")
    else:
        return HttpResponse("Invalid req",content_type="text")