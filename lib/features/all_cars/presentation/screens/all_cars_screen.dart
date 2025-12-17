import 'package:drivo/core/shared_widgets/container_search_widget.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/all_cars_list.dart';
import '../widgets/filter_icon.dart';

class AllCarsScreen extends StatelessWidget {
  const AllCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.whatIsYourChoice.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: ContainerSearchWidget()),
                horizontalSpace(12),
                FilterIcon(),

              ],
            ),
            verticalSpace(20),
            AllCarsList(),

          ],
        ),
      ),
    );
  }
}
