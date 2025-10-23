import '../../../../main_importants.dart';

class CarFeatureItem extends StatelessWidget {
  const CarFeatureItem({super.key, required this.svgImage, required this.value});
  final String svgImage;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width:  80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.greyColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svgImage,height: 30,width: 30,fit: BoxFit.cover,),
          Text(value),
        ],
      ),
    );
  }
}
