
import '../../../../main_importants.dart';

class ContractsFilter extends StatelessWidget {
  const ContractsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: ContainerSearchWidget()),
        horizontalSpace(12),
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: Colors.white),
          ),
        ),

      ],
    );
  }
}
