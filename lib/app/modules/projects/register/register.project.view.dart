import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_loading.dart';
import 'package:job_timer/app/modules/projects/register/controller/register.cotroller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterProjectView extends StatefulWidget {
  final ProjectRegisterController registerController;

  const RegisterProjectView({super.key, required this.registerController});

  @override
  State<RegisterProjectView> createState() => _RegisterProjectViewState();
}

class _RegisterProjectViewState extends State<RegisterProjectView> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _estimateEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, RegisterStatus>(
        bloc: widget.registerController,
        listener: (context, state) {
          switch (state) {
            case RegisterStatus.success:
              Navigator.of(context).pop();
              break;
            case RegisterStatus.error:
              AsukaSnackbar.alert('Erro ao salvar projeto').show();
              break;
            default:
              break;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'Criar novo projeto',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameEC,
                      decoration:
                          const InputDecoration(label: Text('Nome do Projeto')),
                      validator: Validatorless.required('Nome obirgaótrio'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _estimateEC,
                      decoration: const InputDecoration(
                          label: Text('Estimativa de horas')),
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: Validatorless.multiple([
                        Validatorless.required('Estimativa obrigatória.'),
                        Validatorless.number('Permitido somente números'),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ButtonLoading<ProjectRegisterController, RegisterStatus>(
                          bloc: widget.registerController,
                          selector: (state) => state == RegisterStatus.loading,
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            final name = _nameEC.text;
                            final estimate = int.parse(_estimateEC.text);

                            widget.registerController
                                .register(name: name, estimate: estimate);
                          },
                          label: 'Salvar',

                      ),
                    ),
                    const SizedBox(height: 10),
                    // BlocSelector<ProjectRegisterController, RegisterStatus,
                    //         bool>(
                    //     bloc: widget.registerController,
                    //     selector: (state) => state == RegisterStatus.loading,
                    //     builder: (context, state) {
                    //       return Visibility(
                    //           visible: state,
                    //           child: Center(
                    //               child: CircularProgressIndicator(
                    //             backgroundColor: Theme.of(context).primaryColor,
                    //             color: Colors.white,
                    //           )));
                    //     })
                  ],
                ),
              )),
        ));
  }
}
