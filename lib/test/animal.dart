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
  @override
  void eat() {
    print("eat");
  }

  @override
  void move() {
    print("move");
  }

  void say() {
    print("Gâu Gâu");
  }
}

class Husky implements Dog {
  @override
  late bool isAlive;
  @override
  void eat() {
    // TODO: implement eat
  }
  @override
  void move() {
    // TODO: implement move
  }
  @override
  void say() {
    // TODO: implement say
  }
}
