import 'package:drivo/main_importants.dart';

class CarNameAndDes extends StatelessWidget {
  const CarNameAndDes({super.key, required this.name, required this.des, required this.rate});
  final String name;
  final String des;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppStyles.semiBold20Black,
        ),
        Row(
          children: [
            Text(
              "( $rate ",
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
