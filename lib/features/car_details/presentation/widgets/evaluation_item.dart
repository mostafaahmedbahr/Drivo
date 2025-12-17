 import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../main_importants.dart';

class EvaluationItem extends StatelessWidget {
  const EvaluationItem({super.key, required this.title, required this.value});
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppStyles.medium16Black,),
        StepProgressIndicator(
          direction: Axis.horizontal,
          totalSteps: 5,
          currentStep: value,
          size: 20,
          fallbackLength : 200,
          selectedColor: AppColors.orange,
          unselectedColor: AppColors.greyColor1.withValues(alpha: 0.5),
          roundedEdges: Radius.circular(10),
        ),
      ],
    );
  }
}
