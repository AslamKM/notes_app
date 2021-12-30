import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String note;
  @HiveField(1)
  final String task;
  Todo({
  required  this.note,
  required  this.task,
  });
}
