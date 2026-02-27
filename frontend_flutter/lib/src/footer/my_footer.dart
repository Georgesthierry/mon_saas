import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yenlei_flutter/commons/constantes/app_icon.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/app_logo.dart';
import 'package:yenlei_flutter/commons/widgets/app_menu.dart';
import 'package:yenlei_flutter/commons/widgets/small_menu.dart';
import 'package:yenlei_flutter/src/powered_by_flutter/power_by_flutter.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter(): _PhoneFooter(),
          Divider(
            height: 24,
          ),
         PowerByFlutter()

        ],
      ),
    );
  }
}

class _PhoneFooter extends StatelessWidget {
  const _PhoneFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogo(),
        SmallMenu(),
        _FooterLinks()
      ],
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo(),
        Spacer(),
        LargeMenu(),
        Spacer(),
        _FooterLinks()
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(
            onPressed: (){
              _launchURL("https://www.linkedin.com/in/georges-thierry-kouassi-5309a1225");
            }, icon: AppIcon.linkedin),
        _FooterLinkItem(
            onPressed: (){
              _launchURL('https://github.com/Georgesthierry');
            }, icon: AppIcon.github),

      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({super.key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: IconButton(
          onPressed: onPressed, icon: SvgPicture.asset(icon,colorFilter: ColorFilter.mode(context.colorScheme.onBackground, BlendMode.srcIn,),)),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication, // ouvre dans navigateur externe
  )) {
    throw 'Impossible d’ouvrir $url';
  }
}

