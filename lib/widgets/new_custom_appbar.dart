import 'package:flutter/material.dart';

import '../adapters/todo.dart';

AppBar newCustomAppBar(BuildContext context, formKey, box, note, task) {
  return AppBar(
    leading: Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    ),
    backgroundColor: Colors.white,
    actions: [
      // IconButton(
      //   onPressed: () async {
      //     // Validate returns true if the form is valid, or false otherwise.
      //     if (formKey.currentState!.validate()) {
      //       ///     Box<Todo> box = Hive.box<Todo>('todos');
      //       box.add(Todo(
      //         note: note,
      //         task: task,
      //       ));
      //       Navigator.of(context).pop();
      //     } else {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text('Processing Data')),
      //       );
      //     }
      //   },
      //   splashRadius: 20,
      //   icon: const Icon(
      //     Icons.done,
      //     color: Colors.black,
      //   ),
      // ),
      // IconButton(
      //   onPressed: () {},
      //   splashRadius: 20,
      //   icon: const Icon(
      //     Icons.share,
      //     color: Colors.black,
      //   ),
      // ),
      IconButton(
        splashRadius: 20,
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
    ],
  );
}
