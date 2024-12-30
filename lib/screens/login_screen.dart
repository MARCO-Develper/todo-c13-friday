import 'package:flutter/material.dart';
import 'package:todo_c13_friday/screens/home/home.dart';
import 'package:todo_c13_friday/screens/register_screen.dart';
import 'package:todo_c13_friday/service/login_with_google.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            Text(
              "Forget Password ?",
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Login",
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
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Don’t Have Account ? ",
                        style: Theme.of(context).textTheme.titleSmall),
                    TextSpan(
                      onEnter: (event) {},
                      text: "Create Account",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    ),
                  ])),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 40,
                    endIndent: 10,
                    thickness: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "OR",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    thickness: 1,
                    endIndent: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: 361,
              height: 58,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child:OutlinedButton.icon(
                onPressed: () async {
                  await signInWithGoogle(context);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                icon: Image.asset(
                  'assets/images/google_logo.png',
                  height: 24,
                  width: 24,
                ),
                label: Text(
                  "Login With Google",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),



            ),
          ],
        ),
      ),
    );
  }
}
