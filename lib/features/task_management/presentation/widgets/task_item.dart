import 'package:firebase_todo_app/features/authentication/data/auth_repository.dart';
import 'package:firebase_todo_app/features/task_management/data/firestore_repository.dart';
import 'package:firebase_todo_app/features/task_management/domain/task.dart';
import 'package:firebase_todo_app/features/task_management/presentation/controllers/firestore_controller.dart';
import 'package:firebase_todo_app/utils/appstyles.dart';
import 'package:firebase_todo_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

String formattedDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

class TaskItem extends ConsumerStatefulWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  ConsumerState<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends ConsumerState<TaskItem> {
  void _deleteTask(String taskId) {
    final userId = ref.watch(currentUserProvider)!.uid;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure', style: AppStyles.titleTextStyle),
        icon: Icon(Icons.delete, size: 60, color: Colors.red),
        alignment: Alignment.center,
        content: const Text('Tap to delete task!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Cancel', style: AppStyles.normalTextStyle),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(firestoreControllerProvider.notifier)
                  .deleteTask(userId: userId, taskId: taskId);
            },
            child: Text('Delete', style: AppStyles.normalTextStyle),
          ),
        ],
      ),
    );
  }

  void _updateTask() {
    TextEditingController titleController = TextEditingController(
      text: widget.task.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: widget.task.description,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.edit, color: Colors.green, size: 40),
        title: Text('Update Task', style: AppStyles.normalTextStyle),
        content: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(label: Text('Description')),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Cancel', style: AppStyles.normalTextStyle),
              ),
              SizedBox(width: SizeConfig.getProportionateWidth(20)),
              ElevatedButton(
                onPressed: () {
                  String newTitle = titleController.text;
                  String newDescription = descriptionController.text;

                  final userId = ref.read(currentUserProvider)!.uid;

                  final newTask = Task(
                    title: newTitle,
                    description: newDescription,
                    priority: widget.task.priority,
                    id: widget.task.id,
                    isComplete: widget.task.isComplete,
                    date: DateTime.now().toString(),
                  );

                  ref
                      .read(firestoreControllerProvider.notifier)
                      .updateTask(
                        task: newTask,
                        userId: userId,
                        taskId: widget.task.id,
                      );
                  context.pop();
                },
                child: Text('Update', style: AppStyles.normalTextStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: AppStyles.headingTextStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                Text(
                  widget.task.description,
                  style: AppStyles.normalTextStyle.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(20)),

                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: SizeConfig.getProportionateHeight(40),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.task.priority.toUpperCase(),
                        style: AppStyles.normalTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.getProportionateWidth(10)),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: SizeConfig.getProportionateHeight(40),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text(
                            formattedDate(widget.task.date),
                            style: AppStyles.normalTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 1.8,
                  child: Checkbox(
                    value: widget.task.isComplete,
                    onChanged: (bool? value) {
                      if (value == null) {
                        return;
                      } else {
                        final userId = ref.watch(currentUserProvider)!.uid;
                        ref
                            .read(firestoreRepositoryProvider)
                            .updateTaskCompletion(
                              userId: userId,
                              taskId: widget.task.id,
                              isComplete: value,
                            );
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: _updateTask,
                  child: Container(
                    height: SizeConfig.getProportionateHeight(40),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _deleteTask(widget.task.id);
                  },
                  child: Container(
                    height: SizeConfig.getProportionateHeight(40),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
