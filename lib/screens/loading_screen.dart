import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Future.delayed(Duration(seconds: 7,milliseconds: 45),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData,)));
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
      Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('images/1.2.jpg'),
         fit: BoxFit.cover,
         colorFilter: ColorFilter.mode(
           Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
      ),
      constraints: BoxConstraints.expand(),),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(child: Image.asset('images/clima icon.png'),radius: 50,backgroundColor: Colors.transparent,),
                SizedBox(
                  height:70,
                  child: AnimatedTextKit(
                    repeatForever: true,
                  animatedTexts: [
                  RotateAnimatedText('Clima',transitionHeight: 100,textStyle: KIntroStyle.copyWith(color: Colors.white70)),
                  RotateAnimatedText('Instant',transitionHeight: 100,textStyle: KIntroStyle.copyWith(color: Colors.white70)),
                  RotateAnimatedText('WEATHER APP',transitionHeight: 100,textStyle: KIntroStyle.copyWith(fontSize: 15,color: Colors.white70 )),
      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
