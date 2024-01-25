import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyle{
  static TextStyle popines18() =>GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white
  );
  static TextStyle popines20() =>GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      color:AppColor.primary
  );


}