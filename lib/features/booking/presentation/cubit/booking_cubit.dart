import '../../../../main_importants.dart';
import '../screens/booking_screen.dart';
import 'booking_states.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitState());

  static BookingCubit get(context) => BlocProvider.of(context);


  int currentIndex = 1;
  toggleSwitchButtons(int index){
    currentIndex = index;
    emit(ToggleSwitchButtonsState());
  }


  final List<Booking> bookings = [
    Booking(
      id: 'BK001',
      carName: 'BMW X6 2023',
      carImage: 'https://www.topgear.com/sites/default/files/news-listicle/image/2023/09/LEAD.jpg?w=827&h=465',
      customerName: 'أحمد محمد',
      date: '2024-01-15',
      time: '10:00 AM',
      status: 'جارية',
      amount: 250.0,
      type: 'تأجير',
      duration: '3 أيام',
    ),
    Booking(
      id: 'BK002',
      carName: 'مرسيدس S500 2024',
      carImage: 'https://www.topgear.com/sites/default/files/2023/09/1%20Volvo_XC40_0.jpg?w=827&h=465',
      customerName: 'سارة عبدالله',
      date: '2024-01-10',
      time: '02:30 PM',
      status: 'مكتملة',
      amount: 180000.0,
      type: 'بيع',
      duration: 'دفعة واحدة',
    ),
    Booking(
      id: 'BK003',
      carName: 'تويوتا كامري 2023',
      carImage: 'https://www.topgear.com/sites/default/files/2023/09/2%20Cadillac_CT5_0.jpg?w=827&h=465',
      customerName: 'خالد سالم',
      date: '2024-01-18',
      time: '09:00 AM',
      status: 'جارية',
      amount: 150.0,
      type: 'تأجير',
      duration: '5 أيام',
    ),
    Booking(
      id: 'BK004',
      carName: 'نيسان باترول 2024',
      carImage: 'https://www.topgear.com/sites/default/files/2023/09/2%20Cadillac_CT5_0.jpg?w=827&h=465"',
      customerName: 'فاطمة علي',
      date: '2024-01-05',
      time: '11:00 AM',
      status: 'ملغية',
      amount: 300.0,
      type: 'تأجير',
      duration: '7 أيام',
    ),
    Booking(
      id: 'BK005',
      carName: 'هيونداي النترا 2023',
      carImage: 'https://www.topgear.com/sites/default/files/2023/09/2%20Cadillac_CT5_0.jpg?w=827&h=465',
      customerName: 'محمد حسن',
      date: '2024-01-20',
      time: '03:00 PM',
      status: 'مكتملة',
      amount: 120000.0,
      type: 'بيع',
      duration: 'دفعة واحدة',
    ),
  ];
}