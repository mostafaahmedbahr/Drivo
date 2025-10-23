import 'package:drivo/main_importants.dart';

class CarNameAndDes extends StatelessWidget {
  const CarNameAndDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Car Name",
          style: AppStyles.semiBold20Black,
        ),
        Row(
          children: [
            Text(
              "( 4.5 ",
              style: AppStyles.yellow16Bold,
            ),
            Icon(Icons.star,size: 20,color: AppColors.yellowColor,),
            Text(
              " )",
              style: AppStyles.yellow16Bold,
            ),
          ],
        ),
      ],
    );
  }
}
