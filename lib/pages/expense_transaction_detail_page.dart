import 'package:budget/models/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseTransactionDetailPage extends StatefulWidget {

  final Expense expense;
  ExpenseTransactionDetailPage({this.expense});

  @override
  _ExpenseTransactionDetailPageState createState() => _ExpenseTransactionDetailPageState();
}

class _ExpenseTransactionDetailPageState extends State<ExpenseTransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.blue[800],
      centerTitle: false,
      leading: IconButton(
        icon: Icon(CupertinoIcons.back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text("Expense"),
      actions: [
        IconButton(icon: Icon(CupertinoIcons.pen), onPressed: () {}),
        IconButton(icon: Icon(CupertinoIcons.delete), onPressed: () {}),
      ],
    );
  }

  get _buildBody {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildExpenseTitleRow,
          _buildPaymentDateRow,
        ],
      ),
    );
  }

  get _buildExpenseTitleRow {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildExpenseTitle,
          _buildExpenseAmount,
        ],
      ),
    );
  }


  get _buildExpenseTitle {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Transaction name", style: TextStyle(color: Colors.grey[800]),),
          Text("${widget.expense.title}", style: TextStyle(fontSize: 24),),
        ],
      ),
    );
  }

  get _buildExpenseAmount {
    return Container(
      child: Text("-${widget.expense.amount} \$", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.red[800]),),
    );
  }

  get _buildPaymentDateRow {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Date", style: TextStyle(color: Colors.grey[800]),),
          Text("${widget.expense.date}", style: TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}
