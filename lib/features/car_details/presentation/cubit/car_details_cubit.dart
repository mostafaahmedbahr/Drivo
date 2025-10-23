import '../../../../main_importants.dart';
import 'car_details_states.dart';

class CarDetailsCubit extends Cubit<CarDetailsStates> {
  CarDetailsCubit() : super(CarDetailsInitState());

  static CarDetailsCubit get(context) => BlocProvider.of(context);


}