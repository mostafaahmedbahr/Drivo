import 'package:drivo/features/contracts/presentation/cubit/contracts_cubit.dart';
import 'package:drivo/main_importants.dart';

import '../widgets/contracts_filter.dart';
import '../widgets/contracts_list.dart';
import '../widgets/contracts_toggle_buttons.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ContractsCubit(),
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ContractsFilter(),
              verticalSpace(24),
              ContractsToggleButtons(),
              verticalSpace(24),
              ContractsList(),
            ],
          ),
        )),
      ),
    );
  }
}
