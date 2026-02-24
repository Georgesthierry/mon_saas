import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/data/services/profile_service.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';

// Provider pour récupérer le profil
final profileProvider = FutureProvider<Profile>((ref) async {
  return await ProfileService().getProfile();
});

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return AppScaffold(
      slivers: [
        profileAsync.when(
          loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator())),
          error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text("Erreur: $err"))),
          data: (profile) => SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        "${ApiConstants.baseUrl}${profile.photo}"),
                  ),
                  const SizedBox(height: 16),
                  SEOText(
                    profile.name,
                    style: context.textStyle.titleSmBold,
                  ),
                  const SizedBox(height: 8),
                  SEOText(
                    profile.profession,
                    style: context.textStyle.bodyMdMedium,
                  ),
                  const SizedBox(height: 8),
                  SEOText(
                    profile.description,
                    style: context.textStyle.bodyMdMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}