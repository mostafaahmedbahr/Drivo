import '../../../../main_importants.dart';

class ProfileMainInfoHeader extends StatelessWidget {
  const ProfileMainInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[100],
              border: Border.all(color: Colors.orange[300]!, width: 2),
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.orange,
            ),
          ),
          horizontalSpace(16),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'mostafa bahr',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'mostafa@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor3,
                  ),
                ),
                verticalSpace(8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Text(
                    'عضو مميز',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Edit Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: AppColors.shipGray),
          ),
        ],
      ),
    );
  }
}
