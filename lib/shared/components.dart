import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/api_controller.dart';
import '../controller/sql_controller.dart';
import '../module/book_details.dart';

Homecrt crt = Get.put(Homecrt());
Sqlcrt sql = Get.put(Sqlcrt());
Color mainColor = const Color(0xff77094E);
var lst = [];

Widget myField({
  required BuildContext context,
  required String label,
  var prefix,
  var ontap,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required bool isReadonly,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
          label: Text(label),
          prefix: prefix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      controller: controller,
      onTap: ontap,
      readOnly: isReadonly,
      validator: validate!,
    ),
  );
}

class card extends StatefulWidget {
  final String image;
  final String name;
  final String autherName;
  final String price;
  final Map<String, dynamic> map;

  const card({
    Key? key,
    required BuildContext context,
    required this.image,
    required this.name,
    required this.autherName,
    required this.price,
    required this.map,
  }) : super(key: key);

  @override
  cardState createState() => cardState();
}

class cardState extends State<card> {
  bool fv = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        crt.similarBooks(widget.map['volumeInfo']?['authors']?.isNotEmpty == true
            ? widget.map['volumeInfo']['authors'][0]
            : 'Unknown Author');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(widget.map),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.fromLTRB(0, 10, 10, 30),
        decoration: BoxDecoration(
          color: const Color(0xff77094E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(
              widget.image,
              height: 200,
              width: 350,
            ),
            Text(
              widget.name,
              maxLines: 1,
              style: GoogleFonts.caveat(fontSize: 20, color: Colors.grey),
            ),
            Text(
              widget.autherName,
              maxLines: 1,
              style: GoogleFonts.caveat(fontSize: 20, color: Colors.white),
            ),
            Text(
              widget.price,
              style: GoogleFonts.caveat(fontSize: 20, color: Colors.indigo),
            ),
            IconButton(
              onPressed: () {
                print('==============-=-=-=-==يافتاح');
                sql.insertdata(
                  widget.image,
                  widget.name, 
                  widget.autherName,
                  widget. price);

                setState(() {
                  fv = !fv;
                });
              },
              icon: fv ? const Icon(Icons.star) : const Icon(Icons.star_border),
              color: fv ? Colors.yellow : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle fontStyle = GoogleFonts.caveat(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
