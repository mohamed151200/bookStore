import 'package:book_store/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/api_controller.dart';
import '../shared/components.dart';

class BookDetails extends StatelessWidget {
  late Map<String, dynamic> map;
  Homecrt crt = Get.put(Homecrt());
  var lst =[];

  BookDetails(this.map, {super.key});
  

  @override
  
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text(
            map['volumeInfo']?['title'] ?? 'no name',
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
          Column(children: [
            Container(
                height: 180,
                width: 300,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                //color: Colors.orangeAccent,
                child: Column(children: [
                  Image.network(
                    map['volumeInfo']?['imageLinks']?['smallThumbnail'] ??
                        'https://via.placeholder.com/150',
                    height: 180,
                  )
                ])),
            Container(
                child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodyText1,
              ),
             

              SizedBox(
                height: 20,
              ),
              Container(
                // 576e68
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Color(0xff77094E)),
                child: Text(
                  map['volumeInfo']?['description']??'with out discreption',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              // Center(
              //     child: Row(children: [
              //       Text(
              //         "Name:",
              //         style: TextStyle(fontSize: 25,color: Colors.white),
              //       ),
              //       InkWell(
              //         child:
              //         Text(
              //           name,
              //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              //           ),
              //         // onTap:  () {
              //         //
              //         //   Navigator.push(
              //         //       context, MaterialPageRoute(
              //         //       builder: (context) =>
              //         //           author2(getdata(),name)
              //         //
              //         //   )
              //         //
              //         //   );
              //        // }
              //       ),
              //
              //       Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0)),
              //       // Text(
              //       //   "Rating:",
              //       //   style: TextStyle(fontSize: 20),
              //       // ),
              //       // Text(rating,
              //       //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              //     ]))
            ])),
            Column(children: [
              Row(children: [
                Padding(padding: EdgeInsets.only(top: 70)),
                Text(
                  "Author :",
                  style:Theme.of(context).textTheme.bodyText1
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff77094E),
                      ),
                      child: Text(
                        map['volumeInfo']?['authors']?.isNotEmpty == true
                            ? map['volumeInfo']['authors'][0]
                            : 'Unknown Author',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white //snapshot.data!.docs[i].id
                            ),
                      ),
                    ),
                    onTap: () {}),]),
                Row(children: [
                  Padding(padding: EdgeInsets.only(top: 70)),
                  Text(
                    "Publisher :",style:
Theme.of(context).textTheme.bodyText1                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff77094E),
                        ),
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 20,
                              color:
                                  Colors.white //snapshot.data!.docs[i].id
                              ),
                        ),
                      ),
                      onTap: () {})
                ]),
                //Padding(padding: EdgeInsets.only(top: 70)),
              ]),

              SizedBox(
                height: 20,
              ),
              Text(
                "More Books :",
                style: 
Theme.of(context).textTheme.bodyText1              ),
              SizedBox(
                height: 20,

              ),
              Container(
                          height: 400,
                          margin: const EdgeInsets.only(left: 10),

                          // color: Colors.grey,
                          child: GetX<Homecrt>(
            builder: (_) => 
         ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:crt.simi.length,
                        itemBuilder: (context, i) {

                          return card(context: context,
                            map: crt.simi[i],
                            image:crt.simi[i]['volumeInfo']?['imageLinks']?['smallThumbnail']??'https://via.placeholder.com/150',
 
                          name: crt.simi[i]['volumeInfo']?['title']??'no name',
                          autherName:  crt.simi[i]['volumeInfo']?['authors']?.isNotEmpty == true ? crt.simi[i]['volumeInfo']['authors'][0] : 'Unknown Author',
                          price: crt.simi[i]['saleInfo']?['listPrice']?['amount'].toString() ?? "");})
         ) 
                        )
              
              ])
             
            ]
            )
            
            
            );

  }}