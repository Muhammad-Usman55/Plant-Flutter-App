import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/onboarding_screen.dart';

// Global theme notifier
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

// Global locale notifier
ValueNotifier<Locale> localeNotifier = ValueNotifier(const Locale('en'));

// Global localization helper
String getLocalizedText(String key) {
  final locale = localeNotifier.value.languageCode;
  return _localizedStrings[locale]?[key] ?? _localizedStrings['en']![key] ?? key;
}

final Map<String, Map<String, String>> _localizedStrings = {
  'en': {
    // Settings
    'settings': 'Settings',
    'language': 'Language',
    'appearance': 'Appearance',
    'darkMode': 'Dark Mode',
    // Profile
    'myProfile': 'My Profile',
    'notifications': 'Notifications',
    'faqs': 'FAQs',
    'share': 'Share',
    'logOut': 'Log Out',
    'guestUser': 'Guest User',
    // Navigation
    'home': 'Home',
    'favorite': 'Favorite',
    'cart': 'Cart',
    'profile': 'Profile',
    // Home
    'recommended': 'Recommended',
    'indoor': 'Indoor',
    'outdoor': 'Outdoor',
    'garden': 'Garden',
    'supplement': 'Supplement',
    'searchPlant': 'Search Plant',
    'noPlantsFound': 'No plants found',
    'newPlants': 'New Plants',
    // Sign In
    'signIn': 'Sign In',
    'enterEmail': 'Enter Email',
    'enterPassword': 'Enter Password',
    'forgotPassword': 'Forgot Password? ',
    'resetHere': 'Reset Here',
    'or': 'OR',
    'signInWithGoogle': 'Sign In with Google',
    'continueAsGuest': 'Continue as Guest',
    'newToPlanty': 'New to Planty? ',
    'register': 'Register',
    // Sign Up
    'signUp': 'Sign Up',
    'enterFullName': 'Enter Full name',
    'signUpWithGoogle': 'Sign Up with Google',
    'haveAccount': 'Have an Account? ',
    'login': 'Login',
    // Forgot Password
    'forgotPasswordTitle': 'Forgot\nPassword',
    'resetPassword': 'Reset Password',
    // Cart
    'cartEmpty': 'Your Cart is Empty',
    'totals': 'Totals',
    // Favorites
    'favoritedPlants': 'Your favorited Plants',
    // Detail
    'buyNow': 'BUY NOW',
    'size': 'Size',
    'humidity': 'Humidity',
    'temperature': 'Temperature',
    // Scan
    'tapToScan': 'Tap to Scan',
    // Onboarding
    'skip': 'Skip',
    'titleOne': 'Learn more about plants',
    'descriptionOne': 'Read how to care for plants in our rich plants guide.',
    'titleTwo': 'Find a plant lover friend',
    'descriptionTwo': 'Are you a plant lover? Connect with other plant lovers.',
    'titleThree': 'Plant a tree, green the Earth',
    'descriptionThree': 'Find almost all types of plants that you like here.',
  },
  'ur': {
    // Settings
    'settings': 'ترتیبات',
    'language': 'زبان',
    'appearance': 'ظاہری شکل',
    'darkMode': 'ڈارک موڈ',
    // Profile
    'myProfile': 'میری پروفائل',
    'notifications': 'اطلاعات',
    'faqs': 'عام سوالات',
    'share': 'شیئر کریں',
    'logOut': 'لاگ آؤٹ',
    'guestUser': 'مہمان صارف',
    // Navigation
    'home': 'ہوم',
    'favorite': 'پسندیدہ',
    'cart': 'کارٹ',
    'profile': 'پروفائل',
    // Home
    'recommended': 'تجویز کردہ',
    'indoor': 'اندرونی',
    'outdoor': 'بیرونی',
    'garden': 'باغ',
    'supplement': 'ضمیمہ',
    'searchPlant': 'پودا تلاش کریں',
    'noPlantsFound': 'کوئی پودا نہیں ملا',
    'newPlants': 'نئے پودے',
    // Sign In
    'signIn': 'سائن ان',
    'enterEmail': 'ای میل درج کریں',
    'enterPassword': 'پاس ورڈ درج کریں',
    'forgotPassword': 'پاس ورڈ بھول گئے؟ ',
    'resetHere': 'یہاں ری سیٹ کریں',
    'or': 'یا',
    'signInWithGoogle': 'گوگل سے سائن ان کریں',
    'continueAsGuest': 'مہمان کے طور پر جاری رکھیں',
    'newToPlanty': 'پلانٹی پر نئے ہیں؟ ',
    'register': 'رجسٹر کریں',
    // Sign Up
    'signUp': 'سائن اپ',
    'enterFullName': 'پورا نام درج کریں',
    'signUpWithGoogle': 'گوگل سے سائن اپ کریں',
    'haveAccount': 'اکاؤنٹ ہے؟ ',
    'login': 'لاگ ان',
    // Forgot Password
    'forgotPasswordTitle': 'پاس ورڈ\nبھول گئے',
    'resetPassword': 'پاس ورڈ ری سیٹ کریں',
    // Cart
    'cartEmpty': 'آپ کی ٹوکری خالی ہے',
    'totals': 'کل',
    // Favorites
    'favoritedPlants': 'آپ کے پسندیدہ پودے',
    // Detail
    'buyNow': 'ابھی خریدیں',
    'size': 'سائز',
    'humidity': 'نمی',
    'temperature': 'درجہ حرارت',
    // Scan
    'tapToScan': 'اسکین کے لیے ٹیپ کریں',
    // Onboarding
    'skip': 'چھوڑیں',
    'titleOne': 'پودوں کے بارے میں مزید جانیں',
    'descriptionOne': 'ہماری پودوں کی گائیڈ میں پودوں کی دیکھ بھال کا طریقہ پڑھیں۔',
    'titleTwo': 'پودوں سے محبت کرنے والا دوست تلاش کریں',
    'descriptionTwo': 'کیا آپ پودوں سے محبت کرتے ہیں؟ دوسرے شائقین سے جڑیں۔',
    'titleThree': 'ایک پودا لگائیں، زمین کو سبز کریں',
    'descriptionThree': 'یہاں تقریباً تمام اقسام کے پودے تلاش کریں۔',
  },
};

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return ValueListenableBuilder<Locale>(
          valueListenable: localeNotifier,
          builder: (context, locale, child) {
            return MaterialApp(
              title: 'Onboarding Screen',
              locale: locale,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ur'),
              ],
              theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.green,
                brightness: Brightness.light,
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed: Colors.green,
                brightness: Brightness.dark,
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
              themeMode: themeMode,
              home: const OnboardingScreen(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
