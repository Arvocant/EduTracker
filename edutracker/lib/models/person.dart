enum Role {
  student,
  teacher,
  admin,
}

class Person {
  String pid = "";
  String studentId = "";
  DateTime birthdate = DateTime.now();
  String firstname = "";
  String lastname = "";
  Role role = Role.student;

  Person(String pid, String studentId, DateTime birthdate, String firstname, String lastname, Role role) {
    this.pid = pid;
    this.studentId = studentId;
    this.birthdate = birthdate;
    this.firstname = firstname;
    this.lastname = lastname;
    this.role = role;
  }

  Person.fromDB(this.pid, Map data) {
    pid = data['pid'].toString();
    birthdate = DateTime.parse(data['birthdate']);
    firstname = data['firstname'].toString();
    lastname = data['lastname'].toString();
    role = Role.values.firstWhere((e) =>  e.toString() == data['role'].toString());
  }

  
}