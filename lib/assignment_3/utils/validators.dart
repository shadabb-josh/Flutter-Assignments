String? validateEmail(String? value){
  if(value == null || value.isEmpty || !value.contains('@')){
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value){
  if(value == null || value.length < 6){
    return 'Password must be atleast 6 characters';
  }
  return null;
}