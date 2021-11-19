class Userx {
  String? userId, name, email, userPhone;

  Userx({
    required this.userId,
    required this.name,
    required this.email,
    required this.userPhone
  }){

  }

  Userx.fromJson(Map<dynamic, dynamic> map){
    if(map==null)
    {
      return;
    }
    userId=map["userId"];
    name=map["name"];
    email=map["email"];
    userPhone=map["phone"];
  }

  toJson()
  {
    return {
      "userId":userId,
      "name":name,
      "email":email,
      "phone":userPhone
    };
  }
}