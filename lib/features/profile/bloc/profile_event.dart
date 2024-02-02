part of 'profile_bloc.dart';

class ProfileEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ProfileInit extends ProfileEvent
{

}
class ProfilePhotoChangeEvent extends ProfileEvent
{
  XFile? photo;
ProfilePhotoChangeEvent(this.photo);
}