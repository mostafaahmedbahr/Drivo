import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter/material.dart';
 import '../../../../main_importants.dart';

class CarGalleryImagesScreen extends StatefulWidget {
  final List<String> carImages;
  final int initialIndex;

  const CarGalleryImagesScreen({
    super.key,
    required this.carImages,
    required this.initialIndex,
  });

  @override
  State<CarGalleryImagesScreen> createState() => _CarGalleryImagesScreenState();
}

class _CarGalleryImagesScreenState extends State<CarGalleryImagesScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          '${_currentIndex + 1} / ${widget.carImages.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: widget.carImages.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.carImages[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                heroAttributes:
                PhotoViewHeroAttributes(tag: widget.carImages[index]),
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            pageController: _pageController,
            onPageChanged: _onPageChanged,

            // 🔹 هنا الشيمر أو نسبة التحميل
            loadingBuilder: (context, event) {
              final progress = event == null
                  ? 0.0
                  : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1);

              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 8,
                        color: Colors.white, // اللون الأبيض
                        backgroundColor: Colors.white24, // خلفية خفيفة للدائرة
                      ),
                    ),
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },




          ),

          // 🔹 مؤشر الصور السفلي
          if (widget.carImages.length > 1)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.carImages.length, (index) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white54,
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
