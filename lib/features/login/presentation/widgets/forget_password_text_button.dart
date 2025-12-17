import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart, // RTL/LTR aware
      child: TextButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.forgetPassword.tr(),
          style: AppStyles.regular16Topaz,
        ),
      ),
    );
  }
}
