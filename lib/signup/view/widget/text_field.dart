import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldWdgt extends StatelessWidget {
  TextFieldWdgt({super.key,required this.hint, required this.name,required this.controller});
  String name;
  String hint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        padding: EdgeInsetsDirectional.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              width: 331,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: hint),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
