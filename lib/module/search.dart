import 'package:book_store/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/api_controller.dart';

class search_page extends StatelessWidget {
  TextEditingController c1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Homecrt crt = Get.put(Homecrt());
    
    // ThemeController theme =Get.put(ThemeController());
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(style: Theme.of(context).textTheme.bodyText1,onChanged: (value) {if(value != null && value.trim().isNotEmpty)
              {
                 crt.searchBook(value.toString());
              }
               
              },validator: ((value) {
                if (value!.isEmpty || value == null) {
                  return 'Time mustnot be empty';
                }
                return null;
              })),
            ),
            Expanded(
              child: 
              GetX<Homecrt>(
                builder: (_) => 
             ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:crt.search.length,
                            itemBuilder: (context, i) {

                              return Container(
                                height: 410,
                                child: card(context: context,
                                  map: crt.search[i],
                                  image:crt.search[i]['volumeInfo']?['imageLinks']?['smallThumbnail']??'https://via.placeholder.com/150',
 
                                name: crt.search[i]['volumeInfo']?['title']??'no name',
                                autherName:  crt.search[i]['volumeInfo']?['authors']?.isNotEmpty == true ? crt.search[i]['volumeInfo']['authors'][0] : 'Unknown Author',
                                price: crt.search[i]['saleInfo']?['listPrice']?['amount'].toString() ?? ""),
                              );})
             ) // 
            )
          ],
        ),
        
        );
  }
}
