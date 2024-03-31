import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> items = [
    "Bathroom",
    "Bedroom",
    "Dining",
    "Garage",
    "Kitchen",
    "Laundry",
    "Living",
  ];

  List<IconData> icons = [
    Icons.bathtub,
    Icons.bed,
    Icons.dinner_dining,
    Icons.directions_car,
    Icons.kitchen,
    Icons.local_laundry_service,
    Icons.weekend
  ];

  int current = 0;
  PageController pageController = PageController();
  List<String> roomImages = [
    'lib/assets/Bath.png', // Bathroom image
    'lib/assets/Bedroom.png', // Bedroom image
    'lib/assets/Dining.png', // Dining image
    'lib/assets/Garage.png', // Garage image
    'lib/assets/Kitchen.png', // Kitchen image
    'lib/assets/Laundry.png', // Laundry image
    'lib/assets/Living.png', // Living room image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAED),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF50A65C),
        title: Column(
          children: [
            Text(
              "Hi Sandy!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Welcome to your home",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF232323),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                            pageController.animateToPage(
                              current,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 100,
                            height: 55,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.white70
                                  : Colors.white54,
                              borderRadius: current == index
                                  ? BorderRadius.circular(12)
                                  : BorderRadius.circular(7),
                              border: current == index
                                  ? Border.all(
                                      color: Color(0xFF50A65C), width: 2.5)
                                  : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icons[index],
                                    size: current == index ? 23 : 20,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey.shade400,
                                  ),
                                  Text(
                                    items[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: current == index,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Color(0xFF50A65C),
                                shape: BoxShape.circle),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 550,
              child: PageView.builder(
                itemCount: items.length,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoomImage(
                        roomImages[index],
                        items[index], // Pass room name from the items list
                      ), // Pass room image path
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomImage extends StatelessWidget {
  final String imagePath;
  final String roomName;

  RoomImage(this.imagePath, this.roomName);

  @override
  Widget build(BuildContext context) {
    List<SmartDeviceBox> devices = [];

    // Define devices for each room
    switch (roomName) {
      case 'Bathroom':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Tap",
            iconPath: "lib/assets/icons/water-tap.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Bath tub",
            iconPath: "lib/assets/icons/bathtub.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Bedroom':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Air Conditioner",
            iconPath: "lib/assets/icons/air-conditioner.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Bedside Lamp",
            iconPath: "lib/assets/icons/BedsideLamp.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Alarm Clock",
            iconPath: "lib/assets/icons/alarm.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Dining':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Garage':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Door",
            iconPath: "lib/assets/icons/door.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Kitchen':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Fan",
            iconPath: "lib/assets/icons/fan.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Gas",
            iconPath: "lib/assets/icons/gas.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Laundry':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Tap",
            iconPath: "lib/assets/icons/water-tap.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Washing Machine",
            iconPath: "lib/assets/icons/washing.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      case 'Living':
        devices = [
          SmartDeviceBox(
            smartDeviceName: "Television",
            iconPath: "lib/assets/icons/tv.png",
            powerOn: false,
            onChanged: (value) {},
          ),
          SmartDeviceBox(
            smartDeviceName: "Light",
            iconPath: "lib/assets/icons/light-bulb.png",
            powerOn: false,
            onChanged: (value) {},
          ),
        ];
        break;
      // Define devices for other rooms similarly
      // Add cases for other room names and define corresponding devices
      default:
        devices = [];
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                alignment: Alignment.topCenter,
                child: FractionalTranslation(
                  translation: Offset(0, -0.05),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, bottom: 10.0), // Adjusted padding
                  child: Text(
                    'Device',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, bottom: 1.0), // Adjusted padding
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                  ),
                ),
              ),
            ],
          ),
          // Display devices for the current room
          Column(
            children: devices,
          ),
        ],
      ),
    );
  }
}

class SmartDeviceBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;

  SmartDeviceBox({
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  _SmartDeviceBoxState createState() => _SmartDeviceBoxState();
}

class _SmartDeviceBoxState extends State<SmartDeviceBox> {
  bool _powerOn = false;

  @override
  void initState() {
    super.initState();
    _powerOn = widget.powerOn;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _powerOn = !_powerOn;
          if (widget.onChanged != null) {
            widget.onChanged!(_powerOn);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color:
                _powerOn ? Colors.grey[900] : Color.fromARGB(44, 164, 167, 189),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // icon
                Image.asset(
                  widget.iconPath,
                  height: 65,
                  color: _powerOn ? Colors.white : Colors.grey.shade700,
                ),

                // smart device name + switch
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.smartDeviceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: _powerOn ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 2,
                      child: Container(
                        width: 45.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color:
                              _powerOn ? Colors.green[300] : Colors.grey[300],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: _powerOn ? 20.0 : 0.0,
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _powerOn ? Colors.white : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
