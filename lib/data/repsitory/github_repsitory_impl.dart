// lib/data/repositories/github_repository_impl.dart

import 'package:dio/dio.dart';
import 'package:git_list/data/models/github_user_model.dart';
import 'package:git_list/domain/entities/github_user.dart';
import 'package:git_list/domain/repository/github_repository.dart';


class GitHubRepositoryImpl implements GitHubRepository {
  final Dio _dio;

  GitHubRepositoryImpl(this._dio);

  @override
  Future<List<GitHubUser>> getUsers() async {
    final response = await _dio.get('https://api.github.com/users');
    final List<dynamic> jsonList = response.data;
    return jsonList.map((json) => GitHubUserModel.fromJson(json)).toList();
  }
}
