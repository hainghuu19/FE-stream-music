
import 'package:dio/dio.dart';
import 'package:streaming_music/error/exception.dart';


class AuthRemoteDataSource{
  final Dio dio;


  AuthRemoteDataSource(this.dio);

  Future<String> login(String username, String password) async {
    try {
      final response = await dio.post('http://10.0.2.2:8080/api/auth/login',
          queryParameters: {'user_name': username, 'password': password},
          options: Options(
            headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            },
            responseType: ResponseType.plain
          )
        );
        
        final token = response.data;
        if (token == null || token.toString().isEmpty) {
          throw FetchDataException(message: 'Invalid token received');
        }
        return token.toString(); 
    } catch (e) {
      throw FetchDataException(message: 'Login failed: ${e.toString()}');
    }
  }

  Future<void> register(String username, String email, String password) async{
    final response = await dio.post(
      'http://10.0.2.2:8080/api/auth/register',
      queryParameters: {
        'user_name': username,
        'email': email,
        'password': password,
      }
    );

    if(response.statusCode != 200){
      throw ServerException();
    }
  }

  Future<void> forgotPassword(String email)async{
    final response = await dio.post(
      'http://10.0.2.2:8080/api/auth/forgotpassword',       // endpoint fake, chua co backend phan forgot password
      data: {
        'email': email,
      }
    );

    if(response.statusCode != 200){
      throw ServerException();
    }
  }



  // Future<UserProfileModel> getUser() async {
  //   final token = await authProvider.getToken();
  //   final response = await dio.get(
  //     'http://10.0.2.2:8080//api/users/profile',
  //     options: Options(
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     ),
  //   );

  //   if (response.statusCode == 200) {
  //     return UserProfileModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }







}