// ignore_for_file: use_super_parameters

import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Models/note_model.dart';
import 'note_list_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: AutoAnimatedList<Note>(
        physics: const BouncingScrollPhysics(),
        items: notes,
        itemBuilder: (context, note, index, animation) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 300),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: SizeFadeTransition(
                  animation: animation,
                  child: NoteListItem(
                    note: notes[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
