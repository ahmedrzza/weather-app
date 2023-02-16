
import 'package:flutter/material.dart';
import 'package:weather_app_api/Model/Model.dart';
import 'package:weather_app_api/controller/controller.dart';
import 'package:weather_app_api/utils/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme:const IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        primary: true,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          //Data Come Form API
          Expanded(
            child: FutureBuilder<ClassApi>(
                future: getApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SafeArea(
                      child: ListView(
                        children: [
                          currentWeather(
                            temp: "${snapshot.data!.main!.temp.toString()}°C",
                            location: snapshot.data!.name.toString(),
                            minimuntemp:
                                "${snapshot.data!.main!.tempMin.toString()}°C",
                            maximuntemp:
                                "${snapshot.data!.main!.tempMax.toString()}°C",
                            height: MediaQuery.of(context).size.height * 0.2,
                            weight: MediaQuery.of(context).size.height * 0.2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Addional Information',
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(
                                  0xdd212121,
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          addionalInformation(
                            windtext: "Visibility",
                            wind: snapshot.data!.visibility.toString(),
                            pressuretext: 'Pressure',
                            pressure: snapshot.data!.main!.pressure.toString(),
                            humiditytext: 'Humidity',
                            humidity: snapshot.data!.main!.humidity.toString(),
                            feeliketext: "FeelsLike",
                            feelslike:
                                snapshot.data!.main!.feelsLike.toString(),
                          ),
                          addionalInformation(
                            windtext: "Longitude", //logitude
                            wind: snapshot.data!.coord!.lon
                                .toString(), //logitude information
                            pressuretext: "Latitude", //Latitude
                            pressure: snapshot.data!.coord!.lat
                                .toString(), //latitude information
                            humiditytext: "Timezone", //timezone
                            humidity: snapshot.data!.timezone
                                .toString(), //timezone data
                            feeliketext: "ID",
                            feelslike: snapshot.data!.id.toString(), //id data
                          ),
                          Center(
                            child: Text(
                              'Weather Detail',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(
                                  0xdd212121,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                containerWidget(
                                  context,
                                  title: 'ID',
                                  data:
                                      snapshot.data!.weather![0].id.toString(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                containerWidget(
                                  context,
                                  title: 'Main',
                                  data: snapshot.data!.weather![0].main
                                      .toString(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                containerWidget(
                                  context,
                                  title: "Discription",
                                  data: snapshot.data!.weather![0].description
                                      .toString(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                containerWidget(
                                  context,
                                  title: 'Icon',
                                  data: snapshot.data!.weather![0].icon
                                      .toString(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Base"),
                                          Image.asset('assets/download.jpg'),
                                          Text(snapshot.data!.base.toString())
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Text('Sys'),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Type"),
                                              Text(snapshot.data!.sys!.type
                                                  .toString()),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("ID"),
                                              Text(
                                                snapshot.data!.sys!.id
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Country"),
                                              Text(snapshot.data!.sys!.country
                                                  .toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Wind'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Speed '),
                                              Text(snapshot.data!.wind!.speed
                                                  .toString()),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Deg'),
                                              Text(snapshot.data!.wind!.deg
                                                  .toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Clouds'),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("All"),
                                              Text(snapshot.data!.clouds!.all
                                                  .toString()),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("DT"),
                                              Text(
                                                snapshot.data!.dt.toString(),
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
