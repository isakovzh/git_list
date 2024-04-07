// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:git_list/presentation/bloc/github_users_bloc.dart';
// import 'package:git_list/presentation/pages/github_users_screen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     // Start the timer when the screen is initialized
//     _timer = Timer(Duration(seconds: 10), () {
//       // Navigate to the next screen after 10 seconds
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => GitHubUsersScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     // Cancel the timer when the screen is disposed to prevent memory leaks
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Initiate GitHubUsersBloc to fetch data
//     context.read<GitHubUsersBloc>().add(FetchGitHubUsers());

//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
