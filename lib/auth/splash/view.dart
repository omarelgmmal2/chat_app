import 'package:chat_app/shared/design/app_button.dart';
import 'package:chat_app/shared/design/app_input.dart';
import 'package:flutter/material.dart';

class SplashChatApp extends StatefulWidget {
  const SplashChatApp({super.key});

  @override
  State<SplashChatApp> createState() => _SplashChatAppState();
}

class _SplashChatAppState extends State<SplashChatApp> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/images/scholar.png",
              height: 100,
              width: 200,
            ),
            const Text(
              "Scholar Chat",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: "Email",
                    controller: emailController,
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "Enter your email";
                      }else {
                        return null;
                      }
                    },
                    paddingTop: 20,
                    paddingBottom: 10,
                  ),
                  CustomTextFormField(
                    title: "Password",
                    controller: passwordController,
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return "Enter your password";
                      }else if(value.length < 8)
                      {
                        return "The password is weak";
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    paddingBottom: 25,
                  ),
                ],
              ),
            ),
            CustomAppButton(
              title: "Sign in",
              onPress: () {
                debugPrint(emailController.text);
                debugPrint(passwordController.text);
                if(formKey.currentState!.validate())
                {

                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}