import 'package:chat_app/shared/design/app_button.dart';
import 'package:chat_app/shared/design/app_input.dart';
import 'package:chat_app/shared/logic/helper_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../chat_page/view.dart';
import '../login/view.dart';

class RegisterChatApp extends StatefulWidget {
  const RegisterChatApp({super.key});

  @override
  State<RegisterChatApp> createState() => _RegisterChatAppState();
}

class _RegisterChatAppState extends State<RegisterChatApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                "Register",
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
                      onChange: (data) {
                        email = data;
                        setState(() {

                        });
                      },
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Enter your email";
                        }else if(value.length < 15)
                        {
                          return "The email is weak";
                        } else {
                          return null;
                        }
                      },
                      paddingTop: 20,
                      paddingBottom: 10,
                    ),
                    CustomTextFormField(
                      title: "Password",
                      controller: passwordController,
                      onChange: (data) {
                        password = data;
                        setState(() {

                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your password";
                        } else if (value.length < 8) {
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
                title: "Register",
                onPress: () async {
                  debugPrint(emailController.text);
                  debugPrint(passwordController.text);

                  if (formKey.currentState!.validate())
                  {
                    isLoading = true;
                    setState(() {

                    });
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      toGetNavigate(const ChatPage(),);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "No user found for that email.",
                            ),
                          ),
                        );
                      } else if (ex.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Wrong password provided for that user.",
                            ),
                          ),
                        );
                      }
                    } catch (ex) {
                      print(ex);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "There was an error",
                          ),
                        ),
                      );
                    }
                    isLoading = false;
                    setState(() {

                    });
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(
                        const LoginChatApp(),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
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
      ),
    );
  }
}
