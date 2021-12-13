class MyNotification {
  String? title, body;

  MyNotification({
    required this.title,
    required this.body
  }){

  }

  MyNotification.fromJson(Map<dynamic, dynamic> map){
    if(map==null)
    {
      return;
    }
    title=map["title"];
    body=map["body"];
  }

  toJson()
  {
    return {
      "title":title,
      "body":body,
    };
  }
}