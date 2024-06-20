class SomeParent {
  void doSomeWork() {
    print('parent working');
  }
}

class SomeChild extends SomeParent {
  @override
  void doSomeWork() {
    super.doSomeWork();
    print('child doing some other work');
  }
}
