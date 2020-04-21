import 'package:bulky_sms_app/models/balance.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bulky_sms_app/models/credit_card.dart';
import 'dart:math';

import 'package:bulky_sms_app/models/payment.dart';
import 'package:bulky_sms_app/models/user.dart';

List<charts.Series<Balance, String>> _getSeries(List<String>timeValues,int max){

   Random rnd=Random();
   var incomeData=timeValues.map((value)=>Balance(value,rnd.nextInt(max).toDouble())).toList();
   var expenditureData=timeValues.map((value)=>Balance(value,rnd.nextInt(max).toDouble())).toList();
   return [
     charts.Series<Balance, String>(
       id: 'Income',
       domainFn: (Balance sales, _) => sales.time,
       measureFn: (Balance sales, _) => sales.money,
       data: incomeData,
     ),
     charts.Series<Balance,String>(
       id: "Expenditure",
       domainFn: (Balance balance,_)=>balance.time,
       measureFn: (Balance balance,_)=>balance.money,
       data: expenditureData
     )
   ];
}

List<charts.Series<Balance, String>> getSeries(String key,int index,{int max=1000}) {

    var months=["Jan","Feb","Mar","Apr","May","June","July","Sep","Oct","Nov","Dec"];
    var days=List.generate(24, (index)=>index<9?"0${index+1}":"${index+1}");
    var years=["2017","2018","2019"];
    var hours=List.generate(24, (index)=>"${index+1}hr");
    var mainMap={
      "Year":"Month",
      "Month":"Day",
      "Day":"Hour"
    };
    var subMap={
      "Hour":hours,
      "Day":days,
      "Month":months,
      "Year":years
    };
    var subKey=mainMap[key];
    print("Called");
    return _getSeries(subMap[subKey],max);
}

List<Payment> getPayments() {
    
    List<Payment> payments=[];
    payments.add(Payment("https://images.africanfinancials.com/ke-scom-logo-min.png", "Safaricom", "With You Everywhere", "12 Mar 2019", 400.0, -1));
    payments.add(Payment("https://pbs.twimg.com/profile_images/783660189555814400/sYGR-OjL_400x400.jpg", "Airtel", "Smart Network", "12 Mar 2019", 368.0, -1));
    payments.add(Payment("https://pbs.twimg.com/profile_images/1146325913572974592/14CmDqmR_400x400.png", "Telkom", "Connecting People", "12 Mar 2019", 250.0, -1));
    return payments;
}

List<CreditCard> getCreditCards(){

     List<CreditCard> creditCards=[];
     creditCards.add(CreditCard("4616900007729988",  "Bhavneet Singh", "06/23", "192"));
     creditCards.add(CreditCard("3015788947523652", 
    //  "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
      "John Doe", "04/25", "217"));
     return creditCards;
}

List<User> getUser(){

     List<User>users=[];
     users.add(User("Sunder Pichai","https://www.thefamouspeople.com/profiles/images/sundar-pichai-5.jpg"));
     users.add(User("Sidhu Moosewala","https://cdn-images-1.medium.com/max/500/1*XLkbchlQJFq3YcTKaD_BlQ.jpeg"));
     users.add(User("Bhavneet Singh","https://avatars0.githubusercontent.com/u/31070108?s=460&v=4"));
     return users;
}
List<CreditCard> getCreditCard(){

     List<CreditCard> creditCard=[];
     creditCard.add(CreditCard("Jesseh BenRa",  "Bhavneet Singh", "06/23", "192"));
     return creditCard;
}