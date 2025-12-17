import 'package:drivo/core/utils/app_images/svg_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import '../../../../../main_importants.dart';
 import '../cubit/layout_cubit.dart';
import '../cubit/layout_states.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return FlashyTabBar(
          selectedIndex: LayoutCubit.pageIndex,
          showElevation: true,
          onItemSelected: (index) {
            context.read<LayoutCubit>().changeBottomNav(index, context);
          },
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          iconSize: 24,
          backgroundColor: AppColors.whiteColor,
          items: [
            _buildTabItem(
              icon: SvgImages.more,
              title: LocaleKeys.more,
              index: 0,
            ),
            _buildTabItem(
              icon: SvgImages.contracts,
              title: LocaleKeys.myContracts,
              index: 1,
            ),
            _buildTabItem(
              icon: SvgImages.home,
              title: LocaleKeys.home,
              index: 2,
            ),
            _buildTabItem(
              icon: SvgImages.booking,
              title: LocaleKeys.myReservations,
              index: 3,
            ),
            _buildTabItem(
              icon: SvgImages.profile,
              title: LocaleKeys.profile,
              index: 4,
            ),
          ],
        );
      },
    );
  }

  FlashyTabBarItem _buildTabItem({
    required String icon,
    required String title,
    required int index,
  }) {
    return FlashyTabBarItem(
      activeColor: AppColors.orange,
      icon: SvgPicture.asset(
        icon,
        width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
          LayoutCubit.pageIndex == index
              ? AppColors.orange
              : AppColors.greyColor4,
          BlendMode.srcIn,
        ),
      ),
      title: Text(title.tr()),
    );
  }
}