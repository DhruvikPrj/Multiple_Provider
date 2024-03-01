import 'package:flutter/material.dart';
//Loading Animations
import 'package:loading_animation_widget/loading_animation_widget.dart';

//providers
import 'package:multiple_provider/provider/login_auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> toggle = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //provider
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Login Page",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    maxLength: 100,
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text("Enter Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                    valueListenable: toggle,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: toggle.value,
                        decoration: InputDecoration(
                            label: const Text("Enter Password"),
                            suffix: GestureDetector(
                                onTap: () {
                                  toggle.value = !toggle.value;
                                },
                                child: Icon(
                                    toggle.value
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility,
                                    color: const Color.fromARGB(
                                        249, 67, 11, 157)))),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      authProvider.login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        //width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: List.filled(
                              2, const BoxShadow(color: Colors.black87),
                              growable: true),
                        ),
                        child: Center(
                          child: authProvider.loading
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  height: 200,
                                  child: LoadingAnimationWidget.twistingDots(
                                    leftDotColor: const Color(0xFF1A1A3F),
                                    rightDotColor: Colors.white,
                                    size: 50,
                                  ),
                                )
                              :
                              // const AlertDialog(
                              //     title: Text('Login Failed'),
                              //     content: Text('Please enter valid credentials...'),
                              //   )
                              const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  // alertDialogueBox() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text('Login Failed'),
  //         content: Text('Please enter valid credentials...'),
  //       );
  //     },
  //   );
  // }
}
