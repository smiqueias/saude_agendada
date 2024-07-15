String usernameValidator(String username) {
  if (username.isNotEmpty && username.length < 3) {
    return "O nome deve conter no mínimo 3 caracteres";
  }
  return "";
}
