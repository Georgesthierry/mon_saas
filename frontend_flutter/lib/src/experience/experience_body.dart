import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/home_title_subtitle.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';

const expLen = 6;
const exPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPointsFactor = expHeight /2 - exPointsSize /2 ;

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeTitleSubtitle(title: context.texts.experiences, subtitle: context.texts.experienceDescription),
        SizedBox(height: 32,),
        context.isDesktop ?
        DesktopExperienceBody(): PhoneExperienceBody()
      ],
    );
  }
}

class DesktopExperienceBody extends StatelessWidget {
  const DesktopExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: expLen * expScaleFactor + expPointsFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                context.colorScheme.primary.withOpacity(0),
                context.colorScheme.primary,
                context.colorScheme.primary.withOpacity(0),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          for (int i = 0; i < expLen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i* 150,
                  right: 400,
                  left: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExperienceItem(),
                      SizedBox(
                        width: 100,
                        child: DottedLine(
                          dashColor: context.colorScheme.onBackground,
                        ),
                      ),

                    ],
                  ))
            else
              Positioned(
                  top: i* 150,
                  left: 400,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: DottedLine(
                          dashColor: context.colorScheme.onBackground,
                        ),
                      ),
                      ExperienceItem(),

                    ],
                  )),
            Positioned(
              top: i * expScaleFactor + expPointsFactor,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: exPointsSize,
                  height: exPointsSize,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onBackground.withOpacity(0.25),
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    width: exPointsSize /2,
                    height: exPointsSize /2,
                    decoration: BoxDecoration(
                        color: context.colorScheme.onBackground.withOpacity(0.8),
                        shape: BoxShape.circle
                    ),
                  ),
                ))
          ]
        ],
      ),
    );
  }
}

class PhoneExperienceBody extends StatelessWidget {
  const PhoneExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ExperienceItem(),
          SizedBox(height: 60,child: DottedLine(
            dashColor: Colors.white,
            direction: Axis.vertical,
          ),),
          ExperienceItem(),
          SizedBox(height: 60,child: DottedLine(
            dashColor: Colors.white,
            direction: Axis.vertical,
          ),),
          ExperienceItem(),
          SizedBox(height: 60,child: DottedLine(
            dashColor: Colors.white,
            direction: Axis.vertical,
          ),),
          ExperienceItem(),
          SizedBox(height: 60,child: DottedLine(
            dashColor: Colors.white,
            direction: Axis.vertical,
          ),),

        ],
      ),
    );
  }
}


const expWidth = 300.0;
const expHeight = 230.0;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: expWidth,
      height: expHeight,
      borderEffect: true,
      child: Column(
        children: [
          Text("Experience Title",
              style: context.textStyle.bodyLgBold
                  .copyWith(color: context.colorScheme.onBackground)),
          Expanded(
              child: Column(
            children: [
              _ExperienceDescriptionItem(),
              _ExperienceDescriptionItem(),
              _ExperienceDescriptionItem(),
              _ExperienceDescriptionItem(),
            ],
          ))
        ],
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  const _ExperienceDescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onBackground,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
            child: Text(
          "Description Item",
          style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorScheme.onSurface, fontWeight: FontWeight.w400),
        ))
      ],
    );
  }
}
