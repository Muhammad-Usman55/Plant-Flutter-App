import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/main.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/screens/settings_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/profile_widget.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatelessWidget {
  final String? userEmail;
  const ProfilePage({Key? key, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isGuest = userEmail == null || userEmail!.isEmpty;
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Constants.primaryColor.withOpacity(.1),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isGuest ? getLocalizedText('guestUser') : userEmail!,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                ProfileWidget(
                  icon: Icons.person,
                  title: getLocalizedText('myProfile'),
                ),
                ProfileWidget(
                  icon: Icons.settings,
                  title: getLocalizedText('settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const SettingsPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                ),
                ProfileWidget(
                  icon: Icons.notifications,
                  title: getLocalizedText('notifications'),
                ),
                ProfileWidget(
                  icon: Icons.chat,
                  title: getLocalizedText('faqs'),
                ),
                ProfileWidget(
                  icon: Icons.share,
                  title: getLocalizedText('share'),
                ),
                ProfileWidget(
                  icon: Icons.logout,
                  title: getLocalizedText('logOut'),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: const SignIn(),
                        type: PageTransitionType.bottomToTop,
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
