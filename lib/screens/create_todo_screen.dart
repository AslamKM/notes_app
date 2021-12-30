import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/widgets/new_custom_appbar.dart';

import '../adapters/todo.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final formKey = GlobalKey<FormState>();
  String note = "";
  String task = "";
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newCustomAppBar(
        context,
        formKey,
        box,
        note,
        task,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              //decoration: const InputDecoration(hintText: 'Add Note Title'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              cursorHeight: 25,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.transparent,
                  ),
                ),
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 25.0,
                  //    color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  note = value;
                });
              },
            ),
            const Divider(
              thickness: 2,
              height: 5,
              indent: 20,
              endIndent: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              // decoration:
              //     const InputDecoration(hintText: 'Add Task Description'),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent),
                ),
                hintText: 'Content',
              ),
              onChanged: (value) {
                setState(() {
                  task = value;
                });
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (formKey.currentState!.validate()) {
                      ///     Box<Todo> box = Hive.box<Todo>('todos');
                      box.add(Todo(
                        note: note,
                        task: task,
                      ));
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
