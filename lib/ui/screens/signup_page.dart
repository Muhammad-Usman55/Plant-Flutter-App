import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/main.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/signup.png'),
                  Text(
                    getLocalizedText('signUp'),
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    obscureText: false,
                    hintText: getLocalizedText('enterEmail'),
                    icon: Icons.alternate_email,
                  ),
                  CustomTextfield(
                    obscureText: false,
                    hintText: getLocalizedText('enterFullName'),
                    icon: Icons.person,
                  ),
                  CustomTextfield(
                    obscureText: true,
                    hintText: getLocalizedText('enterPassword'),
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Center(
                        child: Text(
                          getLocalizedText('signUp'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          getLocalizedText('or'),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        Text(
                          getLocalizedText('signUpWithGoogle'),
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const SignIn(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Center(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: getLocalizedText('haveAccount'),
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          TextSpan(
                            text: getLocalizedText('login'),
                            style: TextStyle(
                              color: Constants.primaryColor,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
