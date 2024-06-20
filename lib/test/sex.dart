enum Sex { male, female, other }

extension SexToInt on Sex {
  int getRawValue() {
    switch (this) {
      case Sex.male:
        return 1;
      case Sex.female:
        return 0;
      case Sex.other:
        return -1;
    }
  }
}

extension IntToSex on int {
  Sex toSex() {
    switch (this) {
      case 1:
        return Sex.male;
      case 0:
        return Sex.female;
      default:
        return Sex.other;
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(this);
  }
}

