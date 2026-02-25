import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/experience_provider.dart';
import 'package:yenlei_flutter/commons/widgets/home_title_subtitle.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';
import 'package:yenlei_flutter/src/models/experiences_model.dart';

const expLen = 6;
const exPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPointsFactor = expHeight /2 - exPointsSize /2 ;

class ExperienceBody extends ConsumerWidget  {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final experiencesAsync = ref.watch(experiencesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeTitleSubtitle(title: context.texts.experiences, subtitle: context.texts.experienceDescription),
        SizedBox(height: 32,),
        experiencesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("Erreur: $err")),
          data: (experiences) => context.isDesktop
              ? DesktopExperienceBody(experiences: experiences)
              : PhoneExperienceBody(experiences: experiences),
        ),
      ],
    );
  }
}

class DesktopExperienceBody extends StatelessWidget {
  final List<Experience> experiences;
  const DesktopExperienceBody({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final expLen = experiences.length;
    return SingleChildScrollView(
      child: Container(
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
                        ExperienceItem(experience: experiences[i]),
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
                        ExperienceItem(experience: experiences[i]),
      
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
      ),
    );
  }
}

class PhoneExperienceBody extends StatelessWidget {
  final List<Experience> experiences;
  const PhoneExperienceBody({super.key,  required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400, // ou MediaQuery.of(context).size.height / 2 selon ton design
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceItem(experience: experiences[index]);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 60,
            child: Center(
              child: DottedLine(
                dashColor: Colors.white,
                direction: Axis.vertical,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


const expWidth = 300.0;
const expHeight = 230.0;

class ExperienceItem extends StatelessWidget {
  final Experience experience;
  const ExperienceItem({super.key, required this.experience, });

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: expWidth,
      height: expHeight,
      borderEffect: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.role,
            style: context.textStyle.bodyLgBold
                .copyWith(color: context.colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: experience.descriptions.isNotEmpty
                  ? experience.descriptions
                  .map((desc) =>
                  _ExperienceDescriptionItem(description: desc))
                  .toList()
                  : [
                Text(
                  "Pas de description disponible",
                  style: context.textStyle.bodyLgMedium.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  final String description;
  const _ExperienceDescriptionItem({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 4,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surface,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              description,
              style: context.textStyle.bodyLgMedium.copyWith(
                color: context.colorScheme.surface,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
