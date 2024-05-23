import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tasks extends GetxController {
  List res = [];
  List allTask = [];
  var pageIndex =1;
  Future getAllTasks(int userId) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/todos'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> todos = jsonData['todos'];
      todos.where((todo) => todo['userId'] == userId).forEach((todo) {
        res.add(todo);
      });
      update();
    } else {
      throw Exception('Failed to load Task');
    }
  }

  addTask({required String taskText, required int userId}) async {
    final response =
        await http.post(Uri.parse('https://dummyjson.com/todos/add'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'todo': taskText,
              'completed': false,
              'userId': userId,
            }));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      Map<String, dynamic> newItem = result;
      res.add(newItem);
      update();
    } else {
      return;
    }
  }

  updateTask(String taskId, String newTaskValue, int index) async {
    final response =
        await http.put(Uri.parse('https://dummyjson.com/todos/$taskId'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'todo': newTaskValue,
            }));
    if (response.statusCode == 200) {
      res[index]['todo'] = newTaskValue;
      update();
    } else {
      return;
    }
  }

  doneTask(String taskId, int index) async {
    final response =
        await http.put(Uri.parse('https://dummyjson.com/todos/$taskId'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'completed': true,
            }));
    if (response.statusCode == 200) {
      res[index]['completed'] = true;
      update();
    } else {
      return;
    }
  }

  deleteTask(int taskId) async {
    final response =
        await http.delete(Uri.parse('https://dummyjson.com/todos/$taskId'));
    if (response.statusCode == 200) {
      res.removeWhere((item) => item['id'] == taskId);
      update();
    } else {
      return;
    }
  }

  fetchAllTask(String skipCount) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/todos?limit=10&skip=$skipCount'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      allTask = jsonData['todos'];
      print(allTask);
      update();
    } else {
      throw Exception('Failed to load Task');
    }
  }

  nextPage(String skipCount) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/todos?limit=10&skip=$skipCount'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      allTask = jsonData['todos'];
      pageIndex+=1;
      print(pageIndex);
      print(allTask);
      update();
    } else {
      throw Exception('Failed to load Task');
    }
  }

  lastPage(String skipCount) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/todos?limit=10&skip=$skipCount'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      allTask = jsonData['todos'];
      pageIndex-=1;
      print(pageIndex);
      print(allTask);
      update();
    } else {
      throw Exception('Failed to load Task');
    }
  }


}

//          'username': 'kminchelle',
//           'password': '0lelplR',
