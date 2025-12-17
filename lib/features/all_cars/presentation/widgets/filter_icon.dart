import '../../../../main_importants.dart';
import 'filter_bottom_sheet.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFilterBottomSheet(context),
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.shipGray,
        ),
        child: Center(
          child: Icon(
            Icons.filter_alt,
            color: AppColors.whiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}