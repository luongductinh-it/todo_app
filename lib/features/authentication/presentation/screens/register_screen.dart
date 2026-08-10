import 'package:firebase_todo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/appstyles.dart';
import '../../../../utils/size_config.dart';
import '../widgets/common_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.getProportionateWidth(10),
            SizeConfig.getProportionateHeight(50),
            SizeConfig.getProportionateWidth(10),
            0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Create your account', style: AppStyles.titleTextStyle),
                SizedBox(height: SizeConfig.getProportionateHeight(25)),
                CommonTextField(
                  hintText: 'Enter Email...',
                  textInputType: TextInputType.emailAddress,
                  controller: _emailEditingController,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(
                  hintText: 'Enter password...',
                  textInputType: TextInputType.text,
                  obscureText: true,
                  controller: _passwordEditingController,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),

                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree with policy and terms',
                      style: AppStyles.normalTextStyle,
                    ),
                  ],
                ),

                SizedBox(height: SizeConfig.getProportionateHeight(25)),

                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.getProportionateHeight(50),
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Register Me Now',
                      style: AppStyles.normalTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeConfig.getProportionateHeight(1),
                      width: SizeConfig.screenWidth * 0.4,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                    SizedBox(height: SizeConfig.getProportionateWidth(5)),
                    Text('OR', style: AppStyles.normalTextStyle),
                    SizedBox(height: SizeConfig.getProportionateWidth(5)),
                    Container(
                      height: SizeConfig.getProportionateHeight(1),
                      width: SizeConfig.screenWidth * 0.4,
                      decoration: const BoxDecoration(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: SizeConfig.getProportionateHeight(40),
                      width: SizeConfig.screenWidth * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: SizeConfig.getProportionateHeight(40),
                      width: SizeConfig.screenWidth * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: SizeConfig.getProportionateHeight(40),
                      width: SizeConfig.screenWidth * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppStyles.normalTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(AppRouter.register.name);
                      },
                      child: Text(
                        "Sign In",
                        style: AppStyles.normalTextStyle.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
