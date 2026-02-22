import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @accueil.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get accueil;

  /// No description provided for @apropos.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get apropos;

  /// No description provided for @projets.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projets;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Work Together'**
  String get contact;

  /// No description provided for @myname.
  ///
  /// In en, this message translates to:
  /// **'Thierry KOUASSI'**
  String get myname;

  /// No description provided for @poweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Powered by Flutter'**
  String get poweredByFlutter;

  /// No description provided for @experiences.
  ///
  /// In en, this message translates to:
  /// **'Experience & Achievements'**
  String get experiences;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Digital Solutions Architect'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer and IT Manager specialized in designing robust, secure and high-performance digital solutions that transform information systems into strategic business assets.'**
  String get aboutDescription;

  /// No description provided for @testimonies.
  ///
  /// In en, this message translates to:
  /// **'Trusted By'**
  String get testimonies;

  /// No description provided for @testimoniesDescription.
  ///
  /// In en, this message translates to:
  /// **'Organizations and partners who accelerated their digital transformation through my solutions.'**
  String get testimoniesDescription;

  /// No description provided for @experienceDescription.
  ///
  /// In en, this message translates to:
  /// **'With over 6 years of experience, I support SMEs and large enterprises in designing, modernizing and securing IT infrastructures and business applications.'**
  String get experienceDescription;

  /// No description provided for @projectDescription.
  ///
  /// In en, this message translates to:
  /// **'Each project is engineered to enhance performance, automate processes and create sustainable competitive advantage.'**
  String get projectDescription;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer • IT Architect'**
  String get profession;

  /// No description provided for @cooperationRequest.
  ///
  /// In en, this message translates to:
  /// **'Start a Strategic Partnership'**
  String get cooperationRequest;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Expert in software development and information systems architecture, I combine strategic vision with deep technical expertise to deliver scalable, reliable and high-value solutions. Passionate about innovation, I turn complex technological challenges into growth opportunities.'**
  String get profile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
