import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaming_music/features/profile/bloc/profile_info_state.dart';
import 'package:streaming_music/service_locator.dart';

import '../../auth/domain/use_case/get_user_use_case.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {

  ProfileInfoCubit() : super (ProfileInfoLoading());

  Future<void> getUser() async {

    var user = await getIt<GetUserUseCase>().call();

    user.fold(
      (l){
        emit(
          ProfileInfoFailure()
        );
      }, 
      (userEntity) {
        emit(
          ProfileInfoLoaded(userEntity: userEntity)
        );
      }
    );
  }
}