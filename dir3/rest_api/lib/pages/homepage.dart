import 'package:flutter/material.dart';
import 'package:rest_api/network/RemoteServices.dart';

import '../models/Posts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  bool isLoaded=false;
  List<Posts> ?posts;
  @override
  void initState() {
    super.initState();

    //get api request
    getData();
  }

  getData() async {
    posts =await RemoteServices().getPosts();
    if(posts!=null){
      setState((){
        isLoaded=true;
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child:CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
            itemBuilder: (context,index){
            return ListTile(

              leading: Text('${posts?[index].id}'),
              title: Text(
                  '${posts?[index].title?.substring(0,12)
                  }',
                style: const TextStyle(
                  fontSize: 20.0,
                ),

              ),
              subtitle: Text(
                  '${posts?[index].body?.substring(0,50).replaceAll('\n', ' ')}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),

              ),


            );
            },
        ),
      ),
    );
  }

}
