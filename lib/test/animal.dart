import 'package:logging/logging.dart';

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

class Dog extends Animal {
  final _logger = Logger('Dog');

  @override
  void eat() {
    _logger.info('Dog is eating');
  }

  @override
  void move() {
    _logger.info('Dog is moving');
  }

  void say() {
    _logger.info('Dog says: Gâu Gâu');
  }
}

class Husky implements Dog {
  @override
  final _logger = Logger('Husky');
  @override
  late bool isAlive;
  @override
  void eat() {
    _logger.info('Husky is eating');
  }

  @override
  void move() {
    _logger.info('Husky is moving');
  }

  @override
  void say() {
    _logger.info('Husky is saying');
  }
}
