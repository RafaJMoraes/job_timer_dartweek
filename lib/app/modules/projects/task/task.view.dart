import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_loading.dart';
import 'package:job_timer/app/modules/projects/task/controller/task.controller.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:validatorless/validatorless.dart';

class TaskView extends StatefulWidget {
  final TaskController taskController;
  const TaskView({super.key, required this.taskController});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  final _formKey = GlobalKey<FormState>();
  final _taskName = TextEditingController();
  final _taskValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocListener<TaskController, TaskStatus>(
      bloc: widget.taskController,
      listener: (context, state) {
        if(state == TaskStatus.success){
          Navigator.of(context).pop();
        }else if(state == TaskStatus.failure){
          AsukaSnackbar.alert('Erro ao tentar salvar Task').show();
        }
      },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Criar nova task', style: TextStyle(color: Colors.black)),
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Form(
              key: _formKey,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _taskName,
                      decoration:
                      const InputDecoration(label: Text('Nova Task')),
                      validator: Validatorless.required('Nome obirgaótrio'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _taskValue,
                      decoration: const InputDecoration(
                          label: Text('Duração da task')),
                      keyboardType: const TextInputType.numberWithOptions(),
                      validator: Validatorless.multiple([
                        Validatorless.required('Duração obrigatória.'),
                        Validatorless.number('Permitido somente números'),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ButtonLoading<TaskController, TaskStatus>(
                        bloc: widget.taskController,
                        selector: (state) => state == TaskStatus.loading,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          final name = _taskName.text;
                          final value = _taskValue.text;

                          await widget.taskController
                              .register(name: name, duration: int.parse(value));
                        },
                        label: 'Salvar',

                      ),
                    ),
                  ],
                ),
              )),
        )
    );
  }
}
