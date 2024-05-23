import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/Controller/login_Controller.dart';
import 'package:task_manager_app/View/Widget/FormInput.dart';

import '../../Controller/Tasks_Controller.dart';
import '../../Model/Constant.dart';
import '../Widget/UserText.dart';

class TasksPage extends StatelessWidget {
   Tasks tasks = Get.put(Tasks());
   LoginController loginController = Get.put(LoginController());
  String? _newTask;
  String? _editTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'User Tasks',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true),
      body: Column(
        children: [
          UserText(),
          Expanded(
            child: GetBuilder<Tasks>(
              builder: (controller) => SingleChildScrollView(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.res.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: primary),
                                  height: 250,
                                  child: Column(children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Edit Task',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        onChanged: (value) {
                                          _editTask = value;
                                        },
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            icon: Icon(Icons.edit_note,
                                                color: secondary),
                                            label: const Text(
                                              'New Task',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color(
                                                            0xa5e9feff)))),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                        onPressed: () async {
                                          tasks.updateTask(
                                              controller.res[index]['id']
                                                  .toString(),
                                              _editTask!,
                                              index);
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => secondary)),
                                        child: const Text('Save Edit',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                        onPressed: () async {
                                          tasks.doneTask(
                                              controller.res[index]['id']
                                                  .toString(),
                                              index);
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => forth)),
                                        child: const Text('Complete Task',
                                            style:
                                                TextStyle(color: Colors.white)))
                                  ]),
                                ));
                      },
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: forth,
                          child: Text('$index'),
                        ),
                        title: Text(
                          controller.res[index]['todo'],
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: controller.res[index]['completed']
                            ? const Text(
                                'Status : Completed',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Status : ToDo',
                                style: TextStyle(color: secondary),
                              ),
                        trailing: IconButton(
                          onPressed: () {
                            tasks.deleteTask(controller.res[index]['id']);
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                          ),
                        ),
                        iconColor: secondary,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 20,
                      color: forth,
                      endIndent: 50,
                      indent: 50,
                      thickness: 1,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton.extended(
            heroTag: 'Add_Task',
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: primary),
                        height: 250,
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Enter Task',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: FormInput(
                                text: 'Task',
                                icon: Icons.task,
                                keyboardType: TextInputType.text,
                                key: const ValueKey('Task'),
                                textcolor: Colors.white,
                                onChanged: (p0) {
                                  _newTask = p0;
                                },
                                obscureText: false),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () async {
                                if (_newTask != null) {
                                  await tasks.addTask(
                                      taskText: _newTask!,
                                      userId: loginController.userData['id']);
                                  _newTask = null;
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith(
                                      (states) => secondary)),
                              child: const Text('Save',
                                  style: TextStyle(color: Colors.black)))
                        ]),
                      ));
            },
            label: const Text('Add Task'),
            icon: const Icon(Icons.add),
            elevation: 5,
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'View_Task',
            onPressed: () async{
            await   tasks.fetchAllTask('0');
           Get.toNamed('AllTasks');
            },
            label: const Text('View All Tasks'),
            icon: const Icon(Icons.view_carousel_outlined),
            elevation: 5,
            backgroundColor: forth,
          ),
        ],
      ),
    );
  }
}
