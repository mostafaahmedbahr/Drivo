import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/shared_widgets/cubits/lang_cubit/lang_cubit.dart';
import '../../../../../main_importants.dart';
import 'list_tile_list_item.dart';

class Lang extends StatelessWidget {
  const Lang({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, currentLocale) {
        return ListTileListItem(
          leadingImage: SvgImages.language,
          title: LocaleKeys.language.tr(),
          onTap: () {
            _showLanguageBottomSheet(context, currentLocale);
          },
        );
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context, Locale currentLocale) {
    String? selectedLanguageCode;
    bool isLanguageChanged = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: AppColors.shipGray),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.selectLanguage.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),

                      ],
                    ),
                  ),



                  Expanded(
                    child: _buildLanguageList(
                      context,
                      currentLocale,
                      selectedLanguageCode,
                          (String code) {
                        setState(() {
                          selectedLanguageCode = code;
                          isLanguageChanged = (selectedLanguageCode != currentLocale.languageCode);
                        });
                      },
                    ),
                  ),


                  if (isLanguageChanged && selectedLanguageCode != null)

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          btnText: Text(   LocaleKeys.changeLanguage.tr(),style: AppStyles.semiBold18White,),
                          onPressed: (){
                            _changeLanguage(context, selectedLanguageCode!);
                          },
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLanguageList(
      BuildContext context,
      Locale currentLocale,
      String? selectedLanguageCode,
      Function(String) onLanguageSelected,
      ) {
    final languages = [
      {
        'code': 'en',
        'name': 'English',
        'localName': 'English',
        'flag': '🇺🇸',
      },
      {
        'code': 'ar',
        'name': 'Arabic',
        'localName': 'العربية',
        'flag': '🇸🇦',
      },
    ];

    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: languages.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final language = languages[index];
        final isSelected = selectedLanguageCode != null
            ? selectedLanguageCode == language['code']
            : currentLocale.languageCode == language['code'];

        return _buildLanguageItem(
          context: context,
          language: language,
          isSelected: isSelected,
          onTap: () => onLanguageSelected(language['code']!),
        );
      },
    );
  }

  Widget _buildLanguageItem({
    required BuildContext context,
    required Map<String, String> language,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.orange : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Flag
            Text(
              language['flag']!,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(width: 16),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language['name']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    language['localName']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),


            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.orange,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    final newLocale = Locale(languageCode, '');


    final languageCubit = BlocProvider.of<LanguageCubit>(context);


    languageCubit.changeLanguage(context, newLocale);

    Navigator.pop(context);
    context.pushNamedAndRemoveAll(Routes.layoutScreen);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.languageChangedTo.tr()
          // languageCode == 'ar'
          //     ? 'تم تغيير اللغة إلى العربية'
          //     : 'Language changed to English',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}