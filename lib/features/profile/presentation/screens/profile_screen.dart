import 'package:drivo/main_importants.dart';

import '../widgets/logout_button.dart';
import '../widgets/member_ship_card.dart';
import '../widgets/profile_main_info_header.dart';
import '../widgets/profile_menu_list_items_.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ProfileMainInfoHeader(),
            verticalSpace(24),
            MembershipCard(),
            verticalSpace(24),
            ProfileMenuListItems(),
            verticalSpace(24),
            LogoutButton(),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
