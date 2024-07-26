enum UsernameError {
  invalidUsername(
    errorDescription: 'O nome deve conter no mínimo 3 caracteres',
  ),
  none(errorDescription: '');

  final String errorDescription;

  const UsernameError({required this.errorDescription});
}

interface class ValidateUsernameUseCase {
  UsernameError call(String username) {
    if (username.isNotEmpty && username.length < 3) {
      return UsernameError.invalidUsername;
    }
    return UsernameError.none;
  }
}
