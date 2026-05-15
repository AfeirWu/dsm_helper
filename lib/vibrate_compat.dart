// Vibrate compatibility layer using Flutter's built-in HapticFeedback
// This replaces the deprecated vibrate package (^0.0.4) which references
// obsolete jcenter gradle artifacts that no longer exist.

import 'package:flutter/services.dart';

enum FeedbackType {
  light,
  medium,
  heavy,
  warning,
  selection,
  success,
  error,
}

class Vibrate {
  static Future<bool> canVibrate() async {
    return true; // Most devices support haptic feedback
  }

  static Future<void> feedback(FeedbackType type) async {
    switch (type) {
      case FeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case FeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case FeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case FeedbackType.warning:
        await HapticFeedback.heavyImpact();
        break;
      case FeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case FeedbackType.success:
        await HapticFeedback.mediumImpact();
        break;
      case FeedbackType.error:
        await HapticFeedback.heavyImpact();
        break;
    }
  }
}
