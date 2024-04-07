// ignore_for_file: use_super_parameters

import 'package:git_list/domain/entities/github_user.dart';

class GitHubUserModel extends GitHubUser {
  GitHubUserModel({
    required String login,
    required String avatarUrl,
  }) : super(
          login: login,
          avatarUrl: avatarUrl,
        );

  factory GitHubUserModel.fromJson(Map<String, dynamic> json) {
    return GitHubUserModel(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}