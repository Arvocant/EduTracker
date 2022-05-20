import 'package:edutracker/models/person.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:edutracker/services/service_locator.dart';

class DatabaseService {
  
  Future<List<Person>> getAllStudents() async {
    try {
      final DatabaseReference ourDB = FirebaseDatabase.instance
        .ref()
        .child('users');
      Query qry = ourDB.orderByChild('role')
        .equalTo('student');
      DataSnapshot snap = await qry.get();

      if (snap != null && snap.value != null) {
        Map<dynamic, dynamic> data = snap.value as Map<dynamic, dynamic>;

        List<Person> allStudents = List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student), growable:true);

        data.forEach((key, value) {
          allStudents.add(Person.fromDB(key, value));
          });

        return allStudents;
      } else {
        return List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student));
      }
    } on Exception catch (e) {
      print(e);
    }
    return List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student));
  }

  Future<List<Person>> getAllTeachers() async {
    try {
      final DatabaseReference ourDB = FirebaseDatabase.instance
        .ref()
        .child('users');
      Query qry = ourDB.orderByChild('role')
        .equalTo('teacher');
      DataSnapshot snap = await qry.get();

      if (snap != null && snap.value != null) {
        Map<dynamic, dynamic> data = snap.value as Map<dynamic, dynamic>;

        List<Person> allStudents = List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student), growable:true);

        data.forEach((key, value) {
          allStudents.add(Person.fromDB(key, value));
          });

        return allStudents;
      } else {
        return List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student));
      }
    } on Exception catch (e) {
      print(e);
    }
    return List<Person>.filled(500, new Person("", "",DateTime.now(), "", "", Role.student));
  }


  Future<void> InitDB() async {
    final DatabaseReference ourDB = FirebaseDatabase.instance.ref();

    try {
      Query qry = ourDB.child('users');
      DataSnapshot snap = await qry.get();
      if (snap.value == null) {

        print("Creating new Database");
        Person a = Person(ourDB.push().key.toString(), "s102910" ,DateTime.now(), "John", "Doe", Role.student);
        Person b = Person(ourDB.push().key.toString(), "p129802",DateTime.now(), "Frieda", "Kroket", Role.teacher);
        Person c = Person(ourDB.push().key.toString(), "p192831",DateTime.now(), "Thibaut", "Weekx", Role.admin);
        Person d = Person(ourDB.push().key.toString(), "s120912",DateTime.now(), "Arvo", "Cunt", Role.student);

        await ourDB.child('users').child(a.pid).set(a);
        await ourDB.child('users').child(b.pid).set(b);
        await ourDB.child('users').child(c.pid).set(c);
        await ourDB.child('users').child(d.pid).set(d);
        print("Database has been succesfully created");
      } else
        print("Database initialized");
    } on Exception catch (e) {
      print(e);
    }
  }

}