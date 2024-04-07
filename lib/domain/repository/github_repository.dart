import 'package:git_list/domain/entities/github_user.dart';

abstract class GitHubRepository {
  Future<List<GitHubUser>> getUsers();
}