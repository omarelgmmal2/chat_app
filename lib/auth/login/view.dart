import 'package:chat_app/auth/register/view.dart';
import 'package:chat_app/shared/design/app_button.dart';
import 'package:chat_app/shared/design/app_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../chat_page/view.dart';
import '../../shared/logic/helper_method.dart';


class LoginChatApp extends StatefulWidget {
  const LoginChatApp({super.key});

  @override
  State<LoginChatApp> createState() => _LoginChatAppState();
}

class _LoginChatAppState extends State<LoginChatApp> {

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
                "Login",
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
                          }else if(value.length < 20)
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
                title: "Login",
                onPress: () async{
                  debugPrint(emailController.text);
                  debugPrint(passwordController.text);

                  if(formKey.currentState!.validate())
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
                      if (ex.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "email already exists",
                        ),
                      ),
                    );
                  }else if (ex.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "weak password",
                            ),
                          ),
                        );
                      }
                    } catch (ex) {
                      print(ex);
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
                      toGetNavigate(const RegisterChatApp(),);

                    },
                    child: const Text(
                      "Register",
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
