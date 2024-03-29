import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _hiderWidget(),
        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRatings()
                ],
              ),
            )),
      ],
    ),
  );
}

Image _hiderWidget() {
  return Image(
    image: NetworkImage(
        'https://flytothesky.ru/wp-content/uploads/2019/04/10-16.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Monday - July 18",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pulvinar purus nec nulla condimentum egestas eu sed nulla. Fusce ut suscipit sem.",
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(width: 16,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('17°C Clear', style: TextStyle(color: Colors.deepPurple),)
            ],
          ),
          Row(
            children: [
              Text(
                'Krasnodar Krai, Sochi', style: TextStyle(color: Colors.grey),)
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children:
    List.generate(8, (int index) {
      return Chip(
        label: Text("${index + 25}°C", style: TextStyle(fontSize: 15),),
        avatar: Icon(Icons.cloud, color: Colors.blue.shade300,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.grey)
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings(){
  var _stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.black,),
      Icon(Icons.star, size: 15, color: Colors.black,),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("info with openweathermap.org", style: TextStyle(fontSize: 15),),
      _stars
    ],
  );
}