import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/profile_provider.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

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
                        profile.photo),
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