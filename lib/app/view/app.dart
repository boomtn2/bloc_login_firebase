import 'package:bloc_firebase/app/bloc/app_bloc.dart';
import 'package:bloc_firebase/src/repository/auth_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepositoryl = authenticationRepository;
  final AuthenticationRepository _authenticationRepositoryl;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: _authenticationRepositoryl,
        child: BlocProvider(
          create: (context) =>
              AppBloc(authenticationRepository: _authenticationRepositoryl),
          child: AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages),
    );
  }
}

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 113, 243, 230),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097A7),
    secondary: Color(0xFF009688),
    background: Color(0xFFE0F2F1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
