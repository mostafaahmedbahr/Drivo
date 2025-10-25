import 'package:drivo/features/home/presentation/widgets/car_item.dart';
import 'package:drivo/main_importants.dart';

class AllCarsList extends StatelessWidget {
  const AllCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context,index){
            return CarItem(fullWidth: true,);
          },
          separatorBuilder: (context,index){
            return verticalSpace(12);
          },
          itemCount: 10,
      ),
    );
  }
}
