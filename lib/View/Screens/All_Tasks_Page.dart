import 'package:flutter/material.dart';

import '../../Controller/Tasks_Controller.dart';
import 'package:get/get.dart';

import '../../Model/Constant.dart';

class AllTasks extends StatelessWidget {
  AllTasks({Key? key}) : super(key: key);
  Tasks tasks = Get.put(Tasks());
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('All Tasks', style: TextStyle(color: Colors.white)),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<Tasks>(
              builder: (controller) => SingleChildScrollView(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.allTask.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[100],
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: forth,
                          child: Text('$index'),
                        ),
                        title: Text(
                          controller.allTask[index]['todo'],
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: controller.allTask[index]['completed']
                            ? const Text(
                                'Status : Completed',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Status : ToDo',
                                style: TextStyle(color: secondary),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    if (counter != 0) {
                      counter -= 10;
                      await tasks.lastPage(counter.toString());
                    } else {
                      return;
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const SizedBox(
                width: 6,
              ),
              GetBuilder<Tasks>(
                builder: (controller) => Text(tasks.pageIndex.toString()),
              ),
              const SizedBox(
                width: 6,
              ),
              IconButton(
                  onPressed: () async {
                    if (counter != 140) {
                      counter += 10;
                      await tasks.nextPage(counter.toString());
                    } else {
                      return;
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          )
        ],
      ),
    );
  }
}
