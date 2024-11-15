// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maca/styles/app_style.dart';
import 'package:maca/styles/colors/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoginPage = true;

  void handleLogin(String username, String password) {
    print("Login Data:");
    print("Username: $username");
    print("Password: $password");
  }

  void pageSwitch() {
    setState(() {
      print("button click");
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Allow the circle to overflow
        children: [
          Positioned(
              top: 40,
              left: 20,
              right: 0,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome to",
                      style: AppTextStyles.headline2,
                    ),
                    SvgPicture.asset(
                      'assets/APPSVGICON/maca.svg',
                      width: 50,
                      height: 50,
                    ),
                  ])),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500), // Animation duration
            curve: Curves.easeInOut,
            top: isLoginPage
                ? 80
                : -150, // Adjust to position the circle as needed
            left: -150, // Adjust to position the circle as needed
            child: Container(
              width: MediaQuery.of(context).size.width *
                  2, // Make it large enough to overflow
              height: MediaQuery.of(context).size.height * 2, // Same for height
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.theme,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation, // Fade effect
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0), // Slide in from the right
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: isLoginPage
                  ? KeyedSubtree(
                      key: const ValueKey('login'),
                      child: loginSegment(pageSwitch, usernameController,
                          passwordController, handleLogin))
                  : KeyedSubtree(
                      key: const ValueKey('register'),
                      child: registrationSegment(pageSwitch)),
            ),
          )
          // Add other widgets here as needed
        ],
      ),
    );
  }
}

@override
Widget loginSegment(
  VoidCallback pageSwitch,
  TextEditingController usernameController,
  TextEditingController passwordController,
  Function(String username, String password) handleLogin,
) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Login",
              style: AppTextStyles.headline1,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: usernameController,
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your username',
            prefixIcon: Icons.person,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your password',
            prefixIcon: Icons.password,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            String username = usernameController.text;
            String password = passwordController.text;

            // Pass data to the parent widget's callback
            handleLogin(username, password);
            print("Login button pressed");
          },
          style: AppButtonStyles.elevatedButtonStyle(),
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don’t have account ?",
              style: AppTextStyles.linkText,
            ),
            GestureDetector(
              onTap: () {
                pageSwitch();
              },
              child: const Text(
                "Register here",
                style: AppTextStyles.bodyText,
              ),
            )
          ],
        )
      ],
    ),
  );
}

@override
Widget registrationSegment(VoidCallback pageSwitch) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Registration",
              style: AppTextStyles.headline1,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your username',
            prefixIcon: Icons.person,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your password',
            prefixIcon: Icons.password,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your password',
            prefixIcon: Icons.password,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your password',
            prefixIcon: Icons.password,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: AppInputStyles.textFieldDecoration(
            hintText: 'Enter your password',
            prefixIcon: Icons.password,
          ),
          style: const TextStyle(color: AppColors.header1), // Text style
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            // Add your button's functionality here
            print("Login button pressed");
          },
          style: AppButtonStyles.elevatedButtonStyle(),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Have an account ?",
              style: AppTextStyles.linkText,
            ),
            GestureDetector(
              onTap: () {
                pageSwitch();
              },
              child: const Text(
                "Login here",
                style: AppTextStyles.bodyText,
              ),
            )
          ],
        )
      ],
    ),
  );
}
