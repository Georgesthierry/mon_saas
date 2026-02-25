import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';
import 'package:yenlei_flutter/src/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';


class ProjectItem extends StatelessWidget {
  final Project project;
  const ProjectItem({super.key, required this.project});

  Future<void> _openUrl() async {
    final uri = Uri.parse(project.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Impossible d'ouvrir le lien");
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = project.image.startsWith('http')
        ? project.image
        : "${ApiConstants.baseUrl}${project.image}";
    return StyledCard(
      child: AspectRatio(
          aspectRatio: 0.7,
      child:Column(
        children: [
          AspectRatio(aspectRatio: 1.5,
          child: ClipRRect(
            child: Image.network(imageUrl,fit: BoxFit.cover),
            
          ),),
          SizedBox(width: 24,),
          SEOText(project.description, maxLines: 3, overflow: TextOverflow.ellipsis,style: context.textStyle.bodyLgBold.copyWith(
            color: context.colorScheme.onBackground
          ),
            textRendererStyle: TextRendererStyle.header4,
          ),
          SizedBox(width: 8,),
          Expanded(child: SEOText(project.description, style: context.textStyle.bodyLgMedium.copyWith(color: context.colorScheme.onSurface),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,))
        ],
      ) ,),
    );
  }
}
