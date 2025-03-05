import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
import 'package:prison_foodie_delivey/common_widgets/custom_image_picker.dart';

import 'package:prison_foodie_delivey/common_widgets/custom_text_form_field.dart';
import 'package:prison_foodie_delivey/theme/app_theme.dart';
import 'package:prison_foodie_delivey/util/permission_handler.dart';
import 'package:prison_foodie_delivey/util/value_validator.dart';

import '../../common_widgets/custom_alert_dialog.dart';
import '../bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'sign_up_bloc/sign_up_bloc.dart';

class SignupSecondScreen extends StatefulWidget {
  final Map<String, dynamic> signupDetails;
  const SignupSecondScreen({super.key, required this.signupDetails});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  File? licensefile, profilephoto;
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _addressLineController = TextEditingController();
  final TextEditingController _vehicleNoController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      requestStoragePermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomBottomNavBarScreen()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                        color: onSecondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'Address',
                      controller: _addressLineController,
                      validator: alphabeticWithSpaceValidator,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'Place',
                      controller: _placeController,
                      validator: alphabeticWithSpaceValidator,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'District',
                      controller: _districtController,
                      validator: alphabeticWithSpaceValidator,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'State',
                      controller: _stateController,
                      validator: alphabeticWithSpaceValidator,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'Pincode',
                      controller: _pincodeController,
                      validator: pincodeValidator,
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      isLoading: state is SignUpLoadingState,
                      labelText: 'Vehicle Number',
                      controller: _vehicleNoController,
                      validator: alphanumericValidator,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Add your photo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: onSecondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomImagePickerButton(
                      height: 180,
                      width: 170,
                      onPick: (value) {
                        profilephoto = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Add your DL photo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: onSecondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomImagePickerButton(
                      height: 190,
                      width: 350,
                      onPick: (value) {
                        licensefile = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      isLoading: state is SignUpLoadingState,
                      color: secondaryColor,
                      label: 'Signup',
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            profilephoto != null &&
                            licensefile != null) {
                          Map<String, dynamic> details = {
                            'name': widget.signupDetails['name'],
                            'email': widget.signupDetails['email'],
                            'state': _stateController.text.trim(),
                            'district': _districtController.text.trim(),
                            'place': _placeController.text.trim(),
                            'pincode': _pincodeController.text.trim(),
                            'address_line': _addressLineController.text.trim(),
                            'vehicle_no': _vehicleNoController.text.trim(),
                          };
                          if (profilephoto != null) {
                            details['photo_file'] = profilephoto!;
                            details['photo_name'] = profilephoto!.path;
                          }
                          if (licensefile != null) {
                            details['license_file'] = licensefile!;
                            details['license_name'] = licensefile!.path;
                          }
                          BlocProvider.of<SignUpBloc>(context).add(
                            InsertUserDataEvent(
                              userDetails: details,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
