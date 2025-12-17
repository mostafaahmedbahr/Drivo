import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../main_importants.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, this.color, this.size});
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        size:size?? 50, color:color?? AppColors.shipGray,
      ),
    );
  }
}
