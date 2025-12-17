import '../../../../main_importants.dart';
import '../screens/booking_screen.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            //_showBookingDetails(booking);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Car Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomNetWorkImage(
                      imageUrl: booking.carImage,
                      raduis: 12,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),

                // Booking Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            booking.carName,
                            style: AppStyles.extraBold16ShipGray,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking.status),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              booking.status,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(4),
                      Text(
                        booking.customerName,
                        style: AppStyles.semiBold14Black,
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: AppColors.shipGray),
                          horizontalSpace(4),
                          Text(
                            '${booking.date} • ${booking.time}',
                            style: AppStyles.medium12Black,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: booking.type == 'تأجير'
                                  ? Colors.blue.withValues(alpha: 0.1)
                                  : Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              booking.type,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: booking.type == 'تأجير' ? AppColors.blueColor : AppColors.greenColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 14, color: AppColors.shipGray),
                          horizontalSpace(4),
                          Text(
                            booking.duration,
                            style: AppStyles.medium12Black,
                          ),
                          const Spacer(),
                          Text(
                            '${booking.amount.toStringAsFixed(0)} ${booking.type == 'تأجير' ? 'ريال/يوم' : 'ريال'}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case 'جارية':
      return AppColors.blueColor.withValues(alpha: 0.8);
    case 'مكتملة':
      return AppColors.greenColor.withValues(alpha: 0.8);
    case 'ملغية':
      return AppColors.redColor.withValues(alpha: 0.8);
    default:
      return AppColors.orange;
  }
}