import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomservice/model/ProfileResponse.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../repo/profilerepo.dart';
import '../../../values/strings.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo repository;
  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<ProfileInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.ProfileInitcall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(loading: true,response: apiSiteResponse.data));
      }
    });
    on<ProfilePhotoChangeEvent>((event, emit)
    async {
      ApiResponse apiSiteResponse = await repository.ProfileUploadCall(Strings.userid,event.photo?.path,event.photo!.name);
      if (apiSiteResponse.data != null) {
        apiSiteResponse = await repository.ProfileInitcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(loading: true,response: apiSiteResponse.data));
        }
      }
    });
  }
}
