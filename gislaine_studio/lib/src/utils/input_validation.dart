String? validarInput({
  required String input,
  int minLength = 0,
  int maxLength = 255,
}) {
  if (input.trim().length < minLength && minLength != 0) {
    return 'mínimo $minLength caracteres';
  } else if (input.length > maxLength) {
    return 'máximo  $maxLength caracteres.';
  }
}

//Todo: Dividir em passos para mostrar qual o erro para o usuário
//   ^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$
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
String? validarUsername({required String username}) {
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
    return '● Sómente números e caracteres, permitindo também "." ou "_"'
        '\n● Não pode conter espaços em branco'
        '\n● Não pode conter "_" ou "." no final ou no começo'
        '\n● Não pode conter "__" ou "_." ou "._" ou ".."'
        '\n● Acentos e caracteres acentuados não são permitidos.';
  }
}

// TODO: fazer uma função que retorna uma string com checkmarks de cara critério obdecido
// TODO: concatenar todos os valores e retornar tudo que está errado ao invéz de só 1 erro por vez
String? validarSenha({
  required String senha,
}) {
  if (senha.isEmpty) {
    return 'preenchimento obrigatório.';
  } else if (senha.length < 8) {
    return 'mínimo 8 caracteres';
  } else if (senha.length > 40) {
    return 'máximo 40 caracteres.';
  } else if (!RegExp('[A-Z]').hasMatch(senha)) {
    return 'Sua senha deve conter: uma letra Maiuscula';
  } else if (!RegExp('[a-z]').hasMatch(senha)) {
    return 'Sua senha deve conter: uma letra Minuscula';
  } else if (!(RegExp('[0-9]').hasMatch(senha) ||
      RegExp(r'[!@#$%^&*]').hasMatch(senha))) {
    return 'Sua senha deve conter números ou símbolos';
  }
}

String? validarConfirmarSenha({
  required String senha,
  required String confirmarSenha,
}) {
  if (senha != confirmarSenha) {
    return 'Senha de confirmação inválida, digite novamente.';
  }
}
