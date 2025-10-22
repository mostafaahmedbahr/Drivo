import '../../../../main_importants.dart';
import '../cubit/layout_cubit.dart';
import '../cubit/layout_states.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            layoutCubit.onPopInvoked(didPop, context);
          },
          child: Scaffold(
            body: layoutCubit.screens[LayoutCubit.pageIndex],
            bottomNavigationBar: const BottomNavigationBarWidget(),
          ),
        );
      },
    );
  }



}
