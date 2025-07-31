import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveUtil on BuildContext {
  int get crossAxisCount {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 1;
    } else if (bp.isTablet) {
      return 2;
    } else {
      return 3;
    }
  }

  double get fontSizeTitle {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 45;
    } else if (bp.isTablet) {
      return 70;
    } else {
      return 70;
    }
  }

  double get fontSizeSubTitle {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 16;
    } else if (bp.isTablet) {
      return 20;
    } else {
      return 20;
    }
  }

  double get fontAnimasiSize {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 26;
    } else if (bp.isTablet) {
      return 34;
    } else {
      return 34;
    }
  }

  double get fontButtonSize {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 20;
    } else if (bp.isTablet) {
      return 24;
    } else {
      return 24;
    }
  }

  double get heihtContentTitle {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 20;
    } else if (bp.isTablet) {
      return 40;
    } else {
      return 50;
    }
  }

  double get paddingHorizontal {
    final bp = ResponsiveBreakpoints.of(this);
    if (bp.isMobile) {
      return 20;
    } else if (bp.isTablet) {
      return 50;
    } else {
      return 150;
    }
  }

  TextStyle get titleTextStyle {
    return GoogleFonts.bebasNeue(
      color: Color(0xFFE7E6E8),
      fontWeight: FontWeight.bold,
      height: 0.5,
    );
  }

  TextStyle get subTitleTextStyle {
    return GoogleFonts.inter(color: Color(0xFFB7B8BC));
  }

  TextStyle get interTextStyle {
    return GoogleFonts.inter(color: Color(0xFFE7E6E8));
  }

  Color get colorContainerImage {
    return Color(0xFF323645);
  }

  Color get colorContainerContentImage {
    return Color(0xFF2D2F3E);
  }

  Color get colorButton {
    return Color(0xFF787F9A);
  }
}
