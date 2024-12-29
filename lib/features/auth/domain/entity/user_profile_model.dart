import 'package:streaming_music/features/auth/domain/entity/user_entity.dart';

class UserProfileModel extends User{
  UserProfileModel({
    required int userId,
    required String username,
    required String email,
    required String password,
  }) : super(
          id: userId,
          name: username,
          email: email,
          password: password
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      password: json['password'], 
    );
  }
  
}