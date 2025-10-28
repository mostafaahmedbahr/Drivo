import 'package:drivo/features/profile/presentation/widgets/profile_menu_item.dart';

import '../../../../main_importants.dart';

class ProfileMenuListItems extends StatelessWidget {
  const ProfileMenuListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'تعديل الملف الشخصي',
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.lock_outline,
            title: 'تغيير كلمة المرور',
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.credit_card,
            title: 'البطاقات المصرفية',
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.history,
            title: 'السجل',
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.notifications_active_outlined,
            title: 'الإشعارات',
            onTap: () {},
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.blue[800],
            ),
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.help_outline,
            title: 'المساعدة والدعم',
            onTap: () {},
          ),
          _buildDivider(),
          ProfileMenuItem(
            icon: Icons.privacy_tip,
            title: 'الخصوصية',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
Widget _buildDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Divider(color: Colors.grey[200], height: 1),
  );
}