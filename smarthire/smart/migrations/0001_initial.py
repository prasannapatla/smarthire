# Generated by Django 2.2.4 on 2019-11-05 10:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categories',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('cat', models.CharField(max_length=200, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Code_questions',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('pbm_stmt', models.TextField()),
                ('code', models.TextField()),
                ('lang', models.CharField(default='java', max_length=255)),
                ('example_input', models.TextField()),
                ('test_input1', models.TextField()),
                ('test_input2', models.TextField()),
                ('test_input3', models.TextField()),
                ('test_input4', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Email_status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.TextField(blank=True, default='null')),
            ],
        ),
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('e_name', models.CharField(max_length=32, unique=True)),
                ('start_date', models.DateField()),
                ('end_date', models.DateField()),
                ('duration', models.IntegerField(default=3600)),
                ('total_marks', models.IntegerField(default=60)),
                ('code_duration', models.IntegerField(default=3600)),
                ('code_total_marks', models.IntegerField(default=60)),
            ],
        ),
        migrations.CreateModel(
            name='Questions',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('question', models.TextField()),
                ('opt1', models.TextField()),
                ('opt2', models.TextField()),
                ('opt3', models.TextField()),
                ('opt4', models.TextField()),
                ('ans', models.TextField()),
                ('cat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Categories')),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=32)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=70)),
                ('score', models.CharField(default=-1, max_length=5)),
                ('coding_score', models.CharField(default=-1, max_length=5)),
                ('malpractices', models.IntegerField(default=0)),
                ('email_sent_status', models.BooleanField(default=False)),
                ('feedback', models.IntegerField(default=0)),
                ('exam', models.ForeignKey(default='null', on_delete=django.db.models.deletion.CASCADE, to='smart.Exam')),
            ],
        ),
        migrations.CreateModel(
            name='Selected_questions',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Exam')),
                ('que', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Questions')),
            ],
            options={
                'unique_together': {('exam', 'que')},
            },
        ),
        migrations.CreateModel(
            name='Selected_code_questions',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('code_questions', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Code_questions')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Exam')),
            ],
            options={
                'unique_together': {('exam', 'code_questions')},
            },
        ),
        migrations.CreateModel(
            name='Result_set',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ans', models.TextField(blank=True, default='null')),
                ('date_f', models.DateField()),
                ('s_time', models.TimeField()),
                ('e_time', models.TimeField(blank=True, default='00:00:00')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Exam')),
                ('que', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Questions')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Users')),
            ],
            options={
                'unique_together': {('exam', 'que', 'user')},
            },
        ),
        migrations.CreateModel(
            name='Coding_result_set',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_code', models.TextField()),
                ('lang', models.CharField(max_length=255)),
                ('total_testcase_passed', models.IntegerField(default=0)),
                ('s_time', models.TimeField()),
                ('e_time', models.TimeField(blank=True, default='00:00:00')),
                ('code_questions', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Code_questions')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Exam')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='smart.Users')),
            ],
            options={
                'unique_together': {('code_questions', 'user', 'exam')},
            },
        ),
    ]
