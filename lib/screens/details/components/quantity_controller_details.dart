import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/cart/components/add_sub_button.dart';

class QuantityControllerDetails extends StatefulWidget {
  const QuantityControllerDetails({
    super.key,
  });

  @override
  State<QuantityControllerDetails> createState() =>
      _QuantityControllerDetailsState();
}

class _QuantityControllerDetailsState extends State<QuantityControllerDetails> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return SizedBox(
      width: dimensions.getScreenW(100),
      child: Row(
        children: [
          AddSubButtons(
            icon: CupertinoIcons.minus,
            backColor: Colors.red,
            press: () {
              if (_quantityController.text == "1") {
                return;
              } else {
                setState(() {
                  _quantityController.text =
                      (int.parse(_quantityController.text) - 1).toString();
                });
              }
            },
          ),
          Flexible(
            flex: 1,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _quantityController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    _quantityController.text = "1";
                  } else {}
                });
              },
            ),
          ),
          AddSubButtons(
            icon: CupertinoIcons.plus,
            backColor: Colors.green,
            press: () {
              setState(() {
                _quantityController.text =
                    (int.parse(_quantityController.text) + 1).toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
