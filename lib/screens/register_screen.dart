import 'package:flutter/material.dart';
import 'package:todo_c13_friday/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: nameController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: emailController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "#",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: rePasswordController,
              obscureText: true,
              obscuringCharacter: "#",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Re Password",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).focusColor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Register",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "I Have Account ? ",
                        style: Theme.of(context).textTheme.titleSmall),
                    TextSpan(
                      text: "Login",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
