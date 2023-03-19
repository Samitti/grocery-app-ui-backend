import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/forget/forget_password_screen.dart';
import 'package:grocery/services/auth_services.dart';
import 'package:grocery/widgets/button_widget.dart';

class TextFieldSignin extends StatefulWidget {
  const TextFieldSignin({super.key});

  @override
  State<TextFieldSignin> createState() => _TextFieldSigninState();
}

class _TextFieldSigninState extends State<TextFieldSignin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFoucs = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureTrue = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFoucs.dispose();
    super.dispose();
  }

  void _submitFrom() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      AuthServices().loginUserWithEmailPassword(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_passwordFoucs),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty ||
                    !value.contains('@') ||
                    !value.contains('.')) {
                  return 'Please enter a valid email';
                } else {
                  return null;
                }
              },
              style: TextStyle(color: color),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: color),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color)),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            SizedBox(
              height: dimensions.getScreenH(20),
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              onEditingComplete: () => _submitFrom(),
              controller: _passwordController,
              focusNode: _passwordFoucs,
              obscureText: _obscureTrue,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Please enter a valid password';
                } else {
                  return null;
                }
              },
              style: TextStyle(color: color),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTrue = !_obscureTrue;
                    });
                  },
                  child: Icon(
                    _obscureTrue ? Icons.visibility : Icons.visibility_off,
                    color: color,
                  ),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: color),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color)),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            SizedBox(
              height: dimensions.getScreenH(20),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  CommonFunction.navigateToPage(
                    context: context,
                    routeName: ForgetPasswordScreen.routeName,
                  );
                },
                child: Text(
                  'Forget Password?',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: dimensions.getScreenW(18),
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dimensions.getScreenH(20),
            ),
            ButtonWidget(
              buttonText: 'Sign In',
              press: _submitFrom,
              isIcon: false,
            ),
          ],
        ));
  }
}
