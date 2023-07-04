import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Carousel'),
        ),
        body: ImageCarousel(),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> imageList = [
    'assets/p1.jpg',
    'assets/p3.jpg',
    'assets/p2.jpg',
    'assets/p4.jpg',
    'assets/p5.jpg',
    'assets/p6.jpg',
    'assets/p7.jpg',
    'assets/p8.jpg',
    'assets/p9.jpg',
    'assets/p5.jpg',
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: PageView.builder(
                itemCount: imageList.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    if (currentIndex > 0) {
                      currentIndex--;
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  });
                },
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    if (currentIndex < imageList.length - 1) {
                      currentIndex++;
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Text(
          '${currentIndex + 1}/${imageList.length}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
