import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get page_not_found => 'הדף לא נמצא';

  @override
  String get to_initial_screen => 'למסך ראשי';

  @override
  String get go_to_login_screen => 'משתמש לא מורשה-עבור למסך הכניסה';

  @override
  String get authorization => 'אישור';

  @override
  String get invalid_code => 'קוד לא תקין';

  @override
  String get no_internet_connection => 'אין חיבור לאינטרנט';

  @override
  String get server_timeout => 'השרת הפסיק לעבוד';

  @override
  String get no_data => 'אין נתונים';

  @override
  String get auth_failed => 'שגיאת אימות';

  @override
  String get wrong_code => 'קוד שגוי. נסה שוב...';

  @override
  String get user_phone_exist => 'קיים כבר משתמש עם מספר הטלפון הזה!';

  @override
  String field_not_unique(String name) {
    return 'שדה זה אינו ייחודי: $name';
  }

  @override
  String field_required(String name) {
    return 'שדה חובה: $name';
  }

  @override
  String get male => 'זכר';

  @override
  String get female => 'נקבה';

  @override
  String get login => 'התחברות';

  @override
  String get notHaveAccount => 'אין לך חשבון?';

  @override
  String get singUpChoose => 'הירשם כאן';

  @override
  String get requiredFieldError => 'שדה חובה';

  @override
  String get phoneRequires => 'הטלפון לא חוקי';

  @override
  String get mobileNumber => 'מספר טלפון נייד';

  @override
  String get enterCodeTitle => 'הזן את הקוד';

  @override
  String get verificationCode => 'קוד אימות';

  @override
  String get resendCode => 'שלח קוד שוב';

  @override
  String get registration => 'הַרשמה';

  @override
  String get fullName => 'שם מלא';

  @override
  String get enterName => 'הזן את שמך';

  @override
  String get phone => 'טלפון';

  @override
  String get enterPhone => '972+';

  @override
  String get email => 'אימייל';

  @override
  String get enterEmail => 'הכנס את האימייל שלך';

  @override
  String get mandatoryFields => 'שדות חובה';

  @override
  String get haveAccount => 'כבר יש לך חשבון?';

  @override
  String get singInChoose => 'היכנס כאן';

  @override
  String get termsAndPrivacy_1 => 'בלחיצה למטה, אני מאשר שקראתי את Funzone ';

  @override
  String get termsAndPrivacy_2 => 'תנאים והגבלות';

  @override
  String get termsAndPrivacy_3 => ' ו ';

  @override
  String get termsAndPrivacy_4 => 'מדיניות הפרטיות';

  @override
  String get invalid_email_address => 'כתובת דואר אלקטרוני לא חוקית';
}
