part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  ProfileResponse? response;
  bool loading;
  String? message;
  ProfileState({this.response,this.loading=false,this.message});

  ProfileState copyWith({
    ProfileResponse? response,
    bool? loading,
    String? message

  }) {
    return ProfileState(
        response: response ?? this.response,loading: loading??this.loading,message: message??this.message
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [response,loading,message];
}

class ProfileInitial extends ProfileState {

}
