import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import '../cubit/car_details_cubit.dart';
import 'evaluation_item.dart';

class ExpertEvaluation extends StatelessWidget {
  const ExpertEvaluation({super.key});

  @override
  Widget build(BuildContext context) {
    var carDetailsCubit = context.read<CarDetailsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.expertEvaluation.tr(),
          style: AppStyles.semiBold20Black,
        ),
        verticalSpace(6),
        Text(
          LocaleKeys.expertEvaluationRange.tr(),
          style: AppStyles.semiBold14Gray1,
        ),
        verticalSpace(20),
        Column(
          children: List.generate(
            carDetailsCubit.evaluationsList.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: EvaluationItem(
                    title: carDetailsCubit.evaluationsList[index].title,
                    value: carDetailsCubit.evaluationsList[index].value,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
