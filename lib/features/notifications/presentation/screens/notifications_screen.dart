import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';
import '../widgets/notification_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.notifications.tr()),
      ),
      body: NotificationList(),
    );
  }


}