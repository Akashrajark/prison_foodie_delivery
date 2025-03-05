// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prison_foodie_delivey/common_widgets/custom_button.dart';
// import 'package:prison_foodie_delivey/theme/app_theme.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../common_widgets/custom_alert_dialog.dart';
// import '../signin/signin_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(15),
//       children: [
//         Text(
//           'Profile',
//           style: GoogleFonts.poppins(
//             color: tertiaryColor,
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         ListTile(
//           title: Text(
//             'Ferrari Chooper',
//             style: GoogleFonts.poppins(
//               color: tertiaryColor,
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           subtitle: Text(
//             '#4554',
//             style: GoogleFonts.poppins(
//               color: tertiaryColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           trailing: const CircleAvatar(
//             radius: 40,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         CustomButton(
//           label: 'Vehicle details',
//           iconData: Icons.chevron_right,
//           backGroundColor: onSurfaceColor,
//           onPressed: () {},
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         CustomButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => CustomAlertDialog(
//                 title: "SIGN OUT",
//                 content: const Text(
//                   "Are you sure you want to Sign Out? Clicking 'Sign Out' will end your current session and require you to sign in again to access your account.",
//                 ),
//                 primaryButton: "SIGN OUT",
//                 onPrimaryPressed: () {
//                   Supabase.instance.client.auth.signOut();
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SigninScreen(),
//                       ),
//                       (route) => false);
//                 },
//               ),
//             );
//           },
//           label: 'Sign Out',
//           iconData: Icons.logout,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         CustomButton(
//           label: 'Delete account',
//           iconData: Icons.chevron_right,
//           backGroundColor: onSurfaceColor,
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:prison_foodie_delivey/util/format_function.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widgets/custom_alert_dialog.dart';
import '../../common_widgets/custom_button.dart';
import '../../util/check_login.dart';
import '../signin/signin_screen.dart';
import 'profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _profileBloc = ProfileBloc();

  Map _profile = {};

  @override
  void initState() {
    getProfile();
    checkLogin(context);
    super.initState();
  }

  void getProfile() {
    _profileBloc.add(GetAllProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: BlocProvider.value(
        value: _profileBloc,
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  description: state.message,
                  primaryButton: 'Try Again',
                  onPrimaryPressed: () {
                    getProfile();
                    Navigator.pop(context);
                  },
                ),
              );
            } else if (state is ProfileGetSuccessState) {
              _profile = state.profile;
              Logger().w(_profile);
              setState(() {});
            } else if (state is ProfileSuccessState) {
              getProfile();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Photo
                  if (_profile['image_url'] != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_profile['image_url']),
                    ),
                  const SizedBox(height: 16),

                  // Name
                  Text(
                    formatValue(_profile['name']),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  Text(
                    formatValue(_profile['email']),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Info Cards
                  Expanded(
                    child: ListView(
                      children: [
                        _buildInfoTile(Icons.badge, "Vehicle No",
                            formatValue(_profile['vehicle_no'])),
                        _buildInfoTile(
                            Icons.home, "Address", formatAddress(_profile)),
                        const Divider(),

                        // Driving License Photo
                        const Text(
                          "Driving License",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        if (_profile['license_url'] != null)
                          Image.network(
                            _profile['license_url'],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                title: "SIGN OUT",
                                content: const Text(
                                  "Are you sure you want to Sign Out? Clicking 'Sign Out' will end your current session and require you to sign in again to access your account.",
                                ),
                                primaryButton: "SIGN OUT",
                                onPrimaryPressed: () {
                                  Supabase.instance.client.auth.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SigninScreen(),
                                      ),
                                      (route) => false);
                                },
                              ),
                            );
                          },
                          label: 'Sign Out',
                          iconData: Icons.logout,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
