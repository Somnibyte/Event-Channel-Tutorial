import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_channel_tutorial/event_channel_tutorial.dart';

void main() {
  const MethodChannel channel = MethodChannel('event_channel_tutorial');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await EventChannelTutorial.platformVersion, '42');
  });
}
