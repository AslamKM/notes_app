import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../adapters/todo.dart';

class UpdateNoteForm extends StatefulWidget {
  final int? index;
  final Todo obj;
  const UpdateNoteForm({
    Key? key,
    required this.index,
    required this.obj,
  }) : super(key: key);

  @override
  _UpdateNoteFormState createState() => _UpdateNoteFormState();
}

class _UpdateNoteFormState extends State<UpdateNoteForm> {
  final _noteFormKey = GlobalKey<FormState>();
  late final _taskController;
  late final _noteController;
  late final Box box;
  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  // Update info of people box
  _updateInfo() {
    Todo newTodo = Todo(
      note: _noteController.text,
      task: _taskController.text,
    );

    box.putAt(widget.index!, newTodo);
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('todos');
    _taskController = TextEditingController(text: widget.obj.task);
    _noteController = TextEditingController(text: widget.obj.note);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _noteFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _taskController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            controller: _noteController,
            validator: _fieldValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_noteFormKey.currentState!.validate()) {
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
