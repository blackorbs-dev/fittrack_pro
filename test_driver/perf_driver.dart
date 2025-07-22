import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver(
    responseDataCallback: (data) async{
      if(data != null){
        final summary = driver.TimelineSummary.summarize(
            driver.Timeline.fromJson(
                data['app_performance_main'] as Map<String, dynamic>
            )
        );

        await summary.writeTimelineToFile(
            'app_performance_main',
            pretty: true, includeSummary: true
        );
      }
    }
);