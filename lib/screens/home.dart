import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/screens/create_task.dart';
import 'package:template/states/list_handler.dart';
import '../components/task_tile.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 144, 191),
      appBar: CustomAppBar(actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: Text('All'),
              value: 'all',
            ),
            PopupMenuItem(
              child: Text('Done'),
              value: 'done',
            ),
            PopupMenuItem(
              child: Text('Undone'),
              value: 'undone',
            ),
          ],
          onSelected: (value) {
            context
                .read<ListHandler>()
                .changeCurrentFiltering(value.toString());
          },
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(),
            ),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Consumer<ListHandler>(
        builder: (BuildContext context, listHandler, child) {
          return ListView.builder(
            itemCount: listHandler.currentTasks.length,
            itemBuilder: (BuildContext context, index) {
              return TaskTile(
                taskDescription: listHandler.currentTasks[index].description,
                taskDone: listHandler.currentTasks[index].done,
                taskID: listHandler.currentTasks[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
