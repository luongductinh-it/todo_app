import 'package:firebase_todo_app/common_widgets/async_value_ui.dart';
import 'package:firebase_todo_app/features/authentication/data/auth_repository.dart';
import 'package:firebase_todo_app/features/task_management/domain/task.dart';
import 'package:firebase_todo_app/features/task_management/presentation/controllers/firestore_controller.dart';
import 'package:firebase_todo_app/features/task_management/presentation/widgets/title_description.dart';
import 'package:firebase_todo_app/utils/appstyles.dart';
import 'package:firebase_todo_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> _priorities = ['Low', 'Medium', 'High'];
  int _selectedPriority = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final userId = ref.watch(currentUserProvider)!.uid;
    final state = ref.watch(firestoreControllerProvider);
    ref.listen<AsyncValue>(firestoreControllerProvider, (_, state) {
      state.showAlertDialogError(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Task',
          style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: [
            TitleDescription(
              title: 'Task Title',
              prefixIcon: Icons.notes,
              hintText: 'Enter Task Title',
              maxLines: 1,
              controller: _titleController,
            ),
            SizedBox(height: SizeConfig.getProportionateHeight(10)),
            TitleDescription(
              title: 'Task Description',
              prefixIcon: Icons.notes,
              hintText: 'Enter Task Description',
              maxLines: 3,
              controller: _descriptionController,
            ),
            SizedBox(height: SizeConfig.getProportionateHeight(20)),
            Row(
              children: [
                Text(
                  'Priority',
                  style: AppStyles.headingTextStyle.copyWith(
                    fontSize: SizeConfig.getProportionateHeight(18),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: SizeConfig.getProportionateHeight(48),
                    child: ListView.builder(
                      itemCount: _priorities.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final priority = _priorities[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPriority = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.getProportionateWidth(10),
                            ),
                            padding: EdgeInsets.all(
                              SizeConfig.getProportionateHeight(10),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _selectedPriority == index
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            child: Text(
                              priority,
                              style: AppStyles.normalTextStyle.copyWith(
                                color: _selectedPriority == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.getProportionateHeight(20)),
            InkWell(
              onTap: () {
                final title = _titleController.text.trim();
                final description = _descriptionController.text.trim();
                String priority = _priorities[_selectedPriority];
                String date = DateTime.now().toString();
                final myTask = Task(
                  title: title,
                  description: description,
                  priority: priority,
                  date: date,
                );
                ref
                    .read(firestoreControllerProvider.notifier)
                    .addTask(task: myTask, userId: userId);
                _titleController.clear();
                _descriptionController.clear();
                setState(() {
                  _selectedPriority = 0;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.getProportionateHeight(50),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 30),
                          Text(
                            'Add Task',
                            style: AppStyles.normalTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
