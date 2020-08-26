import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase/application/notes/note_watcher/note_watcher_bloc.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(
            color: Colors.blue,
            height: 400,
          ),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return ListView.builder(
              itemCount: state.notes.size,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureOption.isSome()) {
                  return Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  );
                } else {
                  return Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  );
                }
              },
            );
          },
          loadFailure: (state) {
            return Container(
              color: Colors.purple,
              height: 200,
              width: 200,
            );
          },
        );
      },
    );
  }
}
