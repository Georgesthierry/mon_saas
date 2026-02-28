import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/services_provider.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';

class ServicePage extends ConsumerWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(serviceProvider);

    return AppScaffold(
      slivers: [
        /// ===== TITLE =====
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: [
                Text(
                  "Nos Services",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "Des solutions modernes pour développer votre activité",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        /// ===== DATA =====
        servicesAsync.when(
          loading: () => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          error: (err, _) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(child: Text("Erreur : $err")),
            ),
          ),
          data: (services) {
            return context.isDesktop
                ? _ServiceDesktop(services: services)
                : _ServicePhone(services: services);
          },
        ),
      ],
    );
  }
}
class _ServiceDesktop extends StatelessWidget {
  final List services;
  const _ServiceDesktop({required this.services});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final service = services[index];

            return StyledCard(
              borderEffect: true,
              child: _ServiceCardContent(service: service),
            );
          },
          childCount: services.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          childAspectRatio: 1.1,
        ),
      ),
    );
  }
}

class _ServicePhone extends StatelessWidget {
  final List services;
  const _ServicePhone({required this.services});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 320,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          itemCount: services.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final service = services[index];

            return SizedBox(
              width: 260,
              child: StyledCard(
                borderEffect: true,
                child: _ServiceCardContent(service: service),
              ),
            );
          },
        ),
      ),
    );
  }
}
class _ServiceCardContent extends StatelessWidget {
  final dynamic service;
  const _ServiceCardContent({required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// IMAGE ICON (si URL)
        Image.network(
          service.icon,
          height: 48,
          width: 48,
          errorBuilder: (_, __, ___) =>Icon(Icons.auto_awesome,color:Theme.of(context).colorScheme.primary),
        ),

        const SizedBox(height: 20),

        Text(
          service.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Text(
            service.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}