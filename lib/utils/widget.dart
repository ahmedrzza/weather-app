import 'package:flutter/material.dart';

Widget currentWeather(
    {required var temp,
    required String location,
    required minimuntemp,
    required maximuntemp,
    required height,
    required weight}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: weight,
          child: Image.asset(
            'assets/sun.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$location',
          style: const TextStyle(fontSize: 46, color: Color(0xff5a5a5a)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$temp',
          style: const TextStyle(
            fontSize: 46,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Minimum Temperature is  $minimuntemp',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        Text(
          'Maximum Temperature is  $maximuntemp',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}

TextStyle title = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);
TextStyle infofont = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
);
Widget addionalInformation(
    {required var windtext,
    required var wind,
    required var pressuretext,
    required var pressure,
    required var humiditytext,
    required var humidity,
    required var feeliketext,
    required var feelslike}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(windtext, style: title),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  pressuretext,
                  style: title,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infofont,
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$pressure",
                  style: infofont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(humiditytext, style: title),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  feeliketext,
                  style: title,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$humidity", style: infofont),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$feelslike",
                  style: infofont,
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

containerWidget(context, {required title, required data}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.12,
    width: MediaQuery.of(context).size.width * 0.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent[400],
      border: Border.all(
        color: Colors.black54,
        width: 2.0,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.1,
          child: Image.asset('assets/176.png'),
        ),
        Text(data)
      ],
    ),
  );
}
