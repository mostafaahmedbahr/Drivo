import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';

class ContractCardItem extends StatelessWidget {
  final String contractNumber;
  final String carName;
  final String startDate;
  final String endDate;
  final String status;
  final Color statusColor;
  final String price;

  const ContractCardItem({
    super.key,
    required this.contractNumber,
    required this.carName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.statusColor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contractNumber,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            verticalSpace(16),

            // Car Info
            Row(
              children: [
                CustomNetWorkImage(
                  height: 60,
                    width: 60,
                    imageUrl: "https://www.topgear.com/sites/default/files/2023/09/2%20Cadillac_CT5_0.jpg?w=827&h=465",
                    raduis: 8,
                  fit: BoxFit.cover,
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'من $startDate إلى $endDate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            verticalSpace(16),

            // Divider
            Divider(color: Colors.grey[300]),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.totalPrice.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.shipGray,
                  ),
                ),
              ],
            ),
            
            verticalSpace(8),

            // Actions
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      btnText: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.visibility, size: 18),
                            Text(LocaleKeys.details.tr()),
                        ],
                      ),
                    height: 38,
                    onPressed: () {},
                    btnColor: AppColors.whiteColor,
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: CustomButton(
                    btnText: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.download, size: 18,color: AppColors.whiteColor,),
                        Text(LocaleKeys.download.tr(),style: TextStyle(
                          color: AppColors.whiteColor
                        ),),
                      ],
                    ),
                    height: 38,
                    onPressed: () {},
                    btnColor: Colors.blue[800],
                    borderColor: Colors.blue[800],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}