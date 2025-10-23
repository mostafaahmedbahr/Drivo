import 'package:drivo/main_importants.dart';

class PriceAndAnotherInfo extends StatelessWidget {
  const PriceAndAnotherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "80 rs/day",
          style: AppStyles.bold24Black ,
        ),
      ],
    );
  }
}
