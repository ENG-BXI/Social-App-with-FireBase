import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/login.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/componse/com.dart';

class registerScreen extends StatelessWidget {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  bool isDownload = false;
  var formKeyRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SocialAppCubit, SocialAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKeyRegister,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "register".toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defulttextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name can\'t be Empty';
                          }
                        },
                        textInputType: TextInputType.name,
                        prefixIcon: Icons.person,
                        label: 'Name',
                        Controller: NameController,
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defulttextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email can\'t be Empty';
                            }
                          },
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          label: 'Email',
                          Controller: EmailController,
                          context: context),
                      SizedBox(
                        height: 20,
                      ),
                      defulttextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be Empty';
                            }
                          },
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_outline,
                          label: 'Password',
                          Controller: PasswordController,
                          context: context,
                          ispassowrd: true,
                          isDownloadState: state is RegisterLoading),
                      SizedBox(
                        height: 20,
                      ),
                      defulttextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone can\'t be Empty';
                          }
                        },
                        textInputType: TextInputType.phone,
                        prefixIcon: Icons.phone,
                        label: 'Phone',
                        Controller: PhoneController,
                        context: context,
                        onSubmitted: (value) {
                          if (formKeyRegister.currentState!.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      state is! RegisterLoading
                          ? defultBurrom(
                              text: 'register',
                              function: () {
                                if (formKeyRegister.currentState!
                                    .validate()) {
                                  SocialAppCubit.get(context)
                                      .createUserWithEmailAndPassword(
                                          email: EmailController.text,
                                          password: PasswordController.text,
                                          name: NameController.text,
                                          phone: PhoneController.text,
                                          context: context);
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
                          Text('you have an acount'),
                          defualtTextBottum(
                              text: 'Login ',
                              function: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          loginScreenSocialApp(),
                                    ));
                              },
                              isUpperCase: true)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
