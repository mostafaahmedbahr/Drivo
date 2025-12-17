import 'package:carousel_slider/carousel_slider.dart';
import '../../../../main_importants.dart';

class OfferSliderImages extends StatefulWidget {
  const OfferSliderImages({super.key});

  @override
  State<OfferSliderImages> createState() => _OfferSliderImagesState();
}

class _OfferSliderImagesState extends State<OfferSliderImages> {
  int currentSlide = 0;
  final List<String> carImages = const [
    "https://www.topgear.com/sites/default/files/news-listicle/image/2023/09/LEAD.jpg?w=827&h=465",
    "https://www.topgear.com/sites/default/files/2023/09/1%20Volvo_XC40_0.jpg?w=827&h=465",
    "https://www.topgear.com/sites/default/files/2023/09/2%20Cadillac_CT5_0.jpg?w=827&h=465",
  ];
  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      items: carImages.map((imgUrl) {
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.carImagesGalleryScreen,
              arguments: {
                'carImages': carImages,
                'initialIndex': carImages.indexOf(imgUrl),
              },);
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomNetWorkImage(
                  imageUrl: imgUrl,
                  raduis: 16,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carImages.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  currentSlide == entry.key
                            ? Colors.white
                            : Colors.white.withAlpha(128),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: 170,
        aspectRatio: MediaQuery.of(context).size.width / 250,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
           setState(() {
             currentSlide=index;
           });
        },
      ),
    );
  }
}
