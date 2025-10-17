// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'BeautyNear';

  @override
  String get aboutUs => 'About Us';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get general => 'General';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get support => 'Support';

  @override
  String get language => 'Language';

  @override
  String get helpAndSupport => 'Help & Support';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsAndCondition => 'Terms & Conditions';

  @override
  String get logout => 'Logout';

  @override
  String distance(Object distance) {
    return '$distance km';
  }

  @override
  String ratingAndReviews(Object rating, Object reviews) {
    return '$rating ($reviews Reviews)';
  }

  @override
  String get aboutBarber => 'About Barber';

  @override
  String get availableToday => 'Available Today';

  @override
  String get bookNow => 'Book now for same-day service';

  @override
  String get services => 'Services';

  @override
  String get reviews => 'Reviews';

  @override
  String onlyReviews(Object reviews) {
    return '$reviews reviews';
  }

  @override
  String get total => 'Total';

  @override
  String get noServicesSelected => 'No services selected';

  @override
  String get createBooking => 'Create Booking';

  @override
  String get barbersNearYou => 'Barbers Near You';

  @override
  String get chat => 'Chat';

  @override
  String get today => 'Today';

  @override
  String get typeMessage => 'Type a message';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get accountCreatedSuccessfully => 'Your Account created Successfully';

  @override
  String get proceedToApp => 'Proceed to the App';

  @override
  String get fillThisForm => 'Fill This Form';

  @override
  String get pleaseFillThisForm => 'Please fill this form to proceed further';

  @override
  String get noOfAdults => 'Number of Adults';

  @override
  String get noOfKids => 'Number of Kids';

  @override
  String get selectDate => 'Select Date';

  @override
  String get selectTime => 'Select Time';

  @override
  String get apply => 'Apply';

  @override
  String get booking => 'Booking';

  @override
  String get selectServiceType => 'Select Your Service Type!';

  @override
  String get mensService => 'Men\'s Services';

  @override
  String get womensService => 'Women\'s Services';

  @override
  String get commaHello => 'Hello,';

  @override
  String get topRatedBarbers => 'Top Rated Barbers';

  @override
  String get seeAll => 'See All';

  @override
  String get barberYouNeed => 'Barber you need';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get allLanguages => 'All Languages';

  @override
  String get selectLocation => 'Select Location';

  @override
  String get selectYourLocationToFindBarber =>
      'Select your Location to find nearby Barbers';

  @override
  String get enterLocation => 'Enter Location';

  @override
  String get yourLocation => 'Your Location';

  @override
  String get loginToYourAccount => 'Login to Your Account';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get yourEmail => 'Your Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get login => 'login';

  @override
  String get dontHavAccount => 'Don\'t have an account ?';

  @override
  String get signUp => 'Sign Up';
}
