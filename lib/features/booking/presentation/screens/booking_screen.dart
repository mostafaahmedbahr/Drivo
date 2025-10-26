import 'package:drivo/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:drivo/features/booking/presentation/widgets/toggle_switch_buttons.dart';
import 'package:drivo/main_importants.dart';
import '../widgets/booking_statistics.dart';
import '../widgets/bookings_list.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BookingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(

              children: [
                // Toggle Switch
                 ToggleSwitchButtons(),
                verticalSpace(24),

                // Statistics
                BookingStatistics(),
                verticalSpace(24),

                // Bookings List
                BookingsList(),

              ],
            ),
          ),
        ),
      ),
    );
  }









  // Widget _buildEmptyState() {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(
  //           Icons.receipt_long,
  //           size: 80,
  //           color: AppColors.greyColor2,
  //         ),
  //         const SizedBox(height: 16),
  //         Text(
  //           'لا توجد حجوزات',
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.greyColor,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           'لا توجد حجوزات تطابق الفلتر المحدد',
  //           style: TextStyle(
  //             fontSize: 14,
  //             color: AppColors.greyColor2,
  //           ),
  //         ),
  //         const SizedBox(height: 16),
  //         ElevatedButton(
  //           onPressed: () {
  //
  //           },
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: AppColors.orange,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //           ),
  //           child: const Text(
  //             'إعادة تعيين الفلتر',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }



}

class Booking {
  final String id;
  final String carName;
  final String carImage;
  final String customerName;
  final String date;
  final String time;
  final String status;
  final double amount;
  final String type;
  final String duration;

  Booking({
    required this.id,
    required this.carName,
    required this.carImage,
    required this.customerName,
    required this.date,
    required this.time,
    required this.status,
    required this.amount,
    required this.type,
    required this.duration,
  });
}