import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import '../../../../main_importants.dart';
import '../../../home/presentation/screens/home_screen.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 2;


  List screens = [
    Text("1"),
    Text("2"),
    HomeScreen(),
    Text("4"),
    Text("5"),

  ];



  changeBottomNav(index ,context) {
    pageIndex = index;
    emit(ChangeBottomNavState());
  }

  DateTime? _lastPressed;
  void onPopInvoked(bool didPop,BuildContext context) {
    if (didPop) {
      return;
    }
    DateTime now = DateTime.now();
    if (_lastPressed == null || now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.exit.tr()),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      SystemNavigator.pop();
    }
  }
}