import 'dart:async';

import 'package:fittrack_pro/core/error/error.dart';
import 'package:fittrack_pro/core/error/extensions.dart';
import 'package:fittrack_pro/core/util/response.dart';
import 'package:flutter/services.dart';

Future<Response<T, DataError>> safeCall<T>(dynamic Function() request) async {
  try {
    final response = await request();
    return SuccessResponse(response);
  } on FormatException catch (e, stacktrace) {
    e.printDebug(tag: 'Serialization Error');
    stacktrace.printDebug(tag: 'Stacktrace');
    return ErrorResponse(DataError.serialization());
  } on PlatformException catch (e, stacktrace) {
    e.printDebug(tag: 'Platform Error');
    stacktrace.printDebug(tag: 'Stacktrace');
    return ErrorResponse(DataError.platform(message: e.message));
  }
  on TimeoutException catch (e, stacktrace) {
    e.printDebug(tag: 'Timeout Error');
    stacktrace.printDebug(tag: 'Stacktrace');
    return ErrorResponse(DataError.timeout());
  }  catch (e, stacktrace) {
    e.printDebug(tag: 'Unknown Error');
    stacktrace.printDebug(tag: 'Stacktrace');
    return ErrorResponse(DataError.unknown());
  }
}
