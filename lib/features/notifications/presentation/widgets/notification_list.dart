
import '../../../../../main_importants.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (context, index) {
        return NotificationItem(
          id: "1",
          title: "title",
          message: "message",
          time: "time",
          type: "type",
          icon: Icons.rice_bowl,
          onTap: () {

          },
        );
      },
    );
  }


}