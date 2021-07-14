import 'dart:async';

import 'package:flutter/services.dart';

class RadioGroupFormField {
  static const MethodChannel _channel =
      const MethodChannel('radio_group_form_field');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
