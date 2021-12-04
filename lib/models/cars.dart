import 'package:fisrtflutter/utils/constants.dart';

class Cars{
  late String name,model,img,numHorse,numHand,motorSize,price;
  late String numKiloMeter,color,gerType,carStstus,fuelType;
  late String location,paymType,certificExsit,certificEnd,phone,note,userId;
  Cars({
    required this.name,
    required this.model,
    required this.img,
    required this.numHorse,
    required this.numHand,
    required this.motorSize,
    required this.numKiloMeter,
    required this.color,
    required this.gerType,
    required this.carStstus,
    required this.fuelType,
    required this.location,
    required this.paymType,
    required this.certificExsit,
    required this.certificEnd,
    required this.phone,
    required this.note,
    required this.price,
    required this.userId,
  }){}

  Cars.fromJson(Map<dynamic, dynamic> map) {
    name = map[Constats.CARS_NAME];
    model = map[Constats.CARS_MODEL];
    img = map[Constats.CARS_IMG];
    numHorse = map[Constats.CARS_NUM_HORSE];
    numHand = map[Constats.CARS_NUM_HEND];
    motorSize = map[Constats.CARS_MOTOR_SIZE];
    numKiloMeter = map[Constats.CARS_NUM_KILOMETER];
    color = map[Constats.CARS_COLOR];
    gerType = map[Constats.CARS_GER_TYPE];
    carStstus = map[Constats.CARS_STATUS];
    fuelType = map[Constats.CARS_FUEL_TYPE];
    location = map[Constats.CARS_LOCATION];
    paymType = map[Constats.CARS_PAYM_TYPE];
    certificExsit = map[Constats.CARS_CERTIFIC_EXSIT];
    certificEnd = map[Constats.CARS_CERIFIC_END];
    phone = map[Constats.CARS_PHONE];
    note=map[Constats.CARS_NOTE];
    price=map[Constats.CARS_PRICE];
    userId=map[Constats.USER_ID];
  }

  toJson() {
    return {
      Constats.CARS_NAME:name,
      Constats.CARS_MODEL:model,
      Constats.CARS_IMG:img,
      Constats.CARS_NUM_HORSE:numHorse,
      Constats.CARS_NUM_HEND:numHand,
      Constats.CARS_MOTOR_SIZE:motorSize,
      Constats.CARS_NUM_KILOMETER:numKiloMeter,
      Constats.CARS_COLOR:color,
      Constats.CARS_GER_TYPE:gerType,
      Constats.CARS_STATUS:carStstus,
      Constats.CARS_FUEL_TYPE:fuelType,
      Constats.CARS_LOCATION:location,
      Constats.CARS_PAYM_TYPE:paymType,
      Constats.CARS_CERTIFIC_EXSIT:certificExsit,
      Constats.CARS_CERIFIC_END:certificEnd,
      Constats.CARS_PHONE:phone,
      Constats.CARS_NOTE:note,
      Constats.CARS_PRICE:price,
      Constats.USER_ID:userId,
    };
  }
}