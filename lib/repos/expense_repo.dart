import 'package:http/http.dart' as http;
import 'package:budget/models/expense_model.dart';
import 'package:flutter/foundation.dart';

Future<ExpenseModel> readExpenseData() async{
  String url = "http://localhost:8888/BUDGET%20APP/read_expense_data.php";
  http.Response response = await http.get(url);

  if(response.statusCode == 200) {
    return compute(expenseModelFromJson, response.body);
  }
  else{
    throw Exception("Exception while reading data!");
  }
}

Future<String> insertExpenseData(Expense expense) async{
  String url = "http://localhost:8888/BUDGET%20APP/insert_expense_data.php";
  http.Response response = await http.post(url, body: expense.toJson());

  if(response.statusCode == 200) {
    return response.body;
  }
  else{
    throw Exception("Exception while sending data!");
  }
}

Future<String> updateExpenseData(Expense expense) async{
  String url = "http://localhost:8888/BUDGET%20APP/updata_expense_data.php";
  http.Response response = await http.post(url, body: expense.toJson());

  if(response.statusCode == 200) {
    return response.body;
  }
  else{
    throw Exception("Exception while updating data!");
  }
}

Future<String> deleteExpenseData(Expense expense) async{
  String url = "http://localhost:8888/BUDGET%20APP/delete_expense_data.php";
  http.Response response = await http.post(url, body: expense.toJson());

  if(response.statusCode == 200) {
    return response.body;
  }
  else{
    throw Exception("Exception while deleting data!");
  }
}