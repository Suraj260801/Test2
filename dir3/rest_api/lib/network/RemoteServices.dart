
import 'dart:convert';

import '../models/Posts.dart';
import 'package:http/http.dart' as http;
class RemoteServices{

  Future<List<Posts>?> getPosts() async{

    var client=http.Client();
    Uri url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var responce=await client.get(url);

    if(responce.statusCode==200){
      List json=jsonDecode(responce.body.toString());

      return Posts.jsonToList(json);
    }
    return [];
  }
}