import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CompletedTaskScreen extends ConsumerWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(body: Center(
      child: Text('Completed Tasks'),
    ),);
  }
}