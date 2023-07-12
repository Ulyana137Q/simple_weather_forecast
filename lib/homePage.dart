import 'package:flutter/material.dart';
import 'package:weather/upload_weather.dart';

Weather weather = Weather(-273, 'wheatherStatus', 'location', 'time', '/day/143.png');

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String city = 'Ekaterinburg';
    Future<Weather> fweather = Searcher.search(city);
    return FutureBuilder(
        future: fweather,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
                backgroundColor: Colors.blueGrey.shade200,
                body: Center(
                    child:
                      Text(
                        'Load',
                        style: TextStyle(
                            color: Colors.white, fontSize: 40),
                      ),
                    ));
          } else {
            return Scaffold(
              backgroundColor: (weather.icon.contains('day'))
                  ? Colors.white
                  : Colors.blueGrey,
              body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        city,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text(
                        weather.time,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: (weather.icon.contains('day'))
                              ? Colors.blue.shade200
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  'http:' + weather.icon,
                                  width: 150,
                                  scale: 0.2,
                                ),
                                //('weather_icon'+weather.icon, width: 150,),
                                Text(
                                  weather.wheatherStatus,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              weather.temp.round().toString() + '°',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text('')
                    ],
                  )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() => null);
                },
                child: Icon(Icons.update),
                backgroundColor: (weather.icon.contains('day'))
                    ? Colors.blue.shade200
                    : Colors.black12,
              ),
            );
          }
        });
  }
}
