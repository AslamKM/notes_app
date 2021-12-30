import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/screens/create_todo_screen.dart';

import 'package:todo_list/screens/individual_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late final Box noteBox;

  _deleteNote(int index) {
    noteBox.deleteAt(index);
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    noteBox = Hive.box('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Todo Items'),
      ),
      body: ValueListenableBuilder(
        valueListenable: noteBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemCount: box.length,
            itemBuilder: (context, index) {
              var currentBox = box;
              var obj = currentBox.getAt(index)!;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => IndividualListScreen(
                          index: index,
                          obj: obj,
                        ),
                      ),
                    );
                  },
                  title: Text(
                    obj.task,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    obj.note,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    onPressed: () => _deleteNote(index),
                    icon: const Icon(Icons.delete),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("+ | Add Note"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateTodoScreen()),
          );
        },
      ),
    );
  }
}
