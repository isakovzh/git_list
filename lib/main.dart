// lib/app.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:git_list/data/repsitory/github_repsitory_impl.dart';
import 'package:git_list/domain/repository/github_repository.dart';
import 'package:git_list/domain/usecase/get_users_usecase.dart';
import 'package:git_list/presentation/bloc/github_users_bloc.dart';
import 'package:git_list/presentation/pages/github_users_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
  final Dio dio = Dio(); // Create Dio instance for network requests
  final GitHubRepository githubRepository = GitHubRepositoryImpl(dio);
  final GetUsersUseCase getUsersUseCase = GetUsersUseCase(githubRepository);

  runApp(MyApp(getUsersUseCase: getUsersUseCase));
}

class MyApp extends StatelessWidget {
  final GetUsersUseCase getUsersUseCase;

  const MyApp({super.key, required this.getUsersUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Users',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider(
        create: (context) =>
            GitHubUsersBloc(getUsersUseCase)..add(FetchGitHubUsers()),
        child: const GitHubUsersScreen(),
      ),
    );
  }
}
