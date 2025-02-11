import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_text_form_field.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                'Delivery Partner - Login',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: tertiaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Email',
                  controller: emailController,
                  validator: null),
              const SizedBox(height: 10),
              CustomTextFormField(
                  labelText: 'Password',
                  controller: passController,
                  validator: null),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomButton(
                    color: secondaryColor, label: 'Login', onPressed: () {}),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Create Account | Signup',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    color: tertiaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
