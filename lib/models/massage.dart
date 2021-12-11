class Massage{
  String date="",fulName="",phone="",massage="";

  Massage({
   required this.fulName,
   required this. phone,
    required this. massage,
    required this. date,
}){}

  Massage.fromJson(Map<dynamic,dynamic> map)
  {
    if(map==null)
    {
      return;
    }
    this.fulName=map["fulName"];
    this.phone=map["phone"];
    this.massage=map["massage"];
    this.date=map["date"];
  }

  toJson()
  {
    return{
      "fulName":this.fulName,
      "phone":this.phone,
      "massage":this.massage,
      "date":this.date
    };
  }

}