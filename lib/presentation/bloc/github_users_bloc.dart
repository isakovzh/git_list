// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_list/domain/entities/github_user.dart';
import 'package:git_list/domain/usecase/get_users_usecase.dart';

part 'github_users_event.dart';
part 'github_users_state.dart';

class GitHubUsersBloc extends Bloc<GitHubUsersEvent, GitHubUsersState> {
  final GetUsersUseCase getUsersUseCase;

  GitHubUsersBloc(this.getUsersUseCase) : super(GitHubUsersInitial()) {
    on<FetchGitHubUsers>((event, emit) {
      _fetchGitHubUsers();
    });
  }

  Future<void> _fetchGitHubUsers() async {
    emit(GitHubUsersLoading());
    try {
      final users = await getUsersUseCase.execute();
      emit(GitHubUsersLoaded(users: users));
    } catch (e) {
      emit(GitHubUsersError(message: e.toString()));
    }
  }
}
