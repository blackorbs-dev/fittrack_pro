import 'dart:async';

import 'package:fittrack_pro/core/error/error.dart';
import 'package:fittrack_pro/core/util/response.dart';
import 'package:fittrack_pro/core/util/safe_caller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('safeCall', () {
    test('returns SuccessResponse on success', () async {
      final result = await safeCall(() async => 'ok');

      expect(result, isA<SuccessResponse>());
      expect((result as SuccessResponse).data, 'ok');
    });

    test('returns ErrorResponse with serialization error on FormatException', () async {
      final result = await safeCall(() {
        throw FormatException('Invalid format');
      });

      expect(result, isA<ErrorResponse>());
      expect((result as ErrorResponse).error, DataError.serialization());
    });

    test('returns ErrorResponse with platform error on PlatformException', () async {
      final result = await safeCall(() {
        throw PlatformException(code: '500', message: 'Platform failure');
      });

      expect(result, isA<ErrorResponse>());
      expect((result as ErrorResponse).error,
          DataError.platform(message: 'Platform failure'));
    });

    test('returns ErrorResponse with timeout error on TimeoutException', () async {
      final result = await safeCall(() {
        throw TimeoutException('Request timed out');
      });

      expect(result, isA<ErrorResponse>());
      expect((result as ErrorResponse).error, DataError.timeout());
    });

    test('returns ErrorResponse with unknown error on generic exception', () async {
      final result = await safeCall(() {
        throw Exception('Something went wrong');
      });

      expect(result, isA<ErrorResponse>());
      expect((result as ErrorResponse).error, DataError.unknown());
    });
  });
}
