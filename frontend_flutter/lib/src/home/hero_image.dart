import 'package:flutter/cupertino.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';


class HeroImage extends StatelessWidget {
  final Profile profile;
  const HeroImage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 0.6,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(250)),
        child: Image.network(profile.photo, fit: BoxFit.cover),
      )
    );
  }
}
