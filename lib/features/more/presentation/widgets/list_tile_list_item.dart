import '../../../../../main_importants.dart';

class ListTileListItem extends StatelessWidget {
  const ListTileListItem({super.key, required this.title,
    required this.leadingImage, required this.onTap,

  });
  final String title;
  final String leadingImage;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        height: 30,
        width: 30,
        leadingImage,colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn),),
      title: Text(title),
      trailing: SvgPicture.asset(SvgImages.arrow),
    );
  }
}
