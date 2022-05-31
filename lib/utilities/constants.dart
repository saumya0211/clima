import 'package:flutter/material.dart';

const KIntroStyle = TextStyle(decoration: TextDecoration.none ,fontWeight: FontWeight.w600,fontFamily: 'Pacifico-Regular');

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  color: Colors.white70,
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 45.0,
  color: Colors.black87,
  backgroundColor: Colors.white24,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Color(0xFF9F8170),
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Color(0xFF9F8170),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
