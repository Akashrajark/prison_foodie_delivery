import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_image_picker.dart';

import 'package:prison_foodie_delivey/common_widgets/custom_text_form_field.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({super.key});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  PlatformFile? file;
  TextEditingController placeController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              'Delivery Partner - Signup',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: tertiaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
                labelText: 'Place',
                controller: placeController,
                validator: null),
            const SizedBox(height: 15),
            CustomTextFormField(
                labelText: 'District',
                controller: districtController,
                validator: null),
            const SizedBox(height: 10),
            CustomTextFormField(
                labelText: 'State',
                controller: stateController,
                validator: null),
            const SizedBox(height: 15),
            CustomTextFormField(
                labelText: 'Pincode',
                controller: pincodeController,
                validator: null),
            const SizedBox(height: 15),
            CustomTextFormField(
                labelText: 'Vehicle Number',
                controller: vehicleNoController,
                validator: null),
            const SizedBox(height: 15),
            Text(
              'Add your photo',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: tertiaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            CustomImagePickerButton(
              height: 180,
              width: 170,
              onPick: (value) {
                file = value;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            Text(
              'Add your DL photo',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: tertiaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            CustomImagePickerButton(
              height: 190,
              width: 350,
              onPick: (value) {
                file = value;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: CustomButton(
                  color: secondaryColor, label: 'Signup', onPressed: () {}),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
