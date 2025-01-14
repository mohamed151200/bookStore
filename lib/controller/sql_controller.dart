import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';

class Sqlcrt extends GetxController {
  late Database database;
  var fv = false.obs;
  var fiv = Icons.star_border.obs;

  var books = [].obs;

  changeIcone(fv) {
    fv=!fv;
  
    return fv;
  }

  Future<void> createdata() async {
    database = await openDatabase('books.db', version: 1,
        onCreate: (Database database, int version) async {
      await database.execute(
          'CREATE TABLE books (id INTEGER PRIMARY KEY, image TEXT, name TEXT,author TEXT, price TEXT)');
      print('Table created successfully');
    }, onOpen: (Database database) async {
      getData(database).then((value) {

        books.value = value??[];
        print('========-==========$books');
      });
    });
  }

  getData(Database database) async {
    books.value = await database.rawQuery("SELECT * FROM books");

    if (books.isNotEmpty) {
      print('$books-=-=--=-==-=-=-=-=-==-=-=-');
    }
  }

  void insertdata(
      String image, 
      String name,
      String author,
      String price
                ) 
      async {
    database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO books(image, name,author, price) VALUES("$image","$name","$author", "$price")')
          .then((value) {
        getData(database);
      });
    });
  }

  void delet(int id) async {
    database
        .rawDelete('DELETE FROM books WHERE id = ?', [id])
        .then((value) {})
        .catchError((error) {
          print(error.toString());
        })
        .then((value) {
          getData(database);
        });
  }
}
