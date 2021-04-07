import 'package:budget/pages/edit_transaction_page.dart';
import 'package:budget/pages/expense_transaction_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:budget/models/expense_model.dart';
import 'package:budget/pages/add_transaction_page.dart';
import 'package:budget/repos/expense_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  Future<ExpenseModel> _expenseData;
  List<Expense> _expenses;

  @override
  void initState() {
    super.initState();
    _expenseData = readExpenseData();
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMessage(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildButtonNavigationBar,
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.blue[800],
      centerTitle: false,
      leading: Icon(Icons.arrow_back_ios),
      title: Text("Expense Overview"),
    );
  }

  get _buildBody {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        color: Colors.grey[100],
        child: _buildParentListView,
      ),
    );
  }

  get _buildParentListView {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _expenseData = readExpenseData();
        });
      },
      child: ListView(
        children: [
          _buildTotalCard,
          _buildLastTransactionTitle,
          _buildLastTransaction,
        ],
      ),
    );
  }

  get _buildTotalCard {
    return Container(
      width: 500,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: _buildTotalCardDetail,
    );
  }

  get _buildTotalCardDetail {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total Expense",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "-254 \$ ",
              style: TextStyle(
                  fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  get _buildLastTransactionTitle {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        "Last Transaction",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800]),
      ),
    );
  }

  get _buildLastTransaction {
    return FutureBuilder<ExpenseModel>(
      future: _expenseData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("snapshot.error: ${snapshot.error}");
          return Text(snapshot.error);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          _expenses = snapshot.data.expenses;
          return _buildLastTransactionList;
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  get _buildLastTransactionList {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: _expenses.length,
      itemBuilder: (context, index) {
        return _buildItem(_expenses[index]);
      },
    );
  }

  _buildItem(Expense item) {
    DateTime _dataDate = DateTime.parse(item.date);
    String _day = DateFormat.d().format(_dataDate);
    String _month = DateFormat.MMM().format(_dataDate);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageTransition(child: ExpenseTransactionDetailPage(expense: item), type: PageTransitionType.rightToLeft));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: [
            IconSlideAction(
              icon: CupertinoIcons.pen,
              color: Colors.blue[800],
              caption: "Edit",
              onTap: () {
                Navigator.of(context).push(PageTransition(child: EditExpenseDataPage(expense: item), type: PageTransitionType.rightToLeft)).then((value) {
                  setState(() {
                    _expenseData = readExpenseData();
                  });
                });
              },
            ),
            IconSlideAction(
              icon: CupertinoIcons.delete,
              color: Colors.red[800],
              caption: "Delete",
              onTap: () {
                deleteExpenseData(item).then((value) {
                  print("value: $value");
                  if (value == "deleted") {
                    _showMessage("Expense data deleted.");
                    setState(() {
                      _expenses.remove(item);
                    });
                  } else {
                    _showMessage("Something went wrong while deleting expense data! Please try again.");
                  }
                });
              },
            ),
          ],
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Column(
                children: [
                  Text("$_day", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Text("$_month", style: TextStyle(fontSize: 18),),
                ],
              ),
              trailing: Text("${item.amount} \$", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red[800]),),
              title: Text("${item.title}", style: TextStyle(fontSize: 18, color: Colors.blue[800])),
              subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${item.note}"),
                    // Text("${item.date}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get _buildButtonNavigationBar {
    return BottomAppBar(
      color: Colors.blue[800],
      child: SizedBox(
        height: 58,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(CupertinoIcons.chart_bar_square),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  print("Home button clicked!");
                }),
            IconButton(
                icon: Icon(CupertinoIcons.plus),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddTransactionPage()));
                }),
            IconButton(
                icon: Icon(CupertinoIcons.person),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  print("Account button clicked!");
                }),
          ],
        ),
      ),
    );
  }
}
