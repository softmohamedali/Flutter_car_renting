abstract class ResultState{
  late String data;
  late String msg;
  ResultState({
    data="",
    msg=""
  }){}

}

class OnSucsses extends ResultState{

}
class OnError extends ResultState{

}
class OnLoading extends ResultState{

}