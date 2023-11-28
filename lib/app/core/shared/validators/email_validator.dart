String? emailValidator(String? value) {
  final handledValue = value?.trim();
  if (handledValue == null || handledValue.isEmpty) {
    return 'Campo obrigatório';
  }

  if (handledValue.length < 2) {
    return 'O email deve conter no mínimo 2 caracteres';
  }
  if (handledValue.length > 20) {
    return 'O email deve conter no máximo 20 caracteres';
  }

  return null;
}
