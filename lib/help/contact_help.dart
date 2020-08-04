import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String emailColumn = "emailColumn";
final String imageColumn = "imageColumn";

class ContactHelper {

  static final ContactHelper _instance = ContactHelper.internal();
  ContactHelper.internal();
  factory ContactHelper() =>  _instance;
  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    }else {
      _db = await initDb();
      return _db;
    }
  }
  
  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join (databasesPath, "contacts.db");
    
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imageColumn TEXT)"
      );
    });

  }
}

class Contact {
  int id;
  String name;
  String phone;
  String email;
  String image;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    image = map[imageColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
      emailColumn: email,
      imageColumn: image,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, phone: $phone, email: $email, Image: $image)";
  }
}
