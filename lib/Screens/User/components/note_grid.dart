// ignore_for_file: use_super_parameters

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import '../../../Models/note_model.dart';
import 'note_grid_item.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final List<Note> notes;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: LiveGrid.options(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index, animation) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 300),
            columnCount: 2,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: NoteGridItem(
                  note: notes[index],
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: notes.length,
        options: const LiveOptions(),
      ),
    );
  }
}
