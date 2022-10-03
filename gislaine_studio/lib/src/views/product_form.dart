import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gislaine_studio/src/controllers/product_form_controller.dart';
import 'package:gislaine_studio/src/utils/formatters/brl_input_formatter.dart';
import 'package:gislaine_studio/src/views/templates/widgets/elevated_button_template.dart';
import 'package:gislaine_studio/src/views/templates/widgets/textformfield_template.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late ProductFormController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductFormController();
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
                                  'Cadastro de produto',
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
                                      TextFormFieldTemplate(
                                        label: 'Nome',
                                        autofocus: true,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Digite o nome';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: TextFormFieldTemplate(
                                              label: 'Preço',
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                BrlInputFormatter()
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            flex: 1,
                                            child: TextFormFieldTemplate(
                                              label: 'Estoque minimo',
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                            ),
                                          ),
                                        ],
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
