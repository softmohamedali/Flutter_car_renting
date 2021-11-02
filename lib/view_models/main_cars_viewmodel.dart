
import 'package:fisrtflutter/utils/resultState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCarsViewModel extends Cubit<ResultState>{
  MainCarsViewModel() : super(OnLoading());
  static MainCarsViewModel get(context) => BlocProvider.of(context);

}