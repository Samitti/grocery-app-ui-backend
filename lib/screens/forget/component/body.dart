import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/button_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class BodyForgetPasswordScreen extends StatefulWidget {
  const BodyForgetPasswordScreen({super.key});

  @override
  State<BodyForgetPasswordScreen> createState() =>
      _BodyForgetPasswordScreenState();
}

class _BodyForgetPasswordScreenState extends State<BodyForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: dimensions.getScreenH(50),
        ),
        IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                dimensions.getScreenW(20.0),
              ),
            ),
          ),
          color: color,
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const Icon(IconlyLight.arrowLeft2),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: dimensions.getScreenH(20),
              ),
              const TextWidget(
                text: 'Forget password',
                color: Colors.black,
                textSize: 30,
              ),
              SizedBox(
                height: dimensions.getScreenH(20),
              ),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                height: dimensions.getScreenH(20),
              ),
              ButtonWidget(
                buttonText: 'Reset now',
                press: () {},
                isIcon: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
