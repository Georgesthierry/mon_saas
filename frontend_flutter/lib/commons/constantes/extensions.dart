import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/commons/style/app_text_styles.dart';
import 'package:yenlei_flutter/l10n/app_localizations.dart';

enum FormFactoryType {
  mobile,
  tablet,
  desktop,

}
extension StyledContext on BuildContext{
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  FormFactoryType get formFactor {
    if (width <600){
      return FormFactoryType.mobile;
    }else if (width <900){
      return FormFactoryType.tablet;
    } else {
      return FormFactoryType.desktop;
    }
  }
  bool get isMobile  => formFactor == FormFactoryType.mobile;
  bool get isTablet  => formFactor == FormFactoryType.tablet;
  bool get isDesktop  => formFactor == FormFactoryType.desktop;

  AppTextStyles get textStyle {
    switch (formFactor){
      case FormFactoryType.mobile:
      case FormFactoryType.tablet:
        return SmallTextStyles();
      case FormFactoryType.desktop:
        return LargeTextStyles();

    }
  }
  AppInsets get insets {
    switch (formFactor){
      case FormFactoryType.mobile:
        return SmallInsets();
      case FormFactoryType.tablet:
      case FormFactoryType.desktop:
        return LargeInsets();

    }
  }
  AppLocalizations get texts => AppLocalizations.of(this)??lookupAppLocalizations(const Locale('en'));
}