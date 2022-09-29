import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gislaine_studio/src/controllers/form_student_controller.dart';
import 'package:gislaine_studio/src/utils/formatters/cep_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/cpf_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/date_input_formatter.dart';
import 'package:gislaine_studio/src/utils/formatters/phone_input_formatter.dart';
import 'package:gislaine_studio/src/views/templates/widgets/elevated_button_template.dart';
import 'package:gislaine_studio/src/views/templates/widgets/textformfield_template.dart';

class FormStudent extends StatefulWidget {
  const FormStudent({
    Key? key,
  }) : super(key: key);

  @override
  State<FormStudent> createState() => _FormStudentState();
}

class _FormStudentState extends State<FormStudent> {
  late FormStudentController controller;

  @override
  void initState() {
    super.initState();
    controller = FormStudentController();
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
                                        initialValue: controller.student.nome,
                                        onSaved: (String? text) =>
                                            controller.student.nome = text,
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
                                        initialValue:
                                            controller.student.celular,
                                        onSaved: (String? text) =>
                                            controller.student.celular = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Data de nascimento',
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          DateInputFormatter(),
                                        ],
                                        onSaved: (String? text) => controller
                                            .student.dataNascimento = text,
                                      ),
                                      const SizedBox(height: 16),
                                      // FIX se for menor de 18 anos, não pedir CPF
                                      TextFormFieldTemplate(
                                        label: 'CPF',
                                        initialValue: controller.student.cpf,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          CpfInputFormatter(),
                                        ],
                                        onSaved: (String? text) {
                                          controller.student.cpf = text;
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
                                        onSaved: (String? text) => controller
                                            .student.dataNascimento = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Endereço',
                                        onSaved: (String? text) => controller
                                            .student.dataNascimento = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'Nome do responsável',
                                        onSaved: (String? text) => controller
                                            .student.dataNascimento = text,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormFieldTemplate(
                                        label: 'CPF do responsável',
                                        onSaved: (String? text) => controller
                                            .student.dataNascimento = text,
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
