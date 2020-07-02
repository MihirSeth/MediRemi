//bottom: PreferredSize(
//          preferredSize: Size(double.infinity, 68),
//    child: Padding(
//            padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
//            child: DateIndicator(
//                indicatorColor: Colors.white,
//                activeBubbleColor: Colors.white,
//                numberColor: Colors.white,
//                holderColor: Colors.teal,
//                textColor: Colors.black,
//                selectedBorderColor: Colors.white70,
//                indicatorShadowColor: Colors.white,
//                onHolderTap: (int day) =>
//                    Navigator.push(
//                        context, MaterialPageRoute(builder: (context) => Medicine()))
//            )
//            ),
//          ),



//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//
//ListView(
//children: [
//Column(
//children: <Widget>[
//Container(
//padding: EdgeInsets.only(left: 15, right:185, top: 20),
//child: Text(
//"Your Medicines:",
//style: TextStyle(
//fontSize: 25,
//fontWeight: FontWeight.bold,
//),
//),
//),
//Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding:  EdgeInsets.only(top:300),
//child: Container(
//alignment: Alignment.bottomCenter,
//height: 60,
//width: 250,
//child: Material(
//borderRadius: BorderRadius.circular(1000),
//shadowColor: Colors.tealAccent,
//color: Colors.teal,
//elevation: 7.0,
//child: FlatButton(
//onPressed: () {
//Navigator.push(
//context, MaterialPageRoute(builder: (context) => AddMedicine()));
//},
//child: Center(
//child: Text(
//"Add a Med",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontFamily: "Monster",
//fontSize: 20.0,
//
//),
//),
//)
//),
//),
//),
//),
//
//
//],
//),
//
//],
//),
//],
//),

//ScrollingDayCalendar(
//startDate: startDate,
//endDate: endDate,
//selectedDate: selectedDate,
//onDateChange: (direction, DateTime selectedDate) {
//setState(() {
//pageItems = widgetBuilder(selectedDate);
//});
//},
//dateStyle: TextStyle(
//fontWeight: FontWeight.bold,
//color: Colors.white,
//),
//displayDateFormat: "dd MMM, yyyy",
//dateBackgroundColor: Colors.grey,
//forwardIcon: Icons.arrow_forward,
//backwardIcon: Icons.arrow_back,
//pageChangeDuration: Duration(
//milliseconds: 200,
//),
//pageItems: pageItems,
//widgets: widgets,
//widgetKeyFormat: widgetKeyFormat,
//noItemsWidget: Center(
//child: Padding(
//padding: EdgeInsets.only(bottom: 30),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Container(
//alignment: Alignment.bottomCenter,
//height: 60,
//width: 250,
//child: Material(
//borderRadius: BorderRadius.circular(1000),
//shadowColor: Colors.tealAccent,
//color: Colors.teal,
//elevation: 7.0,
//child: FlatButton(
//onPressed: () {
//Navigator.push(
//context, MaterialPageRoute(builder: (context) => AddMedicine()));
//},
//child: Center(
//child: Text(
//"Add a Med",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontFamily: "Monster",
//fontSize: 20.0,
//
//),
//),
//)
//),
//),
//),
//
//],
//),
//),
//)
//
//),














//
//Container(
//child: Column(
//children: <Widget>[
//Column(
//children: <Widget>[
//Padding(
//padding: EdgeInsets.only(right: 320),
//child:
//Text(
//"Time",
//style: TextStyle(
//color: Colors.teal,
//fontSize: 15.0,
//fontWeight: FontWeight.bold,
//)
//),
//),
//Container(
//padding: EdgeInsets.only(top:0, left: 25, right: 25),
//child: Row(
//children: <Widget>[
//Expanded(
//flex: 2,
//child: Padding(
//padding: EdgeInsets.only(bottom: 17, ),
//child: TextFormField(
//validator: (input) {
//if (input.isEmpty) {
//return 'Please type the Time';
//}
//},
//onSaved: (input) => _startingTime = input,
//decoration: InputDecoration(
//hintText: "Time (Hours:Minutes)",
//hintStyle: TextStyle(
//fontFamily: "Monster",
//fontWeight: FontWeight.bold,
//color: Colors.grey,
//),
//focusedBorder: UnderlineInputBorder(
//borderSide: BorderSide(color: Colors.teal),),
//
//)
//),
//),
//),
//SizedBox(
//width: 20.0,
//),
//Expanded(
//flex: 1,
//child: Padding(
//padding: EdgeInsets.only(top: 0, left: 0),
//child: DropdownButton<String>(
//underline: Container(
//height: 2,
//color: Colors.teal,
//),
//hint: Text('AM/PM?'),
//value: _startingTimeType,
//items: [
//DropdownMenuItem<String>(
//child:Text('AM', style: TextStyle(color: Colors.blueGrey),
//),
//value: 'One'
//),
//DropdownMenuItem<String>(
//child:Text('PM', style: TextStyle(color: Colors.blueGrey ),
//),
//value: 'Two'
//),
//],
//onChanged: (String newValue) {
//setState(() {
//_startingTimeType = newValue;
//});
//},
//),
//),
//),
//],
//
//),
//)
//
//],
//),
//],
//)
//),