import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/registerScreen.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/cubit/social_app_cubit.dart';

class loginScreenSocialApp extends StatelessWidget {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SocialAppCubit, SocialAppState>(
        listener: (context, state) {
          // if (state is loginLoaded) {
          //   if (state.loginModel.status) {
          //     cacheHelper
          //         .setString(
          //             key: cacheValue.token,
          //             value: state.loginModel.data!.token)
          //         .then((value) {
          //       if (value) {
          //         toastMessage(
          //             message: state.loginModel.message.toString(),
          //             color: Colors.green);
          //         Navigator.pushReplacement(context,
          //             MaterialPageRoute(builder: (_) {
          //           return homeScreen();
          //         }));
          //       }
          //     });
          //   } else {
          //     toastMessage(
          //         message: state.loginModel.message.toString(),
          //         color: Colors.red);
          //   }
          // }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "login".toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        "login now to browse app".toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defulttextFormField(
                        context: context,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can\'t be Empty";
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                        label: "Email Address",
                        Controller: EmailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defulttextFormField(
                          context: context,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can\'t be Empty";
                            }
                            return null;
                          },
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              // SocialAppCubit.get(context).postDataLogin(
                              //     email: EmailController.text,
                              //     password: PasswordController.text,
                              //     context: context);
                            }
                          },
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_outline,
                          label: "Password",
                          Controller: PasswordController,
                          ispassowrd: true,
                          isDownloadState:
                              state is loginLoading ? true : false),
                      SizedBox(
                        height: 30,
                      ),
                      state is! loginLoading
                          ? defultBurrom(
                              text: 'login',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  print('okkkk');
                                  SocialAppCubit.get(context)
                                      .loginFireBaseWithEmailAndPassword(
                                          email: EmailController.text,
                                          password: PasswordController.text,
                                          context: context);
                                  // firebaseAuth
                                  //       .createUserWithEmailAndPassword(
                                  //           email: EmailController.text,
                                  //           password: PasswordController.text)
                                  //       .then((value) {
                                  //     print(value.user!.email);
                                  //     print(value.user!.uid);
                                  //     print('okkkk2222');
                                  //   }).catchError((onError){print('===================== ${onError.toString()}');});
    
                                  // SocialAppCubit.get(context).postDataLogin(
                                  //     email: EmailController.text,
                                  //     password: PasswordController.text,
                                  //     context: context);
                                  // FirebaseFirestore.instance
                                  //     .collection('users')
                                  //     .doc('abdalrhman')
                                  //     .set({
                                  //   'useremail': EmailController.text,
                                  //   'userpass': PasswordController.text,
                                  // }).then((value) {
                                  //   value.
                                  //   print('=================ok store');
                                  // });
                                  // FirebaseFirestore.instance
                                  //     .collection('users')
                                  //     .doc('abdalrhman')
                                  //     .get()
                                  //     .then((value) {
                                  //   print(value.data().toString());
                                  // }).catchError((error) {});
                                }
                              },
                              isUpperCase: true,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: defualtColor,
                              ),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('don\'t have an acount'),
                          defualtTextBottum(
                              text: 'register now',
                              function: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => registerScreen()));
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => registerScreen(),
                                //     ));
                              },
                              isUpperCase: true)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
