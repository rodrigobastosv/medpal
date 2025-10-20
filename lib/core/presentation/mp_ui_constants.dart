import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MPUiConstants {
  MPUiConstants._();

  /// Extra small spacing (4px) - For tight layouts, borders
  static const double spacingXS = 4;

  /// Small spacing (8px) - For compact elements, form fields
  static const double spacingSM = 8;

  /// Medium spacing (16px) - For cards, buttons, general content
  static const double spacingMD = 16;

  /// Large spacing (24px) - For sections, major components
  static const double spacingLG = 24;

  /// Extra large spacing (32px) - For screen sections, headers
  static const double spacingXL = 32;

  /// Double extra large spacing (48px) - For major layout breaks
  static const double spacingXXL = 48;

  /// Extra small radius (4px) - For subtle rounding, checkboxes
  static const double radiusXS = 4;

  /// Small radius (8px) - For buttons, chips, form fields
  static const double radiusSM = 8;

  /// Medium radius (12px) - For cards, containers
  static const double radiusMD = 12;

  /// Large radius (16px) - For prominent elements, dialogs
  static const double radiusLG = 16;

  /// Extra large radius (24px) - For hero elements, bottom sheets
  static const double radiusXL = 24;

  /// Full radius (9999px) - For circular elements, pills
  static const double radiusFull = 9999;

  /// Thin border (1px) - For subtle outlines, dividers
  static const double borderWidthThin = 1;

  /// Medium border (2px) - For form fields, buttons
  static const double borderWidthMedium = 2;

  /// Thick border (4px) - For emphasis, focus states
  static const double borderWidthThick = 4;

  /// No elevation (0dp) - For flat elements on background
  static const double elevationLevel0 = 0;

  /// Level 1 elevation (1dp) - For cards, buttons at rest
  static const double elevationLevel1 = 1;

  /// Level 2 elevation (3dp) - For raised buttons, switches
  static const double elevationLevel2 = 3;

  /// Level 3 elevation (6dp) - For floating action buttons
  static const double elevationLevel3 = 6;

  /// Level 4 elevation (8dp) - For navigation drawer, modal bottom sheets
  static const double elevationLevel4 = 8;

  /// Level 5 elevation (12dp) - For app bar, dialogs
  static const double elevationLevel5 = 12;

  /// Fast animation (150ms) - For micro-interactions, hover states
  static const Duration durationFast = Duration(milliseconds: 150);

  /// Normal animation (300ms) - For standard transitions, page changes
  static const Duration durationNormal = Duration(milliseconds: 300);

  /// Slow animation (500ms) - For complex animations, loading states
  static const Duration durationSlow = Duration(milliseconds: 500);

  /// Default curve - Standard ease in/out for most animations
  static const Curve curveDefault = Curves.easeInOut;

  /// Emphasized curve - More dramatic easing for important transitions
  static const Curve curveEmphasized = Curves.easeInOutCubicEmphasized;

  /// Bounce curve - Playful bouncing effect for delightful interactions
  static const Curve curveBounce = Curves.bounceOut;

  /// Linear curve - Constant speed for loading indicators
  static const Curve curveLinear = Curves.linear;

  /// Standard button height (48px) - Meets accessibility guidelines
  static const double buttonHeight = 48;

  /// Large button height (56px) - For prominent actions
  static const double buttonHeightLarge = 56;

  /// Small button height (40px) - For compact layouts
  static const double buttonHeightSmall = 40;

  /// Text field height (56px) - Standard Material Design height
  static const double textFieldHeight = 56;

  /// App bar height (56px) - Standard Material Design app bar
  static const double appBarHeight = 56;

  /// Tab bar height (48px) - Standard Material Design tab bar
  static const double tabBarHeight = 48;

  /// Bottom navigation height (80px) - With padding and content
  static const double bottomNavHeight = 80;

  /// FAB size (56px) - Standard floating action button
  static const double fabSize = 56;

  /// Large FAB size (64px) - Extended floating action button
  static const double fabSizeLarge = 64;

  /// Avatar size (40px) - Standard user avatar
  static const double avatarSize = 40;

  /// Large avatar size (64px) - Profile or prominent display
  static const double avatarSizeLarge = 64;

  /// Mobile breakpoint (600px) - Phone screens
  static const double breakpointMobile = 600;

  /// Tablet breakpoint (900px) - Tablet screens
  static const double breakpointTablet = 900;

  /// Desktop breakpoint (1200px) - Desktop screens
  static const double breakpointDesktop = 1200;

  /// Display Large (57px) - Hero text, major headlines
  static const double fontSizeDisplayLarge = 57;

  /// Display Medium (45px) - Large headers
  static const double fontSizeDisplayMedium = 45;

  /// Display Small (36px) - Section headers
  static const double fontSizeDisplaySmall = 36;

  /// Headline Large (32px) - Page titles
  static const double fontSizeHeadlineLarge = 32;

  /// Headline Medium (28px) - Card titles
  static const double fontSizeHeadlineMedium = 28;

  /// Headline Small (24px) - List headers
  static const double fontSizeHeadlineSmall = 24;

  /// Title Large (22px) - App bar titles
  static const double fontSizeTitleLarge = 22;

  /// Title Medium (16px) - Button text, tab labels
  static const double fontSizeTitleMedium = 16;

  /// Title Small (14px) - List item titles
  static const double fontSizeTitleSmall = 14;

  /// Body Large (16px) - Prominent body text
  static const double fontSizeBodyLarge = 16;

  /// Body Medium (14px) - Standard body text
  static const double fontSizeBodyMedium = 14;

  /// Body Small (12px) - Supporting text
  static const double fontSizeBodySmall = 12;

  /// Label Large (14px) - Form labels
  static const double fontSizeLabelLarge = 14;

  /// Label Medium (12px) - Caption text
  static const double fontSizeLabelMedium = 12;

  /// Label Small (11px) - Small annotations
  static const double fontSizeLabelSmall = 11;

  /// Extra small gap (4px) - For tight layouts, icon-text spacing
  Widget get gapXS => const Gap(MPUiConstants.spacingXS);

  /// Small gap (8px) - For compact layouts, button spacing
  Widget get gapSM => const Gap(MPUiConstants.spacingSM);

  /// Medium gap (16px) - For standard content spacing, form fields
  Widget get gapMD => const Gap(MPUiConstants.spacingMD);

  /// Large gap (24px) - For section spacing, card separation
  Widget get gapLG => const Gap(MPUiConstants.spacingLG);

  /// Extra large gap (32px) - For major section breaks
  Widget get gapXL => const Gap(MPUiConstants.spacingXL);

  /// Double extra large gap (48px) - For dramatic spacing, screen sections
  Widget get gapXXL => const Gap(MPUiConstants.spacingXXL);

  /// Extra small padding (4px all sides) - For tight spacing, borders
  EdgeInsets get paddingXS => const EdgeInsets.all(MPUiConstants.spacingXS);

  /// Small padding (8px all sides) - For compact elements, buttons
  EdgeInsets get paddingSM => const EdgeInsets.all(MPUiConstants.spacingSM);

  /// Medium padding (16px all sides) - For standard content, cards
  EdgeInsets get paddingMD => const EdgeInsets.all(MPUiConstants.spacingMD);

  /// Large padding (24px all sides) - For spacious layouts, dialogs
  EdgeInsets get paddingLG => const EdgeInsets.all(MPUiConstants.spacingLG);

  /// Extra large padding (32px all sides) - For major spacing, screen edges
  EdgeInsets get paddingXL => const EdgeInsets.all(MPUiConstants.spacingXL);

  /// Double extra large padding (48px all sides) - For dramatic spacing
  EdgeInsets get paddingXXL => const EdgeInsets.all(MPUiConstants.spacingXXL);

  /// Horizontal padding only (left and right)
  EdgeInsets paddingHorizontal(double value) => EdgeInsets.symmetric(horizontal: value);

  /// Vertical padding only (top and bottom)
  EdgeInsets paddingVertical(double value) => EdgeInsets.symmetric(vertical: value);

  /// Extra small border radius (4px) - For subtle rounding, checkboxes
  BorderRadius get circularRadiusXS => BorderRadius.circular(MPUiConstants.radiusXS);

  /// Small border radius (8px) - For buttons, chips, form fields
  BorderRadius get circularRadiusSM => BorderRadius.circular(MPUiConstants.radiusSM);

  /// Medium border radius (12px) - For cards, containers, most elements
  BorderRadius get circularRadiusMD => BorderRadius.circular(MPUiConstants.radiusMD);

  /// Large border radius (16px) - For prominent elements, dialogs
  BorderRadius get circularRadiusLG => BorderRadius.circular(MPUiConstants.radiusLG);

  /// Extra large border radius (24px) - For hero elements, bottom sheets
  BorderRadius get circularRadiusXL => BorderRadius.circular(MPUiConstants.radiusXL);
}
