class Company {
  String name="",img="";

  Company({
    required this.name,
    required this.img
  }){
  }

  Company.fromJson(Map<dynamic,dynamic> map)
  {
    if(map==null)
      {
        return;
      }
    this.img=map["img"];
    this.name=map["name"];
  }

  toJson()
  {
    return{
      "img":this.img,
      "name":this.name
    };
  }

}