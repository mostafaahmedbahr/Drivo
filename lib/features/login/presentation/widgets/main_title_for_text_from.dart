
import '../../../../main_importants.dart';

class MainTitleForTextFrom extends StatelessWidget {
  const MainTitleForTextFrom({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width:  110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.shipGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(image),
          Text(title,style: AppStyles.semiBold14White,)
        ],
      ),
    );
  }
}
