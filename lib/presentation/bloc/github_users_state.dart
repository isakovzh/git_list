part of 'github_users_bloc.dart';



abstract class GitHubUsersState {}

class GitHubUsersInitial extends GitHubUsersState {}

class GitHubUsersLoading extends GitHubUsersState {}

class GitHubUsersLoaded extends GitHubUsersState {
  final List<GitHubUser> users;

  GitHubUsersLoaded({required this.users});
}

class GitHubUsersError extends GitHubUsersState {
  final String message;

  GitHubUsersError({required this.message});
}
