// ignore_for_file: must_be_immutable

import 'package:astha_cp/main.dart';
import 'package:astha_cp/src/controller/login_bloc/login_bloc.dart';
import 'package:astha_cp/src/features/authentication/otp_screen.dart';
import 'package:astha_cp/src/widget/button.dart';
import 'package:astha_cp/src/widget/textfield.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:astha_cp/utils/custom_snackbar.dart';
import 'package:astha_cp/utils/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    width: 80,
                    height: 80,
                    child: const Image(
                        image: AssetImage("assets/images/logo.png")),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        child: Column(children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "ReadexPro",
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Please login to continue",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "ReadexPro",
                            color: Colors.white),
                      ),
                    ])),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      child: Form(
                        key: loginKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: CutomTextfield(
                                  controller: emailController,
                                  validator: (value) =>
                                      Validations.emailValidation(value),
                                  text: "Enter the email id or phone number"),
                            ),
                            CutomTextfield(
                                controller: passwordController,
                                validator: (value) =>
                                    Validations.emtyValidation(value),
                                text: "Enter password"),
                            SizedBox(
                              child: Column(
                                children: [
                                  BlocConsumer<LoginBloc, LoginState>(
                                    listener: (context, state) {
                                      if (state is LoginloadingState) {
                                        isLoading = true;
                                      } else if (state is LoginSucessState) {
                                        isLoading = false;
                                        CustomSnackBar.showSnackBar(
                                            context, "sucessfully logged");
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(builder: (ctx) {
                                          return const MainScreen();
                                        }));
                                      } else if (state is LoginFailedState) {
                                        isLoading = false;
                                        CustomSnackBar.showSnackBar(
                                            context, state.message);
                                      }
                                    },
                                    builder: (context, state) {
                                      return CustomButtom(
                                        isLoading: isLoading,
                                        onTap: () => loginFnc(context),
                                        text: "Login",
                                        color: primaryColor,
                                        borderColor: primaryColor,
                                        textColor: Colors.white,
                                        radius: 30,
                                      );
                                    },
                                  ),
                                  BlocConsumer<LoginBloc, LoginState>(
                                    listener: (context, state) {
                                      if (state is LoginloadingState) {
                                        isLoading = true;
                                      } else if (state is OtpReqSucessState) {
                                        isLoading = false;
                                        CustomSnackBar.showSnackBar(
                                            context, state.message);
                                      } else if (state is OtpReqFailedState) {
                                        isLoading = false;
                                        CustomSnackBar.showSnackBar(
                                            context, state.message);
                                      }
                                    },
                                    builder: (context, state) {
                                      return CustomButtom(
                                        onTap: () {
                                          if (emailController.text.isNotEmpty) {
                                            context.read<LoginBloc>().add(
                                                OtpRequestEvent(
                                                    email: emailController.text
                                                        .trim()));
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (ctx) {
                                              return OtpScreen(
                                                email:
                                                    emailController.text.trim(),
                                              );
                                            }));
                                          } else {
                                            CustomSnackBar.showSnackBar(context,
                                                "Please enter your mobile number or email id");
                                          }
                                        },
                                        isLoading: isLoading,
                                        text: "Login with Otp",
                                        color: Colors.white,
                                        borderColor: primaryColor,
                                        textColor: primaryColor,
                                        radius: 30,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "ReadexPro",
                                  color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginFnc(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginUserEvnet(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
    }
  }
}
