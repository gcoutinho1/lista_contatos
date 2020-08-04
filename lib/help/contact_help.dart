import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String emailColumn = "emailColumn";
final String imageColumn = "imageColumn";

class ContactHelper {

}

class Contact {

  int id;
  String name;
  String phone;
  String email;
  String image;

  Contact.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    image = map[imageColumn];

  }

  Map toMap(){
    Map<String, dynamic> map = {

      nameColumn: name,
      phoneColumn: phone,
      emailColumn: email,
      imageColumn: image,

    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, phone: $phone, email: $email, Image: $image)";
  }
}