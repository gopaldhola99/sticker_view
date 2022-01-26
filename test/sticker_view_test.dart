import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  const MethodChannel channel = MethodChannel('sticker_view');

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
    // expect(await StickerView.platformVersion, '42');
  });
}
