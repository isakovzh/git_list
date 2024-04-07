import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_list/presentation/bloc/github_users_bloc.dart';
import 'package:git_list/presentation/pages/github_users_details_screen.dart';

class GitHubUsersScreen extends StatelessWidget {
  const GitHubUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('GitHub Users')),
      ),
      body: BlocBuilder<GitHubUsersBloc, GitHubUsersState>(
        builder: (context, state) {
          if (state is GitHubUsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GitHubUsersLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UserDetailsScreen(user: user), // Pass the user object
                    ));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  title: Text(user.login),
                );
              },
            );
          } else if (state is GitHubUsersError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
