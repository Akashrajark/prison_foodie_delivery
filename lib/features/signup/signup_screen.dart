import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_text_form_field.dart';
import 'package:prison_foodie_delivey/features/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:prison_foodie_delivey/features/signin/signin_screen.dart';
import 'package:prison_foodie_delivey/features/signup/signup_second_screen.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';
import 'package:prison_foodie_delivey/util/value_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widgets/custom_alert_dialog.dart';
import 'sign_up_bloc/sign_up_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const CustomBottomNavBarScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is SignUpSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignupSecondScreen(
                  signupDetails: {
                    'email': _emailController.text.trim(),
                    'name': _usernameController.text.trim(),
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      const Center(
                        child: CircleAvatar(
                          radius: 56,
                          backgroundColor: primaryColor,
                          child: CircleAvatar(
                            radius: 46,
                            backgroundColor: secondaryColor,
                            child: CircleAvatar(
                              radius: 43,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.restaurant,
                                color: secondaryColor,
                                size: 63,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Delivery Partner - Signup',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: onSecondaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                          isLoading: state is SignUpLoadingState,
                          labelText: 'Username',
                          controller: _usernameController,
                          validator: alphabeticWithSpaceValidator),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        labelText: 'Email',
                        isLoading: state is SignUpLoadingState,
                        controller: _emailController,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                          isLoading: state is SignUpLoadingState,
                          labelText: 'Password',
                          controller: _passController,
                          validator: passwordValidator),
                      const SizedBox(height: 10),
                      CustomButton(
                        isLoading: state is SignUpLoadingState,
                        color: secondaryColor,
                        label: 'Continue',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpUserEvent(
                                email: _emailController.text.trim(),
                                password: _passController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Already Account | Signin',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(
                            color: onSecondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
