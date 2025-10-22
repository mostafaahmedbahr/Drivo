import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/features/register/presentation/cubit/register_states.dart';
import '../../../../main_importants.dart';

class RegisterUserTypes extends StatelessWidget {
  const RegisterUserTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return BlocBuilder<RegisterCubit , RegisterStates>(
              buildWhen:(previous, current) {
                return current is ToggleTypesState;
              },
              builder:  (context,state){
                var registerCubit = context.read<RegisterCubit>();
                return InkWell(
                  onTap: (){
                    registerCubit.toggleTypes(index);
                  },
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:registerCubit.typeIndex==index ?  AppColors.shipGray : AppColors.whiteColor,
                      border: Border.all(
                        color:registerCubit.typeIndex==index ?  AppColors.shipGray : AppColors.greyColor1,
                      )
                    ),
                    child: Center(
                        child: Text(registerCubit.typesName[index],

                          style: registerCubit.typeIndex==index ?AppStyles.semiBold14White : AppStyles.semiBold14Gray1,)),
                  ),
                );
              },

            );
          },
          separatorBuilder: (context,index){
            return horizontalSpace(12);
          },
          itemCount: context.read<RegisterCubit>().typesName.length
      ),
    );
  }
}
