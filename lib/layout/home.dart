import 'package:book_store/controller/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/api_controller.dart';
import '../module/search.dart';
import '../shared/components.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Homecrt crt = Get.put(Homecrt());
    ThemeController theme = Get.put(ThemeController());
    

    // ThemeController theme =Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Get.to(search_page());
            },
            icon: const Icon(Icons.search)),
            IconButton(onPressed: (()
            {
              theme.changeTheme();
            }), icon: const Icon(Icons.dark_mode))

      ]),
      body: ListView(
        scrollDirection: Axis.vertical,
       children: [
        Text('Art',style: Theme.of(context).textTheme.bodyText2),

        Expanded(
            child: GetX<Homecrt>(
                builder: (_) => Container(
                      height: 400,
                      margin: const EdgeInsets.only(left: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: crt.art.length,
                          itemBuilder: (context, i) {
                            return card(context: context,
                              map: crt.art[i],
                                image: crt.art[i]['volumeInfo']?['imageLinks']
                                        ?['smallThumbnail'] ??
                                    'https://via.placeholder.com/150',
                                name: crt.art[i]['volumeInfo']?['title'] ??
                                    'no name',
                                autherName: crt.art[i]['volumeInfo']?['authors']
                                            ?.isNotEmpty ==
                                        true
                                    ? crt.art[i]['volumeInfo']['authors'][0]
                                    : 'Unknown Author',
                                price: crt.art[i]['saleInfo']?['listPrice']
                                        ?['amount'] .toString()??
                                    "");
                          }),
                    )) //
            ),
        Text('History',style:  Theme.of(context).textTheme.bodyText2),
        Expanded(
            child: GetX<Homecrt>(
                builder: (_) => Container(
                      height: 400,
                      margin: const EdgeInsets.only(left: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: crt.history.length,
                          itemBuilder: (context, i) {
                            return card(
                              context: context,
                              map: crt.history[i],
                                image: crt.history[i]['volumeInfo']
                                        ?['imageLinks']?['smallThumbnail'] ??
                                    'https://via.placeholder.com/150',
                                name: crt.history[i]['volumeInfo']?['title'] ??
                                    'no name',
                                autherName: crt
                                            .history[i]['volumeInfo']
                                                ?['authors']
                                            ?.isNotEmpty ==
                                        true
                                    ? crt.history[i]['volumeInfo']['authors'][0]
                                    : 'Unknown Author',
                                price: crt.history[i]['saleInfo']?['listPrice']
                                        ?['amount'].toString() ??
                                    "no price");
                          }),
                    )) //
            ),
        Text('Programming',style:  Theme.of(context).textTheme.bodyText2),
        Expanded(
              child: 
              GetX<Homecrt>(
                builder: (_) => 
             Container(
              height: 400,
              margin: const EdgeInsets.only(left: 10),
               child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:crt.programming.length,
                              itemBuilder: (context, i) {

                                return card(context: context,
                                  map: crt.programming[i],
                                  image:crt.programming[i]['volumeInfo']?['imageLinks']?['smallThumbnail']??'https://via.placeholder.com/150',
 
                                name: crt.programming[i]['volumeInfo']?['title']??'no name',
                                autherName:  crt.programming[i]['volumeInfo']?['authors']?.isNotEmpty == true ? crt.programming[i]['volumeInfo']['authors'][0] : 'Unknown Author',
                                price: crt.programming[i]['saleInfo']?['listPrice']?['amount'].toString() ?? "");}),
             )
             ) // 
            ),
        Text('Science',style:  Theme.of(context).textTheme.bodyText2),
        Expanded(
              child: 
              GetX<Homecrt>(
                builder: (_) => 
             Container(
              margin: const EdgeInsets.only(left: 10),
              height: 400,
              

               child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:crt.science.length,
                              itemBuilder: (context, i) {

                                return card(context: context,
                                  map: crt.science[i],
                                  image:crt.science[i]['volumeInfo']?['imageLinks']?['smallThumbnail']??'https://via.placeholder.com/150',
 
                                name: crt.science[i]['volumeInfo']?['title']??'no name',
                                autherName:  crt.science[i]['volumeInfo']?['authors']?.isNotEmpty == true ? crt.science[i]['volumeInfo']['authors'][0] : 'Unknown Author',
                                price: crt.science[i]['saleInfo']?['listPrice']?['amount'].toString() ?? "");}),
             )
             ) // 
            ),
      ]),
    );
  }
}
