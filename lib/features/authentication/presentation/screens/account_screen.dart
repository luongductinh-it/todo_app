import 'package:firebase_todo_app/features/authentication/data/auth_repository.dart';
import 'package:firebase_todo_app/utils/appstyles.dart';
import 'package:firebase_todo_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Account Information",
              style: AppStyles.titleTextStyle.copyWith(fontSize: 20),
            ),
            const Icon(Icons.account_circle, color: Colors.green, size: 80),
            Text(currentUser.email.toString()),
            Text(currentUser.uid),
            SizedBox(height: SizeConfig.getProportionateHeight(20)),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Are you sure?',
                      style: AppStyles.normalTextStyle,
                    ),
                    icon: Icon(Icons.logout, color: Colors.red, size: 60),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text('Cancel', style: AppStyles.normalTextStyle),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                          ref.read(authRepositoryProvider).signOut();
                        },
                        child: Text(
                          'Log Out',
                          style: AppStyles.normalTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.getProportionateHeight(50),
                width: SizeConfig.screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Log Out',
                  style: AppStyles.titleTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
