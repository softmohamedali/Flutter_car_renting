import 'package:fisrtflutter/utils/constants.dart';

class Cars{
  late String name,model,img,numHorse,numHand,motorSize;
  late String numKiloMeter,color,gerType,carStstus,motorType;
  late String location,paymType,certificType,certificEnd,phone,specials;
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
    required this.motorType,
    required this.location,
    required this.paymType,
    required this.certificType,
    required this.certificEnd,
    required this.phone,
    required this.specials,
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
    motorType = map[Constats.CARS_MOTOR_TYPE];
    location = map[Constats.CARS_LOCATION];
    paymType = map[Constats.CARS_PAYM_TYPE];
    certificType = map[Constats.CARS_CERTIFIC_TYPE];
    certificEnd = map[Constats.CARS_CERIFIC_END];
    phone = map[Constats.CARS_PHONE];
    specials=map[Constats.CARS_SPEIALS];
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
      Constats.CARS_MOTOR_TYPE:motorType,
      Constats.CARS_LOCATION:location,
      Constats.CARS_PAYM_TYPE:paymType,
      Constats.CARS_CERTIFIC_TYPE:certificType,
      Constats.CARS_CERIFIC_END:certificEnd,
      Constats.CARS_PHONE:phone,
      Constats.CARS_SPEIALS:specials,
    };
  }
}