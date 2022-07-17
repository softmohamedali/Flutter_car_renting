class InputValidate{
  String? error;
  bool valid=false;

  InputValidate({
    required this.error,
    required this.valid
  }){}

}

class Validation{
  static InputValidate validateEmail(String? email){
    if(email==null||email.isEmpty){
      return InputValidate(error: "email is required", valid: false);
    }
    else if(!email.contains(new RegExp(r'@', caseSensitive: false))){
      return InputValidate(error: "unilligable email", valid: false);
    }
    else{
      return InputValidate(error:null, valid: true);
    }
  }

  static InputValidate validatePassword(String? password){
    if(password==null||password.isEmpty){
      return InputValidate(error: "password is required", valid: false);
    }
    else if(password.length<6){
      return InputValidate(error: "password lenght at least 6", valid: false);
    }
    else{
      return InputValidate(error:null, valid: true);
    }
  }

  static InputValidate validateSimpleText(String? text){
    if(text==null||text.isEmpty){
      return InputValidate(error: "failed is required", valid: false);
    }
    else if(text.length<4){
      return InputValidate(error: "unilligable email", valid: false);
    }
    else{
      return InputValidate(error:null, valid: true);
    }
  }

  static InputValidate validatePhone(String? phone){
    if(phone==null||phone.isEmpty){
      return InputValidate(error: "phone is required", valid: false);
    }
    else if(phone.length<=11){
      return InputValidate(error: "phone lenght at least 11", valid: false);
    }
    else if(
          !phone.startsWith(new RegExp(r'010', caseSensitive: false))||
          !phone.contains(new RegExp(r'011', caseSensitive: false))||
          !phone.contains(new RegExp(r'012', caseSensitive: false))
    ){
      return InputValidate(error: "phone lenght at least 11", valid: false);
    }
    else{
      return InputValidate(error:null, valid: true);
    }
  }

}

