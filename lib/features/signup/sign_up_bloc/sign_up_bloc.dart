import 'package:bloc/bloc.dart';
import 'package:logger/web.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../util/file_upload.dart';
import '../../../values/strings.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUpLoadingState());
        SupabaseClient supabaseClient = Supabase.instance.client;
        if (event is SignUpUserEvent) {
          final AuthResponse response = await supabaseClient.auth.signUp(
            email: event.email,
            password: event.password,
          );
          event.userDetails['image_url'] = await uploadFile(
            'delivery/image',
            event.userDetails['photo_file'],
            event.userDetails['photo_name'],
          );
          event.userDetails.remove('photo_file');
          event.userDetails.remove('photo_name');

          event.userDetails['license_url'] = await uploadFile(
            'delivery/license',
            event.userDetails['license_file'],
            event.userDetails['license_name'],
          );
          event.userDetails.remove('license_file');
          event.userDetails.remove('license_name');

          final String? userId = response.user?.id; // Get user ID

          if (userId != null) {
            event.userDetails['user_id'] = userId;

            try {
              await supabaseClient.from('users').insert(event.userDetails);
              emit(SignUpSuccessState());
            } catch (dbError) {
              Logger().e('Database Insert Error: $dbError');
              // Delete user since inserting details failed
              await supabaseClient.auth.admin.deleteUser(userId);
              emit(SignUpFailureState(
                  message: 'Sign-up failed due to database error.'));
            }
          } else {
            emit(SignUpFailureState(
                message: 'Sign-up failed. Please try again.'));
          }
        }
      } catch (e, s) {
        Logger().e('$e\n$s');

        if (e is AuthException) {
          emit(SignUpFailureState(message: e.message));
        } else {
          emit(SignUpFailureState());
        }
      }
    });
  }
}
