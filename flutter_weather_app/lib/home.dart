import 'package:flutter/material.dart';
import 'package:flutter_weather_app/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
              builder: (context,themeProvider,child){
                return Switch(
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  thumbColor: const MaterialStatePropertyAll(Colors.orange),
                  inactiveTrackColor: Colors.transparent,
                  thumbIcon: MaterialStatePropertyAll(
                    themeProvider.isSelected ? const Icon(Icons.nights_stay) :const Icon(Icons.sunny),
                  ),
                  value: themeProvider.isSelected,
                  onChanged: (value){
                    themeProvider.toggleTheme();


                  },
                );
              },
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10) ,
        child: Center(
          child: Column(
            children: [
              Text('Paris',
                style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 30,),
              Consumer<ThemeProvider>(
                builder: (context,themeProvider,child){
                  return Icon(
                    themeProvider.isSelected ? Icons.nights_stay : Icons.sunny,
                    size: 250,
                    color: themeProvider.isSelected ? Colors.white : Colors.orange,
                  );
                },
              ),
              SizedBox(height: 30,),
              Text('20º c',
                style: TextStyle(
                    fontSize: 30,
                ),
              ),
              Text('Good morning',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500
                ),
              ),
              Text('NOIDA',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                width: 50,
                child: Divider(
                  thickness: 3,
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_twighlight),
                      Text('SUNRISE'),
                      Text('7:00')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.air),
                      Text('Wind'),
                      Text('7:00')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text('Temperature'),
                      Text('23')
                    ],
                  )
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
