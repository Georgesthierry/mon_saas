import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';
import 'package:yenlei_flutter/src/models/testimonies_model.dart';

class TestimonyItem extends StatelessWidget {
  final Testimony testimony;
  const TestimonyItem({super.key, required this.testimony});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(testimony.photo ?? ''),
                onBackgroundImageError: (_, __) {}, // évite crash si image null
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  testimony.name,
                  style: context.textStyle.bodyLgBold
                      .copyWith(color: context.colorScheme.onBackground),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            testimony.company,
            style: context.textStyle.bodyLgMedium
                .copyWith(color: context.colorScheme.tertiary),
          ),
          const SizedBox(height: 8),
          Text(
            testimony.message,
            style: context.textStyle.bodyLgMedium
                .copyWith(color: context.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
