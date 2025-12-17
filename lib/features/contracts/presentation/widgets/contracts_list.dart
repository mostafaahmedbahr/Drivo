 import 'package:drivo/features/contracts/presentation/widgets/contract_card_item.dart';
import 'package:drivo/main_importants.dart';

class ContractsList extends StatelessWidget {
  const ContractsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context,index){
            return   ContractCardItem(
              contractNumber: 'CON-2024-001',
              carName: 'تويوتا كامري 2024',
              startDate: '2024-01-01',
              endDate: '2024-12-31',
              status: 'نشط',
              statusColor: AppColors.orange.withValues(alpha: 0.5),
              price: '2500',
            );
          },
          separatorBuilder: (context,index){
            return verticalSpace(12);
          },
          itemCount: 10,
      ),
    );
  }
}
