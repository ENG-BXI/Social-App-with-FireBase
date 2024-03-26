part of 'social_app_cubit.dart';

@immutable
sealed class SocialAppState {}

final class SocialAppInitial extends SocialAppState {}

class loginLoading extends SocialAppState {}

class loginLoaded extends SocialAppState {}

class loginError extends SocialAppState {
  String Error;
  loginError(this.Error);
}

class settingScreenLoading extends SocialAppState {}

class settingScreenLoaded extends SocialAppState {}

class settingScreenError extends SocialAppState {
  String Error;
  settingScreenError(this.Error);
}

class imagePickerLoading extends SocialAppState {}

class imagePickerLoaded extends SocialAppState {}

class imagePickerError extends SocialAppState {}

class imageCoverPickerLoading extends SocialAppState {}

class imageCoverPickerLoaded extends SocialAppState {}

class imageCoverPickerError extends SocialAppState {}

class changeVisablePassword extends SocialAppState {}

class changeCurrentIndexState extends SocialAppState {}

class HomeScreenLoadingData extends SocialAppState {}

class HomeScreenLoadedData extends SocialAppState {}

class HomeScreenErrorData extends SocialAppState {
  String Error;
  HomeScreenErrorData({required this.Error});
}
class getPostsLoadingData extends SocialAppState {}

class getPostsLoadedData extends SocialAppState {}

class getPostsErrorData extends SocialAppState {
  String Error;
  getPostsErrorData({required this.Error});
}

class CreatePostLoadingData extends SocialAppState {}

class CreatePostLoadedData extends SocialAppState {}

class CreatePostErrorData extends SocialAppState {
  String Error;
  CreatePostErrorData({required this.Error});
}

class categoriesLoadedData extends SocialAppState {}

class categoriesLoadingData extends SocialAppState {}

class categoriesErrorData extends SocialAppState {
  String Error;
  categoriesErrorData({required this.Error});
}

class profileDataLoadedData extends SocialAppState {}

class profileDataLoadingData extends SocialAppState {}

class profileDataErrorData extends SocialAppState {
  String Error;
  profileDataErrorData({required this.Error});
}

class LogoutLoading extends SocialAppState {}

class LogoutLoaded extends SocialAppState {}

class RegisterLoading extends SocialAppState {}

class RegisterLoaded extends SocialAppState {}

class RegisterError extends SocialAppState {
  String Error;
  RegisterError(this.Error);
}

class uploadDataLoading extends SocialAppState {}

class uploadDataLoaded extends SocialAppState {}

class uploadDataError extends SocialAppState {
  String error;
  uploadDataError({required this.error});
}
class postImagePickerLoaded extends SocialAppState {}
class removeImagePostState extends SocialAppState {}