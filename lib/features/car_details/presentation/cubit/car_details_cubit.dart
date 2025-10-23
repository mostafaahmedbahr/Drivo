import 'package:drivo/features/car_details/presentation/widgets/car_feature_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';
import '../widgets/evaluation_item.dart';
import 'car_details_states.dart';

class CarDetailsCubit extends Cubit<CarDetailsStates> {
  CarDetailsCubit() : super(CarDetailsInitState());

  static CarDetailsCubit get(context) => BlocProvider.of(context);

  int _currentSlide = 0;

  int get currentSlide => _currentSlide;

  void changeSlide(int index) {
    _currentSlide = index;
    emit(CarSlideChangedState());
  }


   final List<CarFeatureItem> featuresList= [
     CarFeatureItem(svgImage: SvgImages.engine, value: "Gasoline"),
     CarFeatureItem(svgImage: SvgImages.stick, value: "Automatic"),
     CarFeatureItem(svgImage: SvgImages.people, value: "5"),
     CarFeatureItem(svgImage: SvgImages.door, value: "4"),
   ];

  final List<EvaluationItem> evaluationsList= [
    EvaluationItem(title: LocaleKeys.safety.tr(), value: 5),
    EvaluationItem(title: LocaleKeys.comfort.tr(), value: 2),
    EvaluationItem(title: LocaleKeys.consumption.tr(), value: 3),
  ];
}