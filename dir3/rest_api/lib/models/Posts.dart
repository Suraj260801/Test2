class Posts{
  int ?userId;
  int ?id ;
  String ?title;
  String? body;
  Posts({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  static List<Posts>?jsonToList(List json){
    List<Posts> ?posts=[];
    int i=0;
    for( i=0;i<json.length;i++){
      Posts? post=Posts(userId:json[i]['userId'],id:json[i]['id'],title:json[i]['title'],body:json[i]['body']);
      posts.add(post);


    }
    return posts;
  }

}