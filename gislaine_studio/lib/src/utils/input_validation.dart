class InputValidation {
  static String? defaultInputValidation({
    required String input,
    int minLength = 0,
    int maxLength = 255,
  }) {
    assert(
      minLength >= 0,
      'número mínimo de caracteres não pode ser menor que zero',
    );

    if (input.trim().length < minLength && minLength != 0) {
      return 'mínimo $minLength caracteres';
    }

    if (input.length > maxLength) {
      return 'máximo  $maxLength caracteres.';
    }

    return null;
  }

  //Todo: Dividir em passos para mostrar qual o erro para o usuário
  //     ^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$
  //  └─────┬────┘└───┬──┘└─────┬─────┘└─────┬─────┘ └───┬───┘
  //        │         │         │            │           no _ or . at the end
  //        │         │         │            │
  //        │         │         │            allowed characters
  //        │         │         │
  //        │         │         no __ or _. or ._ or .. inside
  //        │         │
  //        │         no _ or . at the beginning
  //        │
  //        username is 8-20 characters long
  static String? validateUsername({required String username}) {
    if (username.isEmpty) {
      return 'preenchimento obrigatório.';
    }

    if (username.length < 4) {
      return 'mínimo 4 caracteres';
    }

    if (username.length >= 20) {
      return 'máximo 20 caracteres.';
    }

    if (!RegExp(r'^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$')
        .hasMatch(username)) {
      // regex = ^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$
      // Não pode conter _ ou . no começo
      // Não pode conter _ ou . no final
      // [a-zA-Z0-9._] = caracteres permitidos.
      // Não pode conter __ ou _. ou ._ ou .. dentro da string
      // username entre 4-20 caracteres de comprimento
      return 'nome de usuário inválido';
    }

    return null;
  }

  // TODO: fazer uma função que retorna uma string com checkmarks de cara critério obdecido
  // TODO: concatenar todos os valores e retornar tudo que está errado ao invéz de só 1 erro por vez
  static String? validatePassword({
    required String password,
  }) {
    if (password.isEmpty) {
      return 'preenchimento obrigatório.';
    }
    if (password.length < 6) {
      return 'mínimo 6 caracteres';
    }
    if (password.length > 20) {
      return 'máximo 20 caracteres.';
    }
    if (!RegExp('[A-Z]').hasMatch(password)) {
      return 'Deve conter uma letra maiuscula';
    }
    if (!RegExp('[a-z]').hasMatch(password)) {
      return 'Deve conter uma letra minuscula';
    }
    if (!(RegExp('[0-9]').hasMatch(password) ||
        RegExp(r'[!@#$%^&*]').hasMatch(password))) {
      return 'Sua senha deve conter números ou símbolos';
    }

    return null;
  }

  static String? validateConfirmPassword({
    required String password,
    required String confirmation,
  }) {
    if (password != confirmation) {
      return 'Senha de confirmação inválida, digite novamente.';
    }

    return null;
  }
}
