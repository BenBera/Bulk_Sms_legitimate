import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bulky_sms_app/models/balance.dart';
import 'package:bulky_sms_app/models/credit_card.dart';
import 'package:bulky_sms_app/models/domain.dart';
import 'package:bulky_sms_app/widgets/credit_card_widget.dart';
import 'package:bulky_sms_app/widgets/drop_widget.dart';
import 'package:bulky_sms_app/widgets/group_bar_chart.dart';
import 'package:bulky_sms_app/resources/database.dart' as db;
import 'package:bulky_sms_app/widgets/history_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bulky_sms_app/widgets/payment_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<String>> timeValues = {
    "Day": ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"],
    "Month": [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "June",
      "July",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ],
    "Year": List.generate(21, (index) => "20${index + 1}").skip(10).toList()
  };
  String mainValue = "Year";
  int subIndex = 0;
  List<charts.Series<Balance, String>> series;
  @override
  void initState() {
    series = db.getSeries(mainValue, subIndex, max: 10);
    super.initState();
    updateData();
  }

  updateData() async {
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        series = db.getSeries(mainValue, subIndex, max: 1000);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        title: Text(
          "Legitmate Technology",
          style: TextStyle(inherit: true, color: Colors.black, ),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
            child: _buildCreditCards()
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropWidget(
              timeValues,
              (mainValue, subIndex) {
                setState(() {
                  if (this.mainValue != mainValue) this.mainValue = mainValue;
                  if (this.subIndex != subIndex) this.subIndex = subIndex;
                  series = db.getSeries(mainValue, subIndex, max: 1000);
                });
              },
              mainValue: mainValue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0, horizontal: 2.0),
            child: GroupedBarChart(
                Domain.getDomain(["SMS Sent","SMS Recieved"],
                    [Color(0xff1274ED), Color(0xffeeeeee)]),
                series),
          ),
          HistoryWidget()
        ],
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

Widget _buildCreditCards() {
  var creditCard = db.getCreditCard();
  return Container(
    height: 250.0,
    margin: EdgeInsets.only(left: 3.0),
    child: ListView.builder(
      itemBuilder: (context, index) {
        CreditCard oneCard = creditCard[index];
        Color color = Colors.red ?? Theme.of(context).primaryColor;

        return Padding(
            padding: const EdgeInsets.all(12.0),
            child: CreditCardWidget(
              oneCard,
              themeColor: color,
            ));
      },
      itemCount: creditCard.length,
      shrinkWrap: true,
    ),
  );
}

