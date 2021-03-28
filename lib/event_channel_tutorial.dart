
import 'dart:async';

import 'package:flutter/services.dart';

class EventChannelTutorial {
  static const MethodChannel _channel =
  const MethodChannel('event_channel_tutorial');

  static const EventChannel _randomNumberChannel = const EventChannel('random_number_channel');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Stream<int> get getRandomNumberStream {
    return _randomNumberChannel.receiveBroadcastStream().cast();
  }
}
