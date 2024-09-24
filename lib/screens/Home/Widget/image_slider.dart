import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChanged;
  final int currentSlid;
  const ImageSlider(
      {super.key, required this.currentSlid, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChanged,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  'images/slider.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider2.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider3.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/slider4.jpeg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentSlid == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentSlid == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
