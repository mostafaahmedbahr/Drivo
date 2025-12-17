import 'package:drivo/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:drivo/features/booking/presentation/widgets/stat_item.dart';

import '../../../../main_importants.dart';

class BookingStatistics extends StatelessWidget {
  const BookingStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingCubit =context.read<BookingCubit>();
    final currentBookings = bookingCubit.bookings.where((b) => b.status == 'جارية').length;
    final totalAmount = bookingCubit.bookings.where((b) => b.status == 'مكتملة').fold(0.0, (sum, item) => sum + item.amount);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.orange.withValues(alpha: 0.5),
            AppColors.orange.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItem(title: 'إجمالي الحجوزات', value: '${bookingCubit.bookings.length}', icon: Icons.receipt_long),
          StatItem(title: 'قيد التنفيذ', value: '$currentBookings', icon: Icons.pending_actions),
          StatItem(title: 'الإيرادات', value: '${totalAmount.toInt()}K', icon: Icons.attach_money),

        ],
      ),
    );
  }
}
