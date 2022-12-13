import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';

class HomeCarousalWidget extends StatelessWidget {
  const HomeCarousalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) => CarouselSlider.builder(
        itemCount: value.carousal.length,
        itemBuilder: (context, index, realIndex) {
          final carousal = value.carousal[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    carousal.image,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${carousal.offer}%",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            Text(
                              carousal.title,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              carousal.description,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}
