import 'package:dio/dio.dart';
import 'package:streaming_music/error/exception.dart';
import '../../domain/entity/user_entity.dart';

class AuthRemoteDataSource{
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<User> login(String username, String password) async{
    final response = await dio.post(
      'http://localhost:8080/api/auth/login',
      queryParameters: {
        'user_name': username, 
        'password': password
        },
        
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          'Accept': 'application/json',
          }
        )
    );

    if(response.statusCode == 200){
      final data = response.data;
      return User(
        id: data['id'],
        name: data['name'], 
        email: data['email'], 
        password: data['password'], 
        image: data['image']
        );
    } else{
      throw FetchDataException();
    }
  }

  Future<void> register(String username, String email, String password) async{
    final response = await dio.post(
      'http://10.0.2.2:8080/api/auth/register',
      data: {
        'username': username,
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





}