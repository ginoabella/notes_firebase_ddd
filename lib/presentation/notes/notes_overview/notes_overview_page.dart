import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase/application/auth/auth_bloc.dart';
import 'package:notes_firebase/application/notes/note_actor/note_actor_bloc.dart';
import 'package:notes_firebase/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:notes_firebase/injection.dart';
import 'package:notes_firebase/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:notes_firebase/presentation/routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                  unauthenticated: (_) =>
                      ExtendedNavigator.of(context).pushSignInPage(),
                  //.pushReplacementNamed(Routes.signInPage),
                  orElse: () {});
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                  deleteFailure: (state) {
                    FlushbarHelper.createError(
                      duration: const Duration(seconds: 5),
                      message: state.noteFailure.map(
                        unexpected: (_) =>
                            'Unexpexted error occur while deleting, plese contact support6',
                        insufficientPermission: (_) =>
                            'Insufficient Permissions X',
                        unableToUpdate: (_) => 'Error unlikely to occur',
                      ),
                    ).show(context);
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.indeterminate_check_box),
                onPressed: () {},
              ),
            ],
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: Navigate to NoteFormPage
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
