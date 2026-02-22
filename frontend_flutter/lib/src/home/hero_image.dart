import 'package:flutter/cupertino.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.6,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(250)),
        child: Image.asset('assets/images/photo_georges.jpeg',fit: BoxFit.cover),
      ),
    );
  }
}
