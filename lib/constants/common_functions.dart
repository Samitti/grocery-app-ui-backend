import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class CommonFunction {
  static void navigateToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static AppBar appBar({
    required BuildContext context,
    required String text,
    bool isLeading = false,
    bool isSuffix = false,
    void Function()? suffixPress,
  }) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isLeading
          ? IconButton(
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(dimensions.getScreenW(20.0)))),
              color: color,
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              icon: const Icon(IconlyLight.arrowLeft2),
            )
          : null,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: TextWidget(
        text: text,
        color: color,
        textSize: dimensions.getScreenW(22),
        isTitle: true,
      ),
      actions: isSuffix
          ? [
              IconButton(
                onPressed: suffixPress,
                icon: Icon(
                  IconlyBroken.delete,
                  color: color,
                ),
              )
            ]
          : null,
    );
  }

  static cupertinoAppBar({
    required BuildContext context,
    required String text,
    bool isLeading = false,
    bool isSuffix = false,
    void Function()? suffixPress,
  }) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);

    return CupertinoNavigationBar(
      middle: TextWidget(
        text: text,
        color: color,
        textSize: dimensions.getScreenW(22),
        isTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: isLeading
          ? CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                CupertinoIcons.back,
                color: color,
              ),
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
            )
          : null,
      trailing: isSuffix
          ? CupertinoButton(
            onPressed: suffixPress,
              padding: EdgeInsets.zero,
              child: Icon(
                CupertinoIcons.delete,
                color: color,
              ),
              
            )
          : null,
    );
  }




  static Future<void> warningDialog({
    required BuildContext context,
    required String text,
    void Function()? press,
    required String subTitle,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "assets/images/warning-sign.png",
                height: AppDimensions(context).getScreenH(30),
                width: AppDimensions(context).getScreenH(30),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: AppDimensions(context).getScreenW(20),
              ),
              Text(text),
            ],
          ),
          content: Text(
            subTitle,
            style: TextStyle(fontSize: AppDimensions(context).getScreenW(18)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Cancel",
                style:
                    TextStyle(fontSize: AppDimensions(context).getScreenW(18)),
              ),
            ),
            TextButton(
              onPressed: press,
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(
                "Yes",
                style:
                    TextStyle(fontSize: AppDimensions(context).getScreenW(18)),
              ),
            )
          ],
        );
      },
    );
  }

  static errorToast({required String error}) {
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
