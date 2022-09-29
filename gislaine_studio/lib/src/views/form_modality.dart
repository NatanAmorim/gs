import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/controllers/form_modality_controller.dart';
import 'package:gislaine_studio/src/views/templates/widgets/elevated_button_template.dart';
import 'package:gislaine_studio/src/views/templates/widgets/textformfield_template.dart';

class FormModality extends StatefulWidget {
  const FormModality({Key? key}) : super(key: key);

  @override
  State<FormModality> createState() => _FormModalityState();
}

class _FormModalityState extends State<FormModality> {
  late FormModalityController controller;

  @override
  void initState() {
    super.initState();
    controller = FormModalityController();
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
                                  'Cadastro de modalidade',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.brown),
                                ),
                                const Divider(),
                                const SizedBox(height: 15),
                                Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: [
                                      const TextFormFieldTemplate(
                                        label: 'Nome',
                                      ),
                                      const SizedBox(height: 16),
                                      const TextFormFieldTemplate(
                                        label: 'Preço/Valor',
                                      ),
                                      const SizedBox(height: 16),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: ElevatedButtonTemplate(
                                          onPressed: controller.submit,
                                          icon: Icons.save,
                                          label: 'Salvar',
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
