import 'package:bulky_sms_app/screens/recomended_page.dart';
import 'package:flutter/material.dart';
import 'package:bulky_sms_app/widgets/payment_widget.dart';
import 'package:bulky_sms_app/resources/database.dart' as db;

class HistoryWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(color: Colors.white,height: 22.0,),
            Container(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),child: Text("SMS SENT",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600),),decoration:BoxDecoration(borderRadius:BorderRadius.circular(50.0) ,color: Colors.black87,) )
          ],
        ),
        Container(
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (context,index){
              return GestureDetector(
                child: PaymentWidget(db.getPayments()[index]),
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RecomendedPage())),
                
                );
            },
            itemCount: db.getPayments().length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
          ),
        ),
      ],
    );
  }
  
}