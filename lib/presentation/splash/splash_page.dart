import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase/application/auth/auth_bloc.dart';
import 'package:notes_firebase/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              ExtendedNavigator.of(context).pushNotesOverviewPage(),
          // ExtendedNavigator.of(context)
          //     .pushReplacementNamed(Routes.notesOverviewPage),
          unauthenticated: (_) =>
              ExtendedNavigator.of(context).pushSignInPage(),
          // ExtendedNavigator.of(context)
          //     .pushReplacementNamed(Routes.signInPage),
        );
      },
      child: const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
