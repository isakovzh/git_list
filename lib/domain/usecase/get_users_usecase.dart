import 'package:git_list/domain/entities/github_user.dart';
import 'package:git_list/domain/repository/github_repository.dart';

class GetUsersUseCase {
  final GitHubRepository _repository;

  GetUsersUseCase(this._repository);

  Future<List<GitHubUser>> execute() {
    return _repository.getUsers();
  }
}