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
                    height: SizeConfig.getProportionateHeight(40),
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
                
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.getProportionateHeight(50),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
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
