import '../../../../main_importants.dart';

class ProfileNameAndNotificationIcon extends StatelessWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomNetWorkImage(
              raduis: 50,
              imageUrl: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            horizontalSpace(6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Hi, Mostafa Bahr",
                    style: AppStyles.semiBold16Black,
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
            onTap: (){
              context.pushNamed(Routes.notificationsScreen);
            },
            child: SvgPicture.asset(SvgImages.notify,colorFilter: ColorFilter.mode(AppColors.orange, BlendMode.srcIn),)),
      ],
    );
  }
}
