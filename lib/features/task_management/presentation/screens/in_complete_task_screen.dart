import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class InCompleteTaskScreen extends ConsumerWidget {
  const InCompleteTaskScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(body: Center(
      child: Text('In Complete Screen'),
    ),);
  }
}