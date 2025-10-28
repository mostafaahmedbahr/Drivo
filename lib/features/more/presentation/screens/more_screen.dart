import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/list_tile_list_item.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            ListTileListItem(
              leadingImage: SvgImages.taller,
              title: LocaleKeys.taller.tr(),
              onTap: (){

              },
            ),
            ListTileListItem(
              leadingImage: SvgImages.branches,
              title: LocaleKeys.branches.tr(),
              onTap: (){

              },
            ),
            ListTileListItem(
              leadingImage: SvgImages.support,
              title: LocaleKeys.support.tr(),
              onTap: (){

              },
            ),
            ListTileListItem(
              leadingImage: SvgImages.drivo,
              title: LocaleKeys.aboutDrivo.tr(),
              onTap: (){

              },
            ),
            ListTileListItem(
              leadingImage: SvgImages.mobile,
              title: LocaleKeys.contactUs.tr(),
              onTap: (){

              },
            ),
            ListTileListItem(
              leadingImage: SvgImages.settings,
              title: LocaleKeys.settings.tr(),
              onTap: (){

              },
            ),

          ]),
        ),
      ),
    );
  }
}
