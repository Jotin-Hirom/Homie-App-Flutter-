//main.dart

// import 'package:flutter/material.dart';
// import 'package:iotfirebase/screens/iotscreen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override 
//   Widget build(BuildContext context) {
//     return MaterialApp( 
//       routes: <String, WidgetBuilder>{},
//       title: 'Flutter Demo',
//       theme: ThemeData(brightness: Brightness.dark),
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.dark,
//       home: IotScreen(),
//     );
//   }
// }

//iot.dart

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/services.dart';

// class IotScreen extends StatefulWidget {
//   @override
//   _IotScreenState createState() => _IotScreenState();
// }

// class _IotScreenState extends State<IotScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   final dbRef = FirebaseDatabase.instance.reference();
//   bool value = false;
//   Color color = Colors.grey;

//   onUpdate() {
//     setState(() {
//       value = !value;
//     });
    
// }

//   static final GlobalKey<ScaffoldState> _scaffoldKey =
//       new GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         key: _scaffoldKey,
//         drawer: Drawer(
//             child: new ListView(
//           children: <Widget>[
//             new DrawerHeader(
//               child: new Text("DRAWER HEADER.."),
//               decoration: new BoxDecoration(color: Colors.orange),
//             ),
//             new ListTile(
//               title: new Text("Room 1"),
//               onTap: () {},
//             ),
//             new ListTile(
//               title: new Text("Room 2"),
//               onTap: () {},
//             ),
//           ],
//         )),
//         body: SafeArea(
//           child: StreamBuilder(
//               builder: (context, snapshot) {
//                 if (snapshot.hasData &&
//                     !snapshot.hasError &&
//                     snapshot.data.snapshot.value != null) {
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             GestureDetector(
//                               onTap: () {
//                                 _scaffoldKey.currentState.openDrawer();
//                               },

//                               child: Icon(
//                                 Icons.clear_all,
//                                 color: !value ? Colors.white : Colors.yellow,
//                               ),
//                               // ),
//                             ),
//                             Text("MY ROOM",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold)),

//                             Icon(
//                               Icons.settings,
//                               color: !value ? Colors.white : Colors.yellow,
//                             ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("Temperature",
//                                     style: TextStyle(
//                                         color: !value
//                                             ? Colors.white
//                                             : Colors.yellow,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                     snapshot.data.snapshot.value["Temperature:"]
//                                             .toString() +
//                                         "°C",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("Humidity",
//                                 style: TextStyle(
//                                     color:
//                                         !value ? Colors.white : Colors.yellow,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                                 snapshot.data.snapshot.value["Humidity:"]
//                                         .toString() +
//                                     "%",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 80),
//                       Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: FloatingActionButton.extended(
//                           icon: value
//                               ? Icon(Icons.visibility)
//                               : Icon(Icons.visibility_off),
//                           backgroundColor: value ? Colors.yellow : Colors.white,
//                           label: value ? Text("ON") : Text("OFF"),
//                           elevation: 20.00,
//                           onPressed: () {
//                             onUpdate();
//                             writeData();
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 } else {}
//                 return Container();
//               },
//               stream: dbRef.child("Data").onValue),
//         ),
//       ),
//     );
//   }
//   Future<void> writeData() async {
//     dbRef.child("LightState").set({"switch": !value});
//   }
//   Future<void> readData() async {
//     dbRef.child("Data").once().then((DataSnapshot snapshot) {
//       print(snapshot.value);
//     });
//   }
// }


//arduino.ino
// #include <ESP8266WiFi.h>
// #include <SoftwareSerial.h>
// #include <FirebaseArduino.h>
// #include <ArduinoJson.h>
// #include <ESP8266HTTPClient.h>
// #include<DHT.h>                         
// #define FIREBASE_HOST "YOUR-DATABASE-URL"                          // database URL 
// #define FIREBASE_AUTH "YOUR SECRET-KEY"             // secret key

// #define WIFI_SSID "Wifi-SSID"                                                
// #define WIFI_PASSWORD "Wifi-password"   
// #define DHTPIN 13  //be careful the pin no. on the nodeMcu and arduino ide differ 
// #define DHTTYPE DHT11 //specifying the type of sensor

//   DHT dht(DHTPIN,DHTTYPE);

//   String myString;
//  bool light;
//  unsigned long previousMillis=0;//for adding a timelimit after which the data will be read
//  const long interval=10000;
// void setup()
// {
  
//   pinMode(5,OUTPUT);//specifying D1 as an output pin
//   Serial.begin(115200);
//   delay(500);
//   WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
//   Serial.print("connecting");
//   while (WiFi.status() != WL_CONNECTED)
//       {
//     Serial.print(".");
//     delay(500);
//       }
//   Serial.println();
//   Serial.print("connected: ");
//   Serial.println(WiFi.localIP());
  
//   Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
//   dht.begin();
//    Serial.println("DHT11 Humidity & temperature Sensor\n\n");
//   delay(1000);
// }
//  void readDatas(){

// float h=dht.readHumidity(); 
// float t=dht.readTemperature(); 
// Serial.println(t); 
// Serial.println(h); 
// Firebase.setFloat("Data/Temperature:",t);
// Firebase.setFloat("Data/Humidity:",h);
//      }     
// void loop()
// {
//  light=Firebase.getBool("LightState/switch");
//  Serial.println(light);
//  if(light==true){
//  digitalWrite(5,HIGH);//be careful the pin number on nodeMcu and arduino Ide are not the same eg. The used pin 5 in nodemcu is pin D1 not D5.
//  }
//  if(light==false){
//    digitalWrite(5,LOW);
//  }
//  unsigned long currentMillis=millis();
//  if(currentMillis- previousMillis>=interval){//to avoid reading the data from DHT sensor every second
//  readDatas();
//  previousMillis=currentMillis;
//  }
// }