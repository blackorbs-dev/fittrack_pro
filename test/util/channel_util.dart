import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class TestChannelUtils {
  late MethodChannel methodChannel;
  final String methodChannelName;
  final String eventChannelName;
  final StreamController<String> eventStreamController = StreamController<String>.broadcast();

  TestChannelUtils({
    required this.methodChannelName,
    required this.eventChannelName,
  }){
    methodChannel = MethodChannel(methodChannelName);
  }

  void mockMethodCalls(Map<String, dynamic> Function(MethodCall call) handler) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(methodChannel, (call) async {
      final result = handler(call);
      if (result['error'] != null) {
        throw PlatformException(
          code: result['error']['code'],
          message: result['error']['message'],
        );
      }
      return result['result'];
    });
  }

  void mockEventStream() {
    const codec = StandardMethodCodec();
    final binaryMessenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

    binaryMessenger.setMockMessageHandler(eventChannelName, (ByteData? message) async {
      // Simulate platform responding to listen call
      return codec.encodeSuccessEnvelope(null);
    });

    // Push events directly through binaryMessenger (not eventStreamController.listen)
    eventStreamController.stream.listen((event) {
      final encoded = codec.encodeSuccessEnvelope(event);
      binaryMessenger.handlePlatformMessage(
        eventChannelName,
        encoded,
            (ByteData? reply) {},
      );
    });
  }


  void dispose() {
    eventStreamController.close();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(methodChannelName, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(eventChannelName, null);
  }
}
