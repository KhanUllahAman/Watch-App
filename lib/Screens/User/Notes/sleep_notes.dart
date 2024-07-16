import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Repository/notes_repostory.dart';

import '../../../Models/note_model.dart';
import '../../../Services/local_db.dart';
import '../components/empty_view.dart';
import '../components/note_grid.dart';
import '../components/note_list.dart';
import 'create_note.dart';

class NotesScreen extends StatefulWidget {
  static const String routeName = 'Notes-Screen';
  final NotesRepository notesRepository = NotesRepository();
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => NotesScreen(),
    );
  }

  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sleep Notes",
          style: AppStyles().headerTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  isListView = !isListView;
                },
              );
            },
            icon: Icon(
              isListView
                  ? Icons.splitscreen_outlined
                  : Icons.grid_view_outlined,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Note>>(
          stream: LocalDBService().listenAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const EmptyView();
            } else {
              final notes = snapshot.data!;

              return AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 600,
                ),
                child: isListView
                    ? NotesList(notes: notes)
                    : NotesGrid(notes: notes),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            CreateNoteView.routeName,
          );
        },
        backgroundColor: AppStyles.primaryColor,
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
