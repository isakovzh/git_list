
import 'package:flutter/material.dart';
import 'package:git_list/domain/entities/github_user.dart';

class UserDetailsScreen extends StatelessWidget {
  final GitHubUser user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
           const  SizedBox(height: 20),
            Text(
              'Username: ${user.login}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
