from django.db import models

# Create your models here.
class Users(models.Model):
    id = models.AutoField(primary_key=True)
    name=models.CharField(max_length=32, blank=False)
    email=models.EmailField(unique=True, blank=False)
    password=models.CharField(max_length=10, blank=False)
    score=models.IntegerField(blank=False,default=-1)

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
    cat = models.ForeignKey(Categories, on_delete=models.CASCADE)

class Exam(models.Model):
    id = models.AutoField(primary_key=True)
    e_name=models.CharField(max_length=32, blank=False)
    start_date=models.DateField()
    end_date=models.DateField(blank=False)
    on_going_exam=models.CharField(max_length=5, blank=False,default="false")
    duration=models.IntegerField(blank=False,default=3600)

class Selected_questions(models.Model): 
    exam= models.ForeignKey(Exam,on_delete=models.CASCADE)  
    que= models.ForeignKey(Questions, on_delete=models.CASCADE)  
    class Meta:
        unique_together = (('exam', 'que'),)

class Result_set(models.Model): 
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    exam= models.ForeignKey(Selected_questions, on_delete=models.CASCADE)  
    que = models.ForeignKey(Questions, on_delete=models.CASCADE)  
    ans=models.TextField(blank=True,default="null")
    date_f=models.DateField(blank=False)
    s_time=models.TimeField(blank=False)
    e_time=models.TimeField(blank=True,default="00:00:00")
    class Meta:
        unique_together = (('exam', 'que','user'),)

class Meta:  
        db_table = "users"
        db_table = "questions"
        db_table = "categories"
        db_table = "selected_questions"
        db_table = "result_set"