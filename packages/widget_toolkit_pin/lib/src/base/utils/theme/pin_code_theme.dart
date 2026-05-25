import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../design_system/design_system.dart';

part 'pin_code_theme.tailor.dart';

/// Theme extension that holds colors, typography, spacing, and icon widgets for PIN entry
/// and biometrics flows. Register an instance on [ThemeData.extensions] and read it with
/// [ThemePinExtension.pinCodeTheme]. The [PinCodeTheme.light] and [PinCodeTheme.dark]
/// constructors seed values from the package design system, and hosts typically override
/// individual tokens through [PinCodeTheme.copyWith] so the screen matches surrounding app
/// chrome while [PinCodeKeyboard] and the implementation in `pin_code_component.dart` stay
/// visually consistent.
@TailorMixinComponent()
class PinCodeTheme extends ThemeExtension<PinCodeTheme>
    with _$PinCodeThemeTailorMixin {
  /// Supplies every PIN token explicitly. Hosts usually obtain a baseline from
  /// [PinCodeTheme.light] or [PinCodeTheme.dark] and then override selected values with
  /// [PinCodeTheme.copyWith] instead of constructing this memberwise list by hand.
  const PinCodeTheme({
    required this.primaryColor,
    required this.backgroundColor,
    required this.scaffoldBackgroundColor,
    required this.highlightColor,
    required this.primaryGradientStart,
    required this.primaryGradientEnd,
    required this.transparentColor,
    required this.pinCodeKeyTextColorPressed,
    required this.pinCodeKeyTextColorDefault,
    required this.pinCodeErrorTextColor,
    required this.pinKeyboardErrorPinColor,
    required this.pinKeyboardBottomButtonTextColor,
    required this.appBarButtonIconColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.titleButtonIconBorderColor,
    required this.pinCodeKeyBackgroundColor,
    required this.pinKeyboardMaskedKeyBorderColor,
    required this.pinKeyboardMaskedKeyColor,
    required this.descriptionBoldTextStyle,
    required this.appBarTitleDescriptionBoldTextStyle,
    required this.captionBold,
    required this.subtitleBold,
    required this.pinCodeKeyTextStyle,
    required this.descriptionBold,
    required this.titleBold,
    required this.descriptionThin,
    required this.errorTitle,
    required this.pinKeyboardBottomButtonTextStyle,
    required this.spacingXSS1,
    required this.spacingXS,
    required this.spacingXS1,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingXXXL,
    required this.spacingXXXXL1,
    required this.spacing1,
    required this.spacing2,
    required this.spacing3,
    required this.spacing4,
    required this.spacing5,
    required this.spacing6,
    required this.pinDeleteActionIcon,
    required this.pinDeleteDefaultIcon,
    required this.faceScanDefaultIcon,
    required this.faceScanInvertedIcon,
    required this.faceScanPressedIcon,
    required this.fingerScanDefaultIcon,
    required this.fingerScanInvertedIcon,
    required this.fingerScanPressedIcon,
    required this.appBarTitleLeadingWidth,
  });

  /// Fills the theme from [PinCodeDesignSystem.light] colors, typography, and spacings, and
  /// assigns biometric and delete artwork from [PinCodeDesignSystem.dark] so those circular
  /// controls keep enough separation on the light gradient panel that `pin_code_component.dart`
  /// paints for [PinCodeKeyboard].
  PinCodeTheme.light()
      : primaryColor = PinCodeDesignSystem.light().colors.primaryColor,
        backgroundColor = PinCodeDesignSystem.light().colors.backgroundColor,
        scaffoldBackgroundColor =
            PinCodeDesignSystem.light().colors.scaffoldBackgroundColor,
        highlightColor = PinCodeDesignSystem.light().colors.highlightColor,
        primaryGradientStart = PinCodeDesignSystem.light().colors.blue,
        primaryGradientEnd = PinCodeDesignSystem.light().colors.lightBlue,
        transparentColor = PinCodeDesignSystem.light().colors.lightBlue,
        pinCodeKeyTextColorPressed = PinCodeDesignSystem.light().colors.black,
        pinCodeKeyTextColorDefault = PinCodeDesignSystem.light().colors.white,
        pinCodeErrorTextColor = PinCodeDesignSystem.light().colors.lightRed,
        pinKeyboardErrorPinColor = PinCodeDesignSystem.light().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        appBarButtonIconColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        shimmerBaseColor = PinCodeDesignSystem.light().colors.white,
        shimmerHighlightColor =
            PinCodeDesignSystem.light().colors.white.withValues(alpha: 0.4),
        titleButtonIconBorderColor =
            PinCodeDesignSystem.light().colors.white.withValues(alpha: 0.4),
        pinCodeKeyBackgroundColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        pinKeyboardMaskedKeyBorderColor =
            PinCodeDesignSystem.light().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PinCodeDesignSystem.light().colors.textColorWhite,
        descriptionBoldTextStyle =
            PinCodeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.light().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PinCodeDesignSystem.light().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.light().colors.white,
                ),
        captionBold = PinCodeDesignSystem.light().typography.captionBold,
        subtitleBold = PinCodeDesignSystem.light().typography.h2Semibold16,
        pinCodeKeyTextStyle =
            PinCodeDesignSystem.light().typography.h2Semibold16,
        descriptionBold =
            PinCodeDesignSystem.light().typography.descriptionBold,
        titleBold = PinCodeDesignSystem.light().typography.titleBold,
        descriptionThin =
            PinCodeDesignSystem.light().typography.descriptionThin,
        errorTitle = PinCodeDesignSystem.light().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PinCodeDesignSystem.light().typography.captionBold,
        spacingXSS1 = PinCodeDesignSystem.light().spacings.xss1,
        spacingXS = PinCodeDesignSystem.light().spacings.xs,
        spacingXS1 = PinCodeDesignSystem.light().spacings.xs1,
        spacingS = PinCodeDesignSystem.light().spacings.s,
        spacingM = PinCodeDesignSystem.light().spacings.m,
        spacingL = PinCodeDesignSystem.light().spacings.l,
        spacingXL = PinCodeDesignSystem.light().spacings.xl,
        spacingXXL = PinCodeDesignSystem.light().spacings.xxl,
        spacingXXXL = PinCodeDesignSystem.light().spacings.xxxl,
        spacingXXXXL1 = PinCodeDesignSystem.light().spacings.xxxxl1,
        spacing1 = PinCodeDesignSystem.light().spacings.m,
        spacing2 = PinCodeDesignSystem.light().spacings.xs1,
        spacing3 = PinCodeDesignSystem.light().spacings.xs,
        spacing4 = PinCodeDesignSystem.light().spacings.xxl,
        spacing5 = PinCodeDesignSystem.light().spacings.s,
        spacing6 = PinCodeDesignSystem.light().spacings.m,
        pinDeleteActionIcon = PinCodeDesignSystem.dark().icons.pinDeleteAction,
        pinDeleteDefaultIcon =
            PinCodeDesignSystem.dark().icons.pinDeleteDefault,
        faceScanDefaultIcon = PinCodeDesignSystem.dark().icons.faceScanDefault,
        faceScanInvertedIcon =
            PinCodeDesignSystem.dark().icons.faceScanInverted,
        faceScanPressedIcon = PinCodeDesignSystem.dark().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PinCodeDesignSystem.dark().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PinCodeDesignSystem.dark().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PinCodeDesignSystem.dark().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PinCodeDesignSystem.light().spacings.xxxxl1 +
            PinCodeDesignSystem.light().spacings.m;

  /// Fills the theme from [PinCodeDesignSystem.dark] colors, typography, and spacings, and
  /// assigns biometric and delete artwork from [PinCodeDesignSystem.light] so those glyphs stay
  /// crisp on the darker keypad treatment that `pin_code_component.dart` paints behind
  /// [PinCodeKeyboard].
  PinCodeTheme.dark()
      : primaryColor = PinCodeDesignSystem.dark().colors.primaryColor,
        backgroundColor = PinCodeDesignSystem.dark().colors.backgroundColor,
        scaffoldBackgroundColor =
            PinCodeDesignSystem.dark().colors.scaffoldBackgroundColor,
        highlightColor = PinCodeDesignSystem.dark().colors.highlightColor,
        primaryGradientStart = PinCodeDesignSystem.dark().colors.darkBlue,
        primaryGradientEnd = PinCodeDesignSystem.dark().colors.blue,
        transparentColor = PinCodeDesignSystem.dark().colors.blue,
        pinCodeKeyTextColorPressed = PinCodeDesignSystem.dark().colors.black,
        pinCodeKeyTextColorDefault = PinCodeDesignSystem.dark().colors.white,
        pinCodeErrorTextColor = PinCodeDesignSystem.dark().colors.lightRed,
        pinKeyboardErrorPinColor = PinCodeDesignSystem.dark().colors.lightRed,
        pinKeyboardBottomButtonTextColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        appBarButtonIconColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        shimmerBaseColor = PinCodeDesignSystem.dark().colors.white,
        shimmerHighlightColor =
            PinCodeDesignSystem.dark().colors.white.withValues(alpha: 0.4),
        titleButtonIconBorderColor =
            PinCodeDesignSystem.dark().colors.white.withValues(alpha: 0.4),
        pinCodeKeyBackgroundColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        pinKeyboardMaskedKeyBorderColor =
            PinCodeDesignSystem.dark().colors.lightBlue,
        pinKeyboardMaskedKeyColor =
            PinCodeDesignSystem.dark().colors.textColorWhite,
        descriptionBoldTextStyle =
            PinCodeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.dark().colors.white,
                ),
        appBarTitleDescriptionBoldTextStyle =
            PinCodeDesignSystem.dark().typography.descriptionBold.copyWith(
                  color: PinCodeDesignSystem.dark().colors.white,
                ),
        captionBold = PinCodeDesignSystem.dark().typography.captionBold,
        subtitleBold = PinCodeDesignSystem.dark().typography.h2Semibold16,
        pinCodeKeyTextStyle =
            PinCodeDesignSystem.dark().typography.h2Semibold16,
        descriptionBold = PinCodeDesignSystem.dark().typography.descriptionBold,
        titleBold = PinCodeDesignSystem.dark().typography.titleBold,
        descriptionThin = PinCodeDesignSystem.dark().typography.descriptionThin,
        errorTitle = PinCodeDesignSystem.dark().typography.errorTitle,
        pinKeyboardBottomButtonTextStyle =
            PinCodeDesignSystem.dark().typography.captionBold,
        spacingXSS1 = PinCodeDesignSystem.dark().spacings.xss1,
        spacingXS = PinCodeDesignSystem.dark().spacings.xs,
        spacingXS1 = PinCodeDesignSystem.dark().spacings.xs1,
        spacingS = PinCodeDesignSystem.dark().spacings.s,
        spacingM = PinCodeDesignSystem.dark().spacings.m,
        spacingL = PinCodeDesignSystem.dark().spacings.l,
        spacingXL = PinCodeDesignSystem.dark().spacings.xl,
        spacingXXL = PinCodeDesignSystem.dark().spacings.xxl,
        spacingXXXL = PinCodeDesignSystem.dark().spacings.xxxl,
        spacingXXXXL1 = PinCodeDesignSystem.dark().spacings.xxxxl1,
        spacing1 = PinCodeDesignSystem.dark().spacings.m,
        spacing2 = PinCodeDesignSystem.dark().spacings.xs1,
        spacing3 = PinCodeDesignSystem.dark().spacings.xs,
        spacing4 = PinCodeDesignSystem.dark().spacings.xxl,
        spacing5 = PinCodeDesignSystem.dark().spacings.s,
        spacing6 = PinCodeDesignSystem.dark().spacings.m,
        pinDeleteActionIcon = PinCodeDesignSystem.light().icons.pinDeleteAction,
        pinDeleteDefaultIcon =
            PinCodeDesignSystem.light().icons.pinDeleteDefault,
        faceScanDefaultIcon = PinCodeDesignSystem.light().icons.faceScanDefault,
        faceScanInvertedIcon =
            PinCodeDesignSystem.light().icons.faceScanInverted,
        faceScanPressedIcon = PinCodeDesignSystem.light().icons.faceScanPressed,
        fingerScanDefaultIcon =
            PinCodeDesignSystem.light().icons.fingerScanDefault,
        fingerScanInvertedIcon =
            PinCodeDesignSystem.light().icons.fingerScanInverted,
        fingerScanPressedIcon =
            PinCodeDesignSystem.light().icons.fingerScanPressed,
        appBarTitleLeadingWidth = PinCodeDesignSystem.dark().spacings.xxxxl1 +
            PinCodeDesignSystem.light().spacings.m;

  /// Primary brand tint hosts pair with app-wide [ThemeData] for navigation, progress, or
  /// marketing strips that sit alongside [PinCodeKeyboard].
  @override
  final Color primaryColor;
  /// Surface color for sheets or cards that wrap PIN content so the gradient panel in
  /// `pin_code_component.dart` reads cleanly against the rest of the route.
  @override
  final Color backgroundColor;
  /// Scaffold backdrop for full-screen PIN routes; hosts align it with their shell so status
  /// bars and page background feel consistent with the keypad stack.
  @override
  final Color scaffoldBackgroundColor;
  /// Focus and selection accent hosts apply to companion inputs, toggles, or list rows
  /// shown above or below the numeric grid.
  @override
  final Color highlightColor;
  /// Top stop for the vertical background gradient drawn behind the masked PIN row and
  /// keyboard in `pin_code_component.dart`.
  @override
  final Color primaryGradientStart;
  /// Bottom stop for that same gradient, giving depth to the keypad column in
  /// `pin_code_component.dart`.
  @override
  final Color primaryGradientEnd;
  /// Translucent utility color for overlays, disabled chrome, or soft separators hosts blend
  /// with keypad visuals when composing custom layouts around [PinCodeKeyboard].
  @override
  final Color transparentColor;
  /// Digit label color while a circular [PinCodeKey] is pressed, providing contrast against
  /// [pinCodeKeyBackgroundColor] in `pin_code_key.dart`.
  @override
  final Color pinCodeKeyTextColorPressed;
  /// Resting digit label color on numeric [PinCodeKey] buttons, including the dimmed state
  /// while verification loading runs in `pin_code_key.dart`.
  @override
  final Color pinCodeKeyTextColorDefault;
  /// Strong accent hosts use when styling error rings, helper text, or digit highlights that
  /// accompany a rejected PIN attempt next to the keyboard.
  @override
  final Color pinKeyboardErrorPinColor;
  /// Foreground for helper actions or footer labels tied to the bottom keyboard row, such as
  /// alternate login links or legal copy beneath [PinCodeKeyboard].
  @override
  final Color pinKeyboardBottomButtonTextColor;
  /// Tint for leading or trailing app bar icons on routes that host [PinCodeKeyboard] inside a
  /// [Scaffold].
  @override
  final Color appBarButtonIconColor;
  /// Base tone for the shimmer track while [PinCodeKeyboard] shows loading over masked
  /// placeholders in `pin_code_component.dart`.
  @override
  final Color shimmerBaseColor;
  /// Highlight sweep color paired with [shimmerBaseColor] for that shimmer in
  /// `pin_code_component.dart`.
  @override
  final Color shimmerHighlightColor;
  /// Border color for circular icon buttons near the page title, such as help or settings
  /// affordances hosts place above the keypad.
  @override
  final Color titleButtonIconBorderColor;
  /// Stroke around each masked digit bubble before the user completes the PIN, as built in
  /// `pin_code_component.dart`.
  @override
  final Color pinKeyboardMaskedKeyBorderColor;
  /// Fill painted inside each circular masked placeholder in the PIN row while digits stay
  /// hidden, so the row still shows how long the code should be; `pin_code_component.dart` applies
  /// this in the masked circle decoration.
  @override
  final Color pinKeyboardMaskedKeyColor;
  /// Bold explanatory style for instructional lines or bullet hints shown near the PIN
  /// field when hosts extend the screen beyond the stock gradient panel.
  @override
  final TextStyle descriptionBoldTextStyle;
  /// Bold secondary line under an app bar title on PIN flows, matching the headline weight
  /// used in marketing or profile-driven enrollment copy.
  @override
  final TextStyle appBarTitleDescriptionBoldTextStyle;
  /// Compact bold style applied to translated error strings beneath the masked row in
  /// `pin_code_component.dart`, before [pinCodeErrorTextColor] is merged in via copyWith.
  @override
  final TextStyle captionBold;
  /// Heavier secondary heading for section labels, timers, or attempt counters hosts mount
  /// above [PinCodeKeyboard].
  @override
  final TextStyle subtitleBold;
  /// Base numeric typography for [PinCodeKey] labels in `pin_code_key.dart`, scaled to the
  /// computed key diameter.
  @override
  final TextStyle pinCodeKeyTextStyle;
  /// Standard emphasized body copy for supporting paragraphs on PIN or biometrics education
  /// sheets layered above the keypad.
  @override
  final TextStyle descriptionBold;
  /// Primary title style for page headings that introduce PIN setup, change, or unlock steps.
  @override
  final TextStyle titleBold;
  /// Light body style for longer guidance text or footnotes around the keypad.
  @override
  final TextStyle descriptionThin;
  /// Typographic treatment for destructive or high-attention headings in error dialogs tied to
  /// PIN verification.
  @override
  final TextStyle errorTitle;
  /// Caption style for auxiliary keyboard labels such as “Forgot PIN” or biometric hints on
  /// custom keys built with [PinCodeCustomKey].
  @override
  final TextStyle pinKeyboardBottomButtonTextStyle;
  /// Extra-extra-small spacing step from the design ramp; hosts reuse it for tight stacks
  /// between title and masked row.
  @override
  final double spacingXSS1;
  /// Compact spacing token for inline chips or icon rows adjacent to the keypad grid.
  @override
  final double spacingXS;
  /// Slightly roomier compact spacing for grouped labels above the PIN area.
  @override
  final double spacingXS1;
  /// Small spacing between related controls in host-built toolbars above [PinCodeKeyboard].
  @override
  final double spacingS;
  /// Medium spacing for standard vertical gaps between sections on the PIN route.
  @override
  final double spacingM;
  /// Large spacing for separating major blocks such as hero illustration and keypad.
  @override
  final double spacingL;
  /// Extra-large spacing for airy layouts on tablets or landscape PIN screens.
  @override
  final double spacingXL;
  /// Two-step extra-large spacing for generous vertical rhythm in marketing-heavy flows.
  @override
  final double spacingXXL;
  /// Very large spacing token for full-bleed hero regions before the keypad.
  @override
  final double spacingXXXL;
  /// Widest named spacing step on the ramp, often matching full app bar height padding when
  /// hosts mirror platform specs.
  @override
  final double spacingXXXXL1;

  /// Horizontal gap between masked PIN circles in `pin_code_component.dart`, keeping the row
  /// aligned with the keyboard width math there.
  @override
  final double spacing1;
  /// Additional spacing preset hosts apply between keyboard rows and accessory banners.
  @override
  final double spacing2;
  /// Additional spacing preset for compact vertical stacks in dual-column tablet layouts.
  @override
  final double spacing3;
  /// Additional spacing preset suited to separating biometric education cards from the grid.
  @override
  final double spacing4;
  /// Additional spacing preset for medium dividers between the keypad and footer actions.
  @override
  final double spacing5;
  /// Additional spacing preset mirroring medium horizontal inset padding beside the grid.
  @override
  final double spacing6;

  /// Icon shown while the delete key is actively pressed in `pin_code_delete_key.dart`.
  @override
  final Widget pinDeleteActionIcon;
  /// Icon shown while the delete key is idle in `pin_code_delete_key.dart`.
  @override
  final Widget pinDeleteDefaultIcon;
  /// Default face biometrics glyph on [PinCodeKey] rows in `pin_code_key.dart`.
  @override
  final Widget faceScanDefaultIcon;
  /// High-contrast face biometrics glyph hosts swap in when the background is dark or when
  /// custom biometric tiles need stronger silhouette separation.
  @override
  final Widget faceScanInvertedIcon;
  /// Face biometrics glyph for the pressed state animation in `pin_code_key.dart`.
  @override
  final Widget faceScanPressedIcon;
  /// Default fingerprint glyph on [PinCodeKey] in `pin_code_key.dart`.
  @override
  final Widget fingerScanDefaultIcon;
  /// High-contrast fingerprint glyph for the same scenarios described for [faceScanInvertedIcon].
  @override
  final Widget fingerScanInvertedIcon;
  /// Fingerprint glyph for the pressed state animation in `pin_code_key.dart`.
  @override
  final Widget fingerScanPressedIcon;
  /// Leading width budget next to the PIN screen title so back buttons and logos align
  /// predictably in custom app bars.
  @override
  final double appBarTitleLeadingWidth;
  /// Foreground color merged into [captionBold] when rendering translated verification errors
  /// in `pin_code_component.dart`.
  @override
  final Color pinCodeErrorTextColor;
  /// Circular key fill for numeric [PinCodeKey] tiles; alpha animates between idle, pressed,
  /// and loading paths in `pin_code_key.dart`.
  @override
  final Color pinCodeKeyBackgroundColor;
}

extension ThemePinExtension on BuildContext {
  /// Reads [PinCodeTheme] from [ThemeData.extensions] for the closest [Theme] above this context.
  /// [PinCodeKeyboard] reaches these tokens through its build path in `pin_code_component.dart`,
  /// which applies them to the background gradient, masked PIN row, spacing between circles,
  /// shimmer loading treatment, and error caption styling. [PinCodeKey] in `pin_code_key.dart`
  /// uses the same extension for numeric and biometric key surfaces, while [PinCodeDeleteKey]
  /// in `pin_code_delete_key.dart` swaps delete icons from the theme when the backspace key
  /// presses and releases. Register [PinCodeTheme] on the active [Theme] before those widgets
  /// build; otherwise this getter throws [UnimplementedError] explaining that the extension is
  /// missing from [MaterialApp] or [Theme] configuration.
  PinCodeTheme get pinCodeTheme {
    final theme = Theme.of(this).extension<PinCodeTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'Not Implemented PinCodeTheme. '
        'Please add it as extension to the MaterialApp -> ThemeData',
      );
    }
    return theme;
  }
}
