import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_he.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('he')
  ];

  /// No description provided for @page_not_found.
  ///
  /// In he, this message translates to:
  /// **'הדף לא נמצא'**
  String get page_not_found;

  /// No description provided for @to_initial_screen.
  ///
  /// In he, this message translates to:
  /// **'למסך ראשי'**
  String get to_initial_screen;

  /// No description provided for @go_to_login_screen.
  ///
  /// In he, this message translates to:
  /// **'משתמש לא מורשה-עבור למסך הכניסה'**
  String get go_to_login_screen;

  /// No description provided for @authorization.
  ///
  /// In he, this message translates to:
  /// **'אישור'**
  String get authorization;

  /// No description provided for @invalid_code.
  ///
  /// In he, this message translates to:
  /// **'קוד לא תקין'**
  String get invalid_code;

  /// No description provided for @no_internet_connection.
  ///
  /// In he, this message translates to:
  /// **'אין חיבור לאינטרנט'**
  String get no_internet_connection;

  /// No description provided for @server_timeout.
  ///
  /// In he, this message translates to:
  /// **'השרת הפסיק לעבוד'**
  String get server_timeout;

  /// No description provided for @no_data.
  ///
  /// In he, this message translates to:
  /// **'אין נתונים'**
  String get no_data;

  /// No description provided for @auth_failed.
  ///
  /// In he, this message translates to:
  /// **'שגיאת אימות'**
  String get auth_failed;

  /// No description provided for @wrong_code.
  ///
  /// In he, this message translates to:
  /// **'קוד שגוי. נסה שוב...'**
  String get wrong_code;

  /// No description provided for @user_phone_exist.
  ///
  /// In he, this message translates to:
  /// **'קיים כבר משתמש עם מספר הטלפון הזה!'**
  String get user_phone_exist;

  /// No description provided for @field_not_unique.
  ///
  /// In he, this message translates to:
  /// **'שדה זה אינו ייחודי: {name}'**
  String field_not_unique(String name);

  /// No description provided for @field_required.
  ///
  /// In he, this message translates to:
  /// **'שדה חובה: {name}'**
  String field_required(String name);

  /// No description provided for @male.
  ///
  /// In he, this message translates to:
  /// **'זכר'**
  String get male;

  /// No description provided for @female.
  ///
  /// In he, this message translates to:
  /// **'נקבה'**
  String get female;

  /// No description provided for @login.
  ///
  /// In he, this message translates to:
  /// **'התחברות'**
  String get login;

  /// No description provided for @notHaveAccount.
  ///
  /// In he, this message translates to:
  /// **'אין לך חשבון?'**
  String get notHaveAccount;

  /// No description provided for @singUpChoose.
  ///
  /// In he, this message translates to:
  /// **'הירשם כאן'**
  String get singUpChoose;

  /// No description provided for @requiredFieldError.
  ///
  /// In he, this message translates to:
  /// **'שדה חובה'**
  String get requiredFieldError;

  /// No description provided for @phoneRequires.
  ///
  /// In he, this message translates to:
  /// **'הטלפון לא חוקי'**
  String get phoneRequires;

  /// No description provided for @mobileNumber.
  ///
  /// In he, this message translates to:
  /// **'מספר טלפון נייד'**
  String get mobileNumber;

  /// No description provided for @enterCodeTitle.
  ///
  /// In he, this message translates to:
  /// **'הזן את הקוד'**
  String get enterCodeTitle;

  /// No description provided for @verificationCode.
  ///
  /// In he, this message translates to:
  /// **'קוד אימות'**
  String get verificationCode;

  /// No description provided for @resendCode.
  ///
  /// In he, this message translates to:
  /// **'שלח קוד שוב'**
  String get resendCode;

  /// No description provided for @registration.
  ///
  /// In he, this message translates to:
  /// **'הַרשמה'**
  String get registration;

  /// No description provided for @fullName.
  ///
  /// In he, this message translates to:
  /// **'שם מלא'**
  String get fullName;

  /// No description provided for @enterName.
  ///
  /// In he, this message translates to:
  /// **'הזן את שמך'**
  String get enterName;

  /// No description provided for @phone.
  ///
  /// In he, this message translates to:
  /// **'טלפון'**
  String get phone;

  /// No description provided for @enterPhone.
  ///
  /// In he, this message translates to:
  /// **'972+'**
  String get enterPhone;

  /// No description provided for @email.
  ///
  /// In he, this message translates to:
  /// **'אימייל'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In he, this message translates to:
  /// **'הכנס את האימייל שלך'**
  String get enterEmail;

  /// No description provided for @mandatoryFields.
  ///
  /// In he, this message translates to:
  /// **'שדות חובה'**
  String get mandatoryFields;

  /// No description provided for @haveAccount.
  ///
  /// In he, this message translates to:
  /// **'כבר יש לך חשבון?'**
  String get haveAccount;

  /// No description provided for @singInChoose.
  ///
  /// In he, this message translates to:
  /// **'היכנס כאן'**
  String get singInChoose;

  /// No description provided for @termsAndPrivacy_1.
  ///
  /// In he, this message translates to:
  /// **'בלחיצה למטה, אני מאשר שקראתי את Funzone '**
  String get termsAndPrivacy_1;

  /// No description provided for @termsAndPrivacy_2.
  ///
  /// In he, this message translates to:
  /// **'תנאים והגבלות'**
  String get termsAndPrivacy_2;

  /// No description provided for @termsAndPrivacy_3.
  ///
  /// In he, this message translates to:
  /// **' ו '**
  String get termsAndPrivacy_3;

  /// No description provided for @termsAndPrivacy_4.
  ///
  /// In he, this message translates to:
  /// **'מדיניות הפרטיות'**
  String get termsAndPrivacy_4;

  /// No description provided for @invalid_email_address.
  ///
  /// In he, this message translates to:
  /// **'כתובת דואר אלקטרוני לא חוקית'**
  String get invalid_email_address;

  /// No description provided for @ok.
  ///
  /// In he, this message translates to:
  /// **'בסדר'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In he, this message translates to:
  /// **'ביטול'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In he, this message translates to:
  /// **'כן'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In he, this message translates to:
  /// **'לא'**
  String get no;

  /// No description provided for @sing_out.
  ///
  /// In he, this message translates to:
  /// **'יציאה'**
  String get sing_out;

  /// No description provided for @sure_to_logout.
  ///
  /// In he, this message translates to:
  /// **'האם אתה בטוח שברצונך לצאת?'**
  String get sure_to_logout;

  /// No description provided for @settings.
  ///
  /// In he, this message translates to:
  /// **'הגדרות'**
  String get settings;

  /// No description provided for @search.
  ///
  /// In he, this message translates to:
  /// **'חיפוש'**
  String get search;

  /// No description provided for @no_result_found.
  ///
  /// In he, this message translates to:
  /// **'לא נמצאה תוצאה'**
  String get no_result_found;

  /// No description provided for @language.
  ///
  /// In he, this message translates to:
  /// **'שפה'**
  String get language;

  /// No description provided for @delete_account.
  ///
  /// In he, this message translates to:
  /// **'מחק חשבון'**
  String get delete_account;

  /// No description provided for @sure_to_delete.
  ///
  /// In he, this message translates to:
  /// **'האם אתה בטוח שברצונך למחוק את חשבונך?'**
  String get sure_to_delete;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'he'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'he': return AppLocalizationsHe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
