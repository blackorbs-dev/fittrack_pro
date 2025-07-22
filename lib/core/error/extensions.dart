import 'package:fittrack_pro/core/error/error.dart';
import 'package:flutter/foundation.dart';

extension ExceptionLogger on Object {
  void printDebug({String tag = ''}) {
    if(kDebugMode) {
      debugPrint('$tag: $this');
    }
  }
}

extension Message on DataError{
  String message(){
    switch(this){
      case ErrorMessage(:final message):
        return message;
      case PlatformError(:final message):
        return message ?? 'Oops, something went wrong, please try again.';
      default:
        return 'Oops, something went wrong, please try again.';
    }
  }
}