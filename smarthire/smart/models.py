from django.db import models

# Create your models here.
class Admin_users(models.Model):
    id = models.AutoField(primary_key=True)
    name=models.CharField(max_length=32, blank=False)
    email=models.EmailField(unique=True, blank=False)
    password=models.CharField(max_length=70, blank=False)
    super_admin=models.BooleanField(blank=False,default=False)
    

class Exam(models.Model):
    id = models.AutoField(primary_key=True)
    e_name=models.CharField(max_length=32, blank=False,unique=True)
    start_date=models.DateTimeField()
    end_date=models.DateTimeField(blank=False)
    duration=models.IntegerField(blank=False,default=0)
    total_marks=models.IntegerField(blank=False,default=60)
    code_duration=models.IntegerField(blank=False,default=0)
    code_total_marks=models.IntegerField(blank=False,default=60)

# Create your models here.
class Users(models.Model):
    id = models.AutoField(primary_key=True)
    name=models.CharField(max_length=32, blank=False)
    email=models.EmailField(unique=True, blank=False)
    password=models.CharField(max_length=70, blank=False)
    score=models.CharField(max_length=5,blank=False,default=-1)
    coding_score=models.CharField(max_length=5,blank=False,default=-1)
    exam= models.ForeignKey(Exam,on_delete=models.CASCADE,default="null")  
    malpractices=models.IntegerField(blank=False,default=0)   
    email_sent_status=models.BooleanField(blank=False,default=False)
    feedback=models.IntegerField(blank=False,default=0) 

class Categories(models.Model):
    id = models.AutoField(primary_key=True)
    cat=models.CharField(max_length=200, blank=False,unique=True)

# Create your models here.
class Questions(models.Model):
    id = models.AutoField(primary_key=True)
    question=models.TextField(blank=False)
    opt1=models.TextField( blank=False)
    opt2=models.TextField( blank=False)
    opt3=models.TextField( blank=False)
    opt4=models.TextField( blank=False)
    ans=models.TextField(blank=False)
    # marks=models.TextField(blank=False,default="1")
    cat = models.ForeignKey(Categories, on_delete=models.CASCADE)
    

class Selected_questions(models.Model): 
    exam= models.ForeignKey(Exam,on_delete=models.CASCADE)  
    que= models.ForeignKey(Questions, on_delete=models.CASCADE)  
    class Meta:
        unique_together = (('exam', 'que'),)

class Result_set(models.Model): 
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    exam= models.ForeignKey(Exam, on_delete=models.CASCADE)  
    que = models.ForeignKey(Questions, on_delete=models.CASCADE)  
    ans=models.TextField(blank=True,default="null")
    date_f=models.DateField(blank=False)
    s_time=models.TimeField(blank=False)
    e_time=models.TimeField(blank=True,default="00:00:00")
    class Meta:
        unique_together = (('exam', 'que','user'),)

class Code_questions(models.Model):
    id = models.AutoField(primary_key=True)
    pbm_stmt=models.TextField(blank=True)
    code=models.TextField(blank=True)
    lang=models.CharField(max_length=255,blank=True,default="java")
    example_input=models.TextField(blank=True)
    test_input1=models.TextField(blank=True)
    test_input2=models.TextField(blank=True)
    test_input3=models.TextField(blank=True)
    test_input4=models.TextField(blank=True)
    expected_output1=models.TextField(blank=True)
    expected_output2=models.TextField(blank=True)
    expected_output3=models.TextField(blank=True)
    expected_output4=models.TextField(blank=True)



class Selected_code_questions(models.Model):
    id = models.AutoField(primary_key=True)
    exam=models.ForeignKey(Exam,on_delete=models.CASCADE)  
    code_questions = models.ForeignKey(Code_questions, on_delete=models.CASCADE)
    class Meta:
        unique_together = (('exam', 'code_questions'),)


class Coding_result_set(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    code_questions = models.ForeignKey(Code_questions, on_delete=models.CASCADE)
    exam= models.ForeignKey(Exam, on_delete=models.CASCADE) 
    user_code=models.TextField(blank=False)
    lang=models.CharField(max_length=255,blank=False)
    total_testcase_passed=models.IntegerField(blank=False,default=0)
    s_time=models.TimeField(blank=False)
    e_time=models.TimeField(blank=True,default="00:00:00")
    class Meta:
        unique_together = (('code_questions','user','exam'),)
    

class Email_status(models.Model):
    status=models.TextField(blank=True,default="null")

class Meta:  
        db_table = "users"
        db_table = "questions"
        db_table = "categories"
        db_table = "selected_questions"
        db_table = "result_set"
