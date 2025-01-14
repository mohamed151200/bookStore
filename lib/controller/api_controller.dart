import 'package:book_store/remote/api_client.dart';
import 'package:get/get.dart';
class Homecrt extends GetxController 
{
  var search=[].obs;
  var simi=[].obs;
  var art=[].obs;
  var history=[].obs;
  var programming =[].obs;
  var science =[].obs;

  void searchBook(String query)
  {
    ApiClient().getData(url: "/volumes", query: {"q": query})
    .then((value) 
    {
      search.value=value.data["items"];
    });
    print(search);
    
  }
   void similarBooks(String query)
  {
    ApiClient().getData(url: "/volumes", query: {"q": query})
    .then((value) 
    {
      simi.value=value.data["items"];
    });
    print(search);
    
  }
  void getArt()
  {
    
    ApiClient().getData(url: "/volumes", query: {
      "q": "art",
      "key":"AIzaSyCcMV7VKILWQTQof-YYmswiYBHSMjRN8A0"
 })
    .then((value) 
    {
      art.value=value.data["items"];
    });
    print(art);
    
  }
 void getHistory()
  {
    ApiClient().getData(url: "/volumes", query: {
      "q": "history",
      "key":"AIzaSyCcMV7VKILWQTQof-YYmswiYBHSMjRN8A0"
 })
    .then((value) 
    {
      history.value=value.data["items"];
    });
    print(history);
    
  }
 void getprogramming()
  {
    ApiClient().getData(url: "/volumes", query: {
      "q": "programming",
      "key":"AIzaSyCcMV7VKILWQTQof-YYmswiYBHSMjRN8A0"
 })
    .then((value) 
    {
      programming.value=value.data["items"];
    });
    print(programming);
    
  }
 void getscience()
  {
    ApiClient().getData(url: "/volumes", query: {
      "q": "science",
      "key":"AIzaSyCcMV7VKILWQTQof-YYmswiYBHSMjRN8A0"
 })
    .then((value) 
    {
      science.value=value.data["items"];
    });
    print(science);
    
  }
}
