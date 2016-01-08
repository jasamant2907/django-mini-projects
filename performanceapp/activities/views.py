"""
Assumption no concurrent access process in place
"""

from __future__ import absolute_import
from django.shortcuts import redirect, render
from activities.models import UserAccount, Attendance, Behaviour
from mongoengine import errors


def report(request):
    """
    This code redirects you to the summary report page
    """
    return render(request, 'report.html')


def manualvalidate(stu_id):
    """
    helper function to manual validate student id
    Reason for this naive approach beacuse the clean()
    function may not work on future  mongoengines package
    (string) -> (boolean)
    """
    if stu_id.isalnum() and len(stu_id) == 10:
        print "StudentId validation: success"
        return True
    print "StudentId Validation: failed"
    return False


def index(request):
    """
    It checks for the form posts and report get
    and finally renders the html page or redirects as required.
    """
    if request.method == "POST":
        #perform check and insert data to db
        if request.POST.get("attendance_submit") and manualvalidate(str(request.POST.get("studentid"))):
            student_id_data = str(request.POST.get("studentid"))
            stud_obj = UserAccount.objects(student_id=student_id_data)
            attendance_date = str(request.POST.get("date"))
            if stud_obj:
                #fill in the behaviour collection attributes
                new_behave = Behaviour()
                new_behave.doing_homework = int(request.POST.get("homework"))
                new_behave.disrupting_class = int(request.POST.get("disrupt"))
                new_behave.helping = int(request.POST.get("helping"))
                #fill attendance collection attributes
                new_attendance = Attendance()
                new_attendance.attend_date = str(request.POST.get("date"))
                new_attendance.attend_points = new_behave
                #put it in the specific student useraccount
                stud_obj.update(push__student_attend=new_attendance)
                print "Attendance success"
            else:
                print "This StudentId not registered in db"
        elif request.POST.get("newform_submit") and manualvalidate(str(request.POST.get("newstudentid"))):
            new_studentid = str(request.POST.get("newstudentid"))
            #check if student id is present in db
            #simply ignore creating as only there should be one unique student id
            if UserAccount.objects(student_id=new_studentid).count() == 0:
                newstudent_data = UserAccount()
                newstudent_data.student_id = new_studentid
                newstudent_data.student_age = int(request.POST.get("age_val"))
                student_full_name = str(request.POST.get("name_first")) + ' ' + str(request.POST.get("name_last"))
                newstudent_data.student_name = student_full_name
                newstudent_data.student_class = int(request.POST.get("class_val"))
                try:
                    newstudent_data.save(validate=True)
                    print "new student data validation and save: success"
                except errors:
                    print "new student data validation and save: failed"
            else:
                print "student_id already exists"
        return render(request, 'index.html')
    if request.method == "GET":
        if request.GET.get("stdreport"):
            print "needs redirect"
            return redirect("report")
        return render(request, 'index.html')
    return render(request, 'index.html')
