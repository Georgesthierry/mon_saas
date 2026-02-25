import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/testimonies_provider.dart';
import 'package:yenlei_flutter/src/models/testimonies_model.dart';
import 'package:yenlei_flutter/src/testimony/views/testimony_item.dart';

class TestimonyList extends ConsumerWidget{
  const TestimonyList({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final testimoniesAsync = ref.watch(testimonyProvider);
    return testimoniesAsync.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: CircularProgressIndicator(),
          ),
        ),
      ),

      error: (err, stack) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text("Erreur: $err"),
          ),
        ),
      ),

      data: (testimonies) {
        return context.isDesktopOrTablet
            ? _DesktopTestimony(testimonies: testimonies)
            : _PhoneTestimony(testimonies: testimonies);
      },
    );
  }
}

class _DesktopTestimony extends StatelessWidget {
  final List<Testimony> testimonies;
  const _DesktopTestimony({required this.testimonies});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return TestimonyItem(testimony: testimonies[index]);
        },
        childCount: testimonies.length,
      ),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isDesktop ? 3 : 2),
    );
  }
}

class _PhoneTestimony extends StatelessWidget {
  final List<Testimony> testimonies;
  const _PhoneTestimony({required this.testimonies});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return TestimonyItem(testimony: testimonies[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: testimonies.length,
    );
  }
}


