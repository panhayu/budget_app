// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) => ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {
  ExpenseModel({
    this.expenses,
  });

  List<Expense> expenses;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    expenses: List<Expense>.from(json["expenses"].map((x) => Expense.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
  };
}

class Expense {
  Expense({
    this.id,
    this.title,
    this.note,
    this.amount,
    this.date,
  });

  String id;
  String title;
  String note;
  String amount;
  String date;

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    id: json["id"],
    title: json["title"],
    note: json["note"],
    amount: json["amount"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "note": note,
    "amount": amount,
    "date": date,
  };
}
