import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gislaine_studio/src/controllers/client_form_controller.dart';
import 'package:gislaine_studio/src/models/viacep_model.dart';
import 'package:gislaine_studio/src/utils/formatters/cep_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/cpf_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/date_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/phone_input_formatter.dart';
import 'package:gislaine_studio/src/utils/validators/cpf_validator.dart';
import 'package:gislaine_studio/src/utils/values_converter.dart';
import 'package:gislaine_studio/src/views/templates/widgets/elevated_button_template.dart';
import 'package:gislaine_studio/src/views/templates/widgets/textformfield_template.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  late ClientFormController controller;
  final ValueNotifier<TextEditingController> address =
      ValueNotifier<TextEditingController>(TextEditingController());
  bool isMinor = false;

  @override
  void initState() {
    super.initState();
    controller = ClientFormController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 786, // 770 for the content and 16 for the padding
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BackButton(),
                      ),
                      const SizedBox(height: 15),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cadastro de aluno',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.pink.withOpacity(0.5),
                                      ),
                                ),
                                const Divider(),
                                const SizedBox(height: 15),
                                Form(
                                  key: controller.formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      TextFormFieldTemplate(
                                        label: 'Nome',
                                        autofocus: true,
                                        initialValue: controller.client.nome,
                                        onSaved: (String? text) =>
                                            controller.client.nome = text,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite o nome';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Celular',
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          PhoneInputFormatter(),
                                        ],
                                        initialValue: controller.client.celular,
                                        onSaved: (String? text) =>
                                            controller.client.celular = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Data de nascimento',
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite a data de nascimento';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          DateInputFormatter(),
                                        ],
                                        onChanged: (String? text) {
                                          if (text?.length == 10) {
                                            final birthday =
                                                DateFormat('dd/MM/yyyy')
                                                    .parse(text!);

                                            final DateTime today =
                                                DateTime.now();
                                            int age =
                                                today.year - birthday.year;
                                            if (today.month < birthday.month) {
                                              age--;
                                            }

                                            if (today.month == birthday.month) {
                                              if (today.day < birthday.day) {
                                                age--;
                                              }
                                            }

                                            if (age < 18) {
                                              isMinor = true;
                                            } else {
                                              isMinor = false;
                                            }
                                          }
                                        },
                                        onSaved: (String? text) => controller
                                            .client.dataNascimento = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'CPF',
                                        validator: (String? value) {
                                          if (!isMinor &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Digite o CPF';
                                          }
                                          if (!isMinor &&
                                              !CPFValidator.isValid(value)) {
                                            return 'CPF inválido';
                                          }
                                          return null;
                                        },
                                        initialValue: controller.client.cpf,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CpfInputFormatter(),
                                        ],
                                        onSaved: (String? text) {
                                          controller.client.cpf = text;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'CEP',
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CepInputFormatter(),
                                        ],
                                        onChanged: (String? text) async {
                                          if (text?.length == 10) {
                                            final String cep =
                                                ValuesConverter.convertCep(
                                              text ?? '',
                                            );

                                            final url = Uri.https(
                                              'viacep.com.br',
                                              '/ws/$cep/json/',
                                              {'q': '{http}'},
                                            );

                                            // Await the HTTP GET response, then decode the
                                            // JSON data it contains.
                                            final response =
                                                await http.get(url);

                                            if (response.statusCode == 200) {
                                              final jsonResponse = convert
                                                  .jsonDecode(response.body);

                                              final ViacepModel viacep =
                                                  ViacepModel.fromJson(
                                                jsonResponse,
                                              );

                                              address.value.text =
                                                  '${viacep.logradouro}'
                                                  ', Bairro ${viacep.bairro}'
                                                  ', ${viacep.localidade}'
                                                  ' - ${viacep.uf}.';
                                            }
                                            // else {
                                            //   debugPrint(
                                            //     'Request failed with status: ${response.statusCode}.',
                                            //   );
                                            // }
                                          }
                                        },
                                        onSaved: (String? text) =>
                                            controller.client.cep = text,
                                      ),
                                      const SizedBox(height: 16),
                                      ValueListenableBuilder<
                                          TextEditingController>(
                                        valueListenable: address,
                                        builder: (
                                          BuildContext context,
                                          TextEditingController value,
                                          Widget? child,
                                        ) {
                                          return TextFormFieldTemplate(
                                            label: 'Endereço',
                                            controller: value,
                                            onSaved: (String? text) =>
                                                controller.client.endereco =
                                                    text,
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Nome do responsável',
                                        validator: (String? value) {
                                          if (isMinor &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Digite o nome';
                                          }
                                          return null;
                                        },
                                        onSaved: (String? text) => controller
                                            .client.nomeResponsavel = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'CPF do responsável',
                                        validator: (String? value) {
                                          if (isMinor &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Digite o CPF';
                                          }
                                          if (isMinor &&
                                              !CPFValidator.isValid(value)) {
                                            return 'CPF inválido';
                                          }

                                          return null;
                                        },
                                        onSaved: (String? text) => controller
                                            .client.cpfResponsavel = text,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CpfInputFormatter(),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ElevatedButtonTemplate(
                                          icon: Icons.save,
                                          label: 'Salvar',
                                          onPressed: controller.submit,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
