import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/core/utils/constants/asset_images.dart';
import 'package:interview/app/core/widgets/custom_button.dart';
import 'package:interview/app/core/widgets/gradient_circle.dart';
import 'package:interview/app/routes/app_pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _LoginBackgroundWidget(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 24.0,
            right: 24.0,
            child: const _LoginBody(),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Ready to Travel!",
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Text(
          "Sign up with facebook for the most fulling trip planning experience with us!",
        ),
        const SizedBox(height: 40.0),
        Stack(
          children: [
            const CustomButton(
              text: 'Login with Facebook',
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1864D6),
                  Color(0xFF1864D6),
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: const Icon(
                  Icons.facebook_sharp,
                  color: Colors.white,
                ),
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        const CustomButton(
          text: 'Login with email address',
          gradient: LinearGradient(
            colors: [
              Color(0xFF1864D6),
              Color(0xFF1864D6),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        CustomButton(
          onTap: () => Get.toNamed(Routes.register),
          text: 'Create a new account',
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0AB4C5),
              Color(0xFF30759E),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoginBackgroundWidget extends StatelessWidget {
  const _LoginBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetImages.welcome,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: -MediaQuery.of(context).size.width * 0.1,
          child: const GradientCircle(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: -MediaQuery.of(context).size.width * 0.3,
          child: const GradientCircle(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          right: -MediaQuery.of(context).size.width * 0.1,
          child: const GradientCircle(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          child: const GradientCircle(),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }
}
