class InputValidators {
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required*';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required*';
    } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required*';
    }
    // else if (value.length < 6) {
    //   return 'Password must be at least 6 characters';
    // }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'required*';
    }
    return null;
  }
}
