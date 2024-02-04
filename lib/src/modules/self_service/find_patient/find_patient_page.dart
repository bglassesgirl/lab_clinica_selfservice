import 'package:brasil_fields/brasil_fields.dart';
import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final documentEC = TextEditingController();
  final controller = Injector.get<FindPatientController>();

  @override
  void initState() {
    messageListener(controller);
    effect((){
        final FindPatientController(:patient, : patientNotFound) = controller;

        if (patient != null || patientNotFound != null) {
          // selfservicecontroler setando o dado ao paciente e redirecionando
         Injector.get<SelfServiceController>().goToFormPatient(patient);
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LabClinicasAppBar(actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Reeniciar processo'),
                )
              ];
            },
            onSelected: (value) async {
                Injector.get<SelfServiceController>().restartProcess();
            },
          )
        ]),
        body: LayoutBuilder(builder: (_, constrains) {
          var sizeOf = MediaQuery.sizeOf(context);
          return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40),
                constraints: BoxConstraints(maxHeight: sizeOf.height),
                decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_login.png'),
                    fit: BoxFit.cover)),
              child: Center(
                  child: Container(
                    width: sizeOf.width * .8,
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(16),
                    ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/logo_vertical.png'),
                      const SizedBox(
                        height: 48,
                      ),
                      TextFormField(
                        controller: documentEC,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter(),
                        ],
                        validator: Validatorless.required('CPF obrigátorio'),
                        decoration: const InputDecoration(
                            label: Text('Digite o CPF do paciente? ')),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Náo sabe o CPF do paciente',
                            style: TextStyle(
                                fontSize: 14,
                                color: LabClinicasTheme.blueColor,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.continueWithoutDocument();
                            },
                            child: const Text(
                              'Clique aqui',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: LabClinicasTheme.orangeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {
                              final valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid) {
                                controller.findPatientByDocument(documentEC.text);
                              }
                            },
                            child: const Text('Continuar')),
                      )
                    ],
                  ),
                ),
              )),
          ));
        }));
  }
}
