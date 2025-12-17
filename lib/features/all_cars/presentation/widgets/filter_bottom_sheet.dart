import '../../../../main_importants.dart';


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedYear;
  String? selectedPrice;
  String? selectedFuelType;

  final List<String> brands = ['تويوتا', 'هيونداي', 'كيا', 'مرسيدس', 'بي ام دبليو'];
  final List<String> models = ['SUV', 'سيدان', 'هايبرد', 'كروس اوفر'];
  final List<String> years = ['2023', '2022', '2021', '2020', '2019'];
  final List<String> prices = ['0-50,000', '50,000-100,000', '100,000-200,000', '200,000+'];
  final List<String> fuelTypes = ['بنزين', 'ديزل', 'كهرباء', 'هايبرد'];

  void _applyFilter() {
    // تطبيق الفلتر هنا
    Map<String, String?> filters = {
      'brand': selectedBrand,
      'model': selectedModel,
      'year': selectedYear,
      'price': selectedPrice,
      'fuelType': selectedFuelType,
    };

    print('Applied Filters: $filters');
    Navigator.pop(context);
  }

  void _resetFilter() {
    setState(() {
      selectedBrand = null;
      selectedModel = null;
      selectedYear = null;
      selectedPrice = null;
      selectedFuelType = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'فلتر السيارات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.shipGray,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.shipGray),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Filter Options
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDropdown(
                    label: 'الماركة',
                    value: selectedBrand,
                    items: brands,
                    onChanged: (value) {
                      setState(() {
                        selectedBrand = value;
                      });
                    },
                  ),

                  _buildDropdown(
                    label: 'الموديل',
                    value: selectedModel,
                    items: models,
                    onChanged: (value) {
                      setState(() {
                        selectedModel = value;
                      });
                    },
                  ),

                  _buildDropdown(
                    label: 'السنة',
                    value: selectedYear,
                    items: years,
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value;
                      });
                    },
                  ),

                  _buildDropdown(
                    label: 'السعر',
                    value: selectedPrice,
                    items: prices,
                    onChanged: (value) {
                      setState(() {
                        selectedPrice = value;
                      });
                    },
                  ),

                  _buildDropdown(
                    label: 'نوع الوقود',
                    value: selectedFuelType,
                    items: fuelTypes,
                    onChanged: (value) {
                      setState(() {
                        selectedFuelType = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Buttons
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: CustomButton(btnText:  Text('إعادة تعيين',style: AppStyles.semiBold18Black,), onPressed: _resetFilter,btnColor: AppColors.whiteColor,borderColor: AppColors.shipGray,),),
              horizontalSpace(12),
              Expanded(child: CustomButton(btnText:  Text('تطبيق الفلتر',style: AppStyles.semiBold18White,), onPressed: _applyFilter)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.shipGray,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: AppColors.shipGray),
                hint: Text('اختر $label'),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}