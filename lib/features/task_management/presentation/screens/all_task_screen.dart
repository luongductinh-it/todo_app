import 'package:firebase_todo_app/common_widgets/async_value_ui.dart';
import 'package:firebase_todo_app/common_widgets/async_value_widget.dart';
import 'package:firebase_todo_app/features/authentication/data/auth_repository.dart';
import 'package:firebase_todo_app/features/task_management/data/firestore_repository.dart';
import 'package:firebase_todo_app/features/task_management/domain/task.dart';
import 'package:firebase_todo_app/features/task_management/presentation/widgets/task_item.dart';
import 'package:firebase_todo_app/utils/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTaskScreen extends ConsumerStatefulWidget {
  const AllTaskScreen({super.key});

  @override
  ConsumerState<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends ConsumerState<AllTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)!.uid;
    final taskAsyncValue = ref.watch(loadTasksProvider(userId));

    ref.listen<AsyncValue>(loadTasksProvider(userId), (_, state) {
      state.showAlertDialogError(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: AsyncValueWidget<List<Task>>(
        value: taskAsyncValue,
        data: (tasks) {
          return tasks.isEmpty
              ? const Center(child: Text('No task yet...'))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskItem(task: task);
                  },
                  separatorBuilder: (ctx, height) => const Divider(height: 2,color: Colors.blue,),
                  itemCount: tasks.length,
                );
        },
      ),
    );
  }
}
