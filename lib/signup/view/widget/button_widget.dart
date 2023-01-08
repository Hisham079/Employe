import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnWdgt extends StatelessWidget {
  BtnWdgt({super.key,
  required this.name,
      required this.raduis,
      required this.clr,
      });
  String name;
  int raduis;
  Color clr;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 6, top: 8),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
            height: 40.h,
            width: 333.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: clr,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 12.r,
                      color: Color.fromARGB(255, 178, 177, 177))
                ]),
            child: Center(
                child: Text(
              name,
              style: GoogleFonts.laila(

                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ))),
      ),
    );
  }
}
