import 'package:firebase_todo_app/common_widgets/async_value_ui.dart';
import 'package:firebase_todo_app/common_widgets/async_value_widget.dart';
import 'package:firebase_todo_app/features/authentication/data/auth_repository.dart';
import 'package:firebase_todo_app/features/task_management/data/firestore_repository.dart';
import 'package:firebase_todo_app/features/task_management/domain/task.dart';
import 'package:firebase_todo_app/features/task_management/presentation/widgets/task_item.dart';
import 'package:firebase_todo_app/utils/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InCompleteTaskScreen extends ConsumerWidget {
  const InCompleteTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider)!.uid;
    final inCompleteTaskAsyncValue = ref.watch(
      loadInCompleteTasksProvider(userId),
    );

    ref.listen<AsyncValue>(loadInCompleteTasksProvider(userId), (_, state) {
      state.showAlertDialogError(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Incomplete Tasks',
          style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: AsyncValueWidget<List<Task>>(
        value: inCompleteTaskAsyncValue,
        data: (tasks) {
          return tasks.isEmpty
              ? const Center(child: Text('No task yet...'))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskItem(task: task);
                  },
                  separatorBuilder: (ctx, height) =>
                      const Divider(height: 2, color: Colors.blue),
                  itemCount: tasks.length,
                );
        },
      ),
    );
  }
}
