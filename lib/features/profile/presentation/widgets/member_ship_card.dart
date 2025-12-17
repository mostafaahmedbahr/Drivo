import '../../../../main_importants.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.orange.withValues(alpha: 0.8),
            AppColors.neonCarrot.withValues(alpha: 0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'العضوية الذهبية',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Icon(Icons.workspace_premium, color: Colors.white),
            ],
          ),
          verticalSpace(8),
          Text(
            'تنتهي في 15 ديسمبر 2024',
            style: TextStyle(
              fontSize: 14,

            ),
          ),
          verticalSpace(16),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.7),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '70% مكتمل',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'تبقى 3 أشهر',
                style: TextStyle(
                  fontSize: 12,

                ),
              ),
            ],
          ),
          verticalSpace(16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'تجديد العضوية',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.orange ,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}