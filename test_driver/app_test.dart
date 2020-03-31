import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  final config = Config();
  final buttonFinder = find.byType('FloatingActionButton');
  final textFinder = find.byValueKey('count-value');
  group('Full body test', () {
    // Connect driver
    setUpAll(
      () async {
        driver = await FlutterDriver.connect();
      },
    );
    test(
      'Increment counter',
      () async {
        await driver.tap(buttonFinder);
        await screenshot(driver, config, 'testing');
        expect(await driver.getText(textFinder), "1"); 
      },
      timeout: Timeout(
        Duration(seconds: 120),
      ),
    );

    // close driver
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
