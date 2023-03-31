import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/forget/forget_password_screen.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/signin/signin_screen.dart';
import 'package:grocery/screens/viewed/viewed_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';
import 'package:grocery/services/auth/auth_firestore.dart';
import 'package:grocery/services/auth/auth_services.dart';
import 'package:grocery/widgets/theme_button.dart';
import 'package:grocery/screens/user/components/list_tile_profile.dart';
import 'package:provider/provider.dart';

class TilesUser extends StatefulWidget {
  const TilesUser({
    super.key,
  });

  @override
  State<TilesUser> createState() => _TilesUserState();
}

class _TilesUserState extends State<TilesUser> {
  static UserModel? _user;

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  String? address;
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  Future<void> _loadUserData() async {
    if (firebaseAuth.currentUser == null) {
      return;
    }
    UserModel? user =
        await AuthFireStore.getUserData(firebaseAuth.currentUser!.uid);
    if (user != null) {
      setState(() {
        _user = user;
        address = user.address;
      });
    }
  }

  void updateAddress({required context}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        constUserAddress: addressController.text,
      });
      Navigator.pop(context);
      setState(() {
        address = addressController.text;
      });
      CommonFunction.errorToast(error: "Updated Successfully");
    } catch (err) {
      CommonFunction.errorToast(error: "Unable to update your address");
    }
  }

  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        headerUserScreen(color: color, context: context),
        SizedBox(height: dimensions.getScreenH(15)),
        const Divider(
          thickness: 1.1,
          color: Colors.black,
        ),
        SizedBox(height: dimensions.getScreenH(20)),
        ListTileProfile(
          leading: const Icon(IconlyLight.profile),
          title: "Address",
          subtitleTitle: address,
          press: () async {
            return await addressDialog(context);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.bag),
          title: "Order",
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: OrderScreen.routeName);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.heart),
          title: "Wishlist",
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: WishListScreen.routeName);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyLight.show),
          title: "Viewed",
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: ViewedScreen.routeName);
          },
        ),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: const Icon(IconlyBold.unlock),
          title: "Forget Password",
          press: () {
            CommonFunction.navigateToPage(
                context: context, routeName: ForgetPasswordScreen.routeName);
          },
        ),
        const ThemeButton(),
        SizedBox(height: dimensions.getScreenH(5)),
        ListTileProfile(
          leading: firebaseAuth.currentUser == null
              ? const Icon(IconlyLight.login)
              : const Icon(IconlyLight.logout),
          title: firebaseAuth.currentUser == null ? "Login" : "Logout",
          press: () async {
            if (firebaseAuth.currentUser == null) {
              CommonFunction.navigateToPage(
                  context: context, routeName: SignInScreen.routeName);
              return;
            }
            return await CommonFunction.warningDialog(
              context: context,
              text: 'Sign Out',
              subTitle: 'Are you sure?',
              press: () {
                AuthServices().signOut(context: context);
                CommonFunction.navigateToPage(
                    context: context, routeName: SignInScreen.routeName);
                return;
              },
            );
          },
        ),
      ],
    );
  }

  Future<void> addressDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Address"),
          content: TextField(
            controller: addressController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Enter your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                updateAddress(context: context);
              },
              child: const Text("Done"),
            )
          ],
        );
      },
    );
  }

  Container headerUserScreen(
      {required Color color, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(
          left: AppDimensions(context).getScreenW(15),
          top: AppDimensions(context).getScreenH(5)),
      child: Text.rich(
        TextSpan(
          text: "Hi, ",
          style: TextStyle(
              color: Colors.cyan,
              fontSize: AppDimensions(context).getScreenW(30)),
          children: [
            TextSpan(
                text: _user == null ? 'Your Name\n' : "${_user?.name}\n",
                style: TextStyle(
                  color: color,
                  fontSize: AppDimensions(context).getScreenW(30),
                )),
            TextSpan(
              text: _user == null ? 'Your Email\n' : "${_user?.email}\n",
              style: TextStyle(
                fontSize: AppDimensions(context).getScreenW(18),
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
