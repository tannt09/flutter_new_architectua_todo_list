import 'package:logging/logging.dart';

class SomeParent {
  final _logger = Logger('SomeParent');

  void doSomeWork() {
    _logger.info('parent working');
  }
}

class SomeChild extends SomeParent {
  @override
  Logger get _logger => Logger('SomeChild');

  @override
  void doSomeWork() {
    super.doSomeWork();
    _logger.info('child doing some other work');
  }
}
