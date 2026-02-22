import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';

class TestimonyItem extends StatelessWidget {
  const TestimonyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircleAvatar(
                  backgroundImage: Image.network('src').image,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Text('Testimony Name', style: context.textStyle.bodyLgBold.copyWith(color: context.colorScheme.onBackground),))
            ],
        ),
          SizedBox(
            height: 16,
          ),
          Text("Text of Textimony ", style: context.textStyle.bodyLgMedium.copyWith(
            color: context.colorScheme.onBackground
          ),)
        ],
      ),
    );
  }
}
