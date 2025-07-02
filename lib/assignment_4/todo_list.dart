import 'package:flutter/material.dart';

class TodoList extends StatefulWidget{
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  final TextEditingController _controller = TextEditingController();
  final List<String> _todos = [];

  void _addTodo() {
    final text = _controller.text.trim();
    if(text.isNotEmpty){
      setState(() {
        _todos.add(text);
        _controller.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-do List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter a task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(onPressed: _addTodo, child: const Text('Add')),
            const SizedBox(height: 20),
            Expanded(
              child: _todos.isEmpty ? const Center(child: Text('No tasks yet'))
              : ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_todos[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red,),
                        onPressed: () => _removeTodo(index)
                      ),
                    ),
                  );
                }
              )
            ),
          ],
        )
      ),
    );
  }
}
