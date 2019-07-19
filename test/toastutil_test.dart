import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toastutil/toastutil.dart';

void main() {
  const MethodChannel channel = MethodChannel('toastutil');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Toastutil.platformVersion, '42');
  });
}
