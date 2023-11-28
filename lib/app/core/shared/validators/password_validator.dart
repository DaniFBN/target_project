String? passwordValidator(String? value) {
  final handledValue = value?.trim();
  if (handledValue == null || handledValue.isEmpty) {
    return 'Campo obrigatório';
  }

  if (handledValue.length < 2) {
    return 'A senha deve conter no mínimo 2 caracteres';
  }
  if (handledValue.length > 20) {
    return 'A senha deve conter no máximo 20 caracteres';
  }

  final regex = RegExp(r'^[a-zA-Z0-9]+$');
  final isValid = regex.hasMatch(handledValue);
  if (!isValid) {
    return 'A senha só deve conter letras e números';
  }

  return null;
}
