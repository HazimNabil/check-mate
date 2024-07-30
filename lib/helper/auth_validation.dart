String? validatePassword(String? value) {
  if (value?.isEmpty ?? true) {
    return 'This field is required';
  }
  return null;
}

String? validateEmail(String? value) {
  final emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (value?.isEmpty ?? true) {
    return 'This field is required';
  } else if (!emailPattern.hasMatch(value!)) {
    return 'This is not valid email';
  }
  return null;
}
