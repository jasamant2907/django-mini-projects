import mongoengine as mg


class Behaviour(mg.EmbeddedDocument):
    """
    this behaviour field is nested inside attendance
    """
    doing_homework = mg.IntField(min_value=0, max_value=5, required=True)
    disrupting_class = mg.IntField(min_value=-5, max_value=0, required=True)
    helping = mg.IntField(min_value=0, max_value=5, required=True)


class Attendance(mg.EmbeddedDocument):
    """
    this is the nested in the UserAccount and points is nested down in attendance
    """
    attend_date = mg.DateTimeField(unique=True, required=True)
    attend_points = mg.EmbeddedDocumentField(Behaviour)


class UserAccount(mg.Document):
    """
    students account in which attendance is nested down for good model practice
    """
    #note we use student_id as primary key but here we will not use the "primary_key=True"
    student_id = mg.StringField(min_length=10, max_length=10, required=True)
    student_name = mg.StringField(max_length=100, required=True)
    student_age = mg.IntField(min_value=4, max_value=20, required=True)
    student_class = mg.IntField(min_value=1, max_value=12, required=True)
    student_attend = mg.ListField(mg.EmbeddedDocumentField(Attendance))
