import 'package:drivo/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:drivo/features/booking/presentation/widgets/booking_card.dart';
import 'package:drivo/main_importants.dart';

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return BookingCard(booking: context.read<BookingCubit>().bookings[index]);
        },
        separatorBuilder: (context,index){
          return verticalSpace(12);
        },
        itemCount: context.read<BookingCubit>().bookings.length,
    );
  }
}
