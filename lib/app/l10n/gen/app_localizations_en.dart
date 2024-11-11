import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get page_not_found => 'Page not found';

  @override
  String get to_initial_screen => 'To initial screen';

  @override
  String get go_to_login_screen => 'Unauthorized user - go to the login screen';

  @override
  String get authorization => 'Authorization';

  @override
  String get invalid_code => 'Invalid OTP code';

  @override
  String get no_internet_connection => 'No internet connection';

  @override
  String get server_timeout => 'Server timeout';

  @override
  String get no_data => 'No data';

  @override
  String get auth_failed => 'Authentication error';

  @override
  String get wrong_code => 'Wrong code. Try again...';

  @override
  String get user_phone_exist => 'User with this phone number exist!';

  @override
  String field_not_unique(String name) {
    return 'This field is not unique: $name';
  }

  @override
  String field_required(String name) {
    return 'This field is required: $name';
  }

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get login => 'Login';

  @override
  String get notHaveAccount => 'Not have an account?';

  @override
  String get singUpChoose => 'Sign Up Here';

  @override
  String get requiredFieldError => 'This is a required field';

  @override
  String get phoneRequires => 'The phone is invalid';

  @override
  String get mobileNumber => 'Mobile number';

  @override
  String get enterCodeTitle => 'Enter the code we sent you to:';

  @override
  String get verificationCode => 'Verification code';

  @override
  String get resendCode => 'Resend code';

  @override
  String get registration => 'Registration';

  @override
  String get fullName => 'Full name';

  @override
  String get enterName => 'Enter your name';

  @override
  String get phone => 'Phone';

  @override
  String get enterPhone => '+972';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get mandatoryFields => 'Mandatory fields';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get singInChoose => 'Login here';

  @override
  String get termsAndPrivacy_1 => 'By clicking below, I confirm that I have read Funzone ';

  @override
  String get termsAndPrivacy_2 => 'Terms & Conditions';

  @override
  String get termsAndPrivacy_3 => ' and ';

  @override
  String get termsAndPrivacy_4 => 'Privacy Policy';

  @override
  String get invalid_email_address => 'Invalid email address';

  @override
  String get ok => 'Ok';

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get sing_out => 'Sign out';

  @override
  String get sure_to_logout => 'Are you sure you want to logout?';

  @override
  String get settings => 'Settings';

  @override
  String get search => 'Search';

  @override
  String get no_result_found => 'No result found';

  @override
  String get language => 'Language';
}
