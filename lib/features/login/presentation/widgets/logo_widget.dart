import 'package:drivo/core/utils/app_images/png_images.dart';

import '../../../../main_importants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(PngImages.logo2,height: 150,width: 150,fit: BoxFit.contain,);
  }
}
