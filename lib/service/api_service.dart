import 'package:dio/dio.dart';
import 'package:user_test/constant/api_constant.dart';
import 'package:user_test/views/screen/home/model/user_model.dart';

class ApiService {
  final _dio = Dio();

  Future<List<UserModel>> getAllUsers() async {
    final response = await _dio.get(
      "${ApiConstant.baseUrl}${ApiConstant.getUsers}",
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    List<dynamic> list = response.data;
    return list.map((element) => UserModel.fromJson(element)).toList();
  }

  Future<UserModel> getOneUser({required String id}) async {
    final response = await _dio.get(
      "${ApiConstant.baseUrl}${ApiConstant.getUsers}/$id",
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return UserModel.fromJson(response.data);
  }
}
