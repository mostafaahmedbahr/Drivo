import 'package:drivo/features/car_details/data/models/car_details_model.dart';

abstract class CarDetailsStates{}

class CarDetailsInitState extends CarDetailsStates{}

class CarSlideChangedState extends CarDetailsStates{}

class DateTimeSelectedState extends CarDetailsStates {}

class TimeSelectedState extends CarDetailsStates {}

class DateTimeClearedState extends CarDetailsStates {}

class GetCarDetailsLoadingState extends CarDetailsStates {}
class GetCarDetailsSuccessState extends CarDetailsStates {
  final CarDetailsModel carDetailsModel;
  GetCarDetailsSuccessState(this.carDetailsModel);

}
class GetCarDetailsErrorState extends CarDetailsStates {
  final String error;
  GetCarDetailsErrorState(this.error);

}