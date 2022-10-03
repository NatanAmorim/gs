import 'package:flutter/material.dart';
import 'package:gislaine_studio/src/controllers/order_form_controller.dart';
import 'package:gislaine_studio/src/views/templates/widgets/elevated_button_template.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  late OrderFormController controller;

  @override
  void initState() {
    super.initState();
    controller = OrderFormController();
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
                                  'Cadastro de encomenda',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.brown),
                                ),
                                const Divider(),
                                const SizedBox(height: 15),
                                Text(
                                  'TODO',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.deepOrangeAccent),
                                ),
                                // TODO: dropdown selecionar aluno
                                // TODO: dropdown selecionar produtos
                                // TODO: produto não listado?
                                const SizedBox(height: 16),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButtonTemplate(
                                    onPressed: controller.submit,
                                    icon: Icons.save,
                                    label: 'Salvar',
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
