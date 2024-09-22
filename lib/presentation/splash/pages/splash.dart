import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/homepage/pages/homepage.dart';
import 'package:spotify_clone/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }

  Future<void> redirect() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        bool isLoggedIn = await updateUserDetails();
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const HomePage() : const GetStarted(),
          ),
        );
      },
    );
  }

  Future<bool> updateUserDetails() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isLoggedIn = prefs.getBool('isLoggedIn');
      return isLoggedIn ?? false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
