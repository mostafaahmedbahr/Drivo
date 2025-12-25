import 'package:drivo/features/car_details/data/models/car_details_model.dart';
import 'package:drivo/features/car_details/domain/usecases/get_car_by_id_use_case.dart';
import 'package:drivo/features/car_details/presentation/widgets/car_feature_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';
import '../widgets/evaluation_item.dart';
import 'car_details_states.dart';

class CarDetailsCubit extends Cubit<CarDetailsStates> {
  CarDetailsCubit({required this.getCarDetailsByIdUseCase}) : super(CarDetailsInitState());
  final GetCarDetailsByIdUseCase getCarDetailsByIdUseCase;
  static CarDetailsCubit get(context) => BlocProvider.of(context);

  int _currentSlide = 0;
  DateTime? _selectedDateTime;
  TimeOfDay? _selectedTime;

  int get currentSlide => _currentSlide;
  DateTime? get selectedDateTime => _selectedDateTime;
  TimeOfDay? get selectedTime => _selectedTime;

  void changeSlide(int index) {
    _currentSlide = index;
    emit(CarSlideChangedState());
  }

  void updateSelectedDateTime(DateTime? dateTime) {
    _selectedDateTime = dateTime;
    emit(DateTimeSelectedState());
    print("📅 DateTime updated: $dateTime");
  }

  void updateSelectedTime(TimeOfDay? time) {
    _selectedTime = time;
    emit(TimeSelectedState());
    print("⏰ Time updated: $time");
  }

  void clearDateTimeSelection() {
    _selectedDateTime = null;
    _selectedTime = null;
    emit(DateTimeClearedState());
  }

  // Format date for display
  String getFormattedDate() {
    if (_selectedDateTime == null) return '';
    return '${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}';
  }

  // Format time for display
  String getFormattedTime(BuildContext context) {
    if (_selectedTime == null) return '';
    return _selectedTime!.format(context);
  }

  final List<CarFeatureItem> featuresList = [
    CarFeatureItem(svgImage: SvgImages.engine, value: "Gasoline"),
    CarFeatureItem(svgImage: SvgImages.stick, value: "Automatic"),
    CarFeatureItem(svgImage: SvgImages.people, value: "5"),
    CarFeatureItem(svgImage: SvgImages.door, value: "4"),
  ];

  final List<EvaluationItem> evaluationsList = [
    EvaluationItem(title: LocaleKeys.safety.tr(), value: 5),
    EvaluationItem(title: LocaleKeys.comfort.tr(), value: 2),
    EvaluationItem(title: LocaleKeys.consumption.tr(), value: 3),
  ];



  CarDetailsModel? carDetailsModel;
  Future<void> getCarDetailsById({required int carId}) async {
    emit(GetCarDetailsLoadingState());
    final result = await getCarDetailsByIdUseCase.call(carId: carId);
    result.fold(
          (failure) => emit(GetCarDetailsErrorState(failure.errMessage.toString())),
          (carDetails){
            carDetailsModel = carDetails;
        emit(GetCarDetailsSuccessState(carDetails));
      },
    );
  }


}