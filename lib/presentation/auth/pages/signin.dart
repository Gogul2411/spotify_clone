import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(onPressed: () {}, title: 'Sign In')
          ],
        ),
      ),
      bottomNavigationBar: _signupText(context),
    );
  }

  Widget _registerText() => const Text(
        'Sign in',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        textAlign: TextAlign.center,
      );

  Widget _emailField(BuildContext context) => TextField(
        decoration: const InputDecoration(hintText: 'Enter Email')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      );

  Widget _passwordField(BuildContext context) => TextField(
        decoration: const InputDecoration(hintText: 'Password')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      );

  Widget _signupText(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not A Member?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
                child: const Text('Register Now'))
          ],
        ),
      );
}
