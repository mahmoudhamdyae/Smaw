import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smaw/features/home/presentation/screens/home_screen.dart';

import 'core/app/app_preferences.dart';
import 'core/di/di.dart';
import 'core/resources/language_manager.dart';
import 'main_screen.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  @override
  void initState() {
    super.initState();
    setState(() {
      _locale = instance.get<AppPreferences>().getAppLanguage()
          == english ? englishLocal : arabicLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [englishLocal, arabicLocal],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: _locale,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      title: 'Smaw',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BallInHoleNavBar(),
    );
  }
}


class BallInHoleNavBar extends StatefulWidget {
  @override
  State<BallInHoleNavBar> createState() => _BallInHoleNavBarState();
}

class _BallInHoleNavBarState extends State<BallInHoleNavBar> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        elevation: 4,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Icon(Icons.compare_arrows, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTabIcon(Icons.add, 0),
                  SizedBox(width: 24),
                  _buildTabIcon(Icons.list, 1),
                ],
              ),
              Row(
                children: [
                  _buildTabIcon(Icons.alt_route, 3),
                  SizedBox(width: 24),
                  _buildTabIcon(Icons.person_outline, 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon,
          color: _currentIndex == index ? Colors.blue : Colors.grey[700]),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}




// class CustomBottomNav extends StatefulWidget {
//   @override
//   _CustomBottomNavState createState() => _CustomBottomNavState();
// }
//
// class _CustomBottomNavState extends State<CustomBottomNav> {
//   int _selectedIndex = 1;
//
//   final List<Widget> _pages = [
//     Center(child: Text('Home', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Heart / Action', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: ConvexAppBar.builder(
//         style: TabStyle.fixedCircle,
//         backgroundColor: Color(0xFF7E3FF2),
//         color: Colors.white,
//         activeColor: Colors.white,
//         initialActiveIndex: _selectedIndex,
//         itemBuilder: CustomCircleBuilder(), // 👈 Custom middle button builder
//         count: 3,
//         onTap: (int i) => setState(() => _selectedIndex = i),
//       ),
//     );
//   }
// }

class CustomCircleBuilder extends DelegateBuilder {
  @override
  Widget build(BuildContext context, int index, bool active) {
    if (index == 1) {
      // Center Button
      return Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: Icon(Icons.favorite,
              size: 32, color: Color(0xFF7E3FF2)), // Inner icon color
        ),
      );
    }

    // Left and right buttons
    IconData icon;
    String label;
    if (index == 0) {
      icon = Icons.home;
      label = 'Home';
    } else {
      icon = Icons.settings;
      label = 'Settings';
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26, color: active ? Colors.white : Colors.white70),
        SizedBox(height: 4),
        Text(label,
            style: TextStyle(
              color: active ? Colors.white : Colors.white70,
              fontSize: 12,
            ))
      ],
    );
  }
}











class FancyBottomBar extends StatefulWidget {
  @override
  _FancyBottomBarState createState() => _FancyBottomBarState();
}

class _FancyBottomBarState extends State<FancyBottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Page 1")),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
    Center(child: Text("Page 4")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: true, // Allows FAB overlap
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.circle, color: Colors.blue),
        onPressed: () {
          // Center button action
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 70,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 70),
              painter: BNBCustomPainter(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.menu,
                      color: selectedIndex == 0 ? Colors.blue : Colors.grey),
                  onPressed: () => onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.access_time,
                      color: selectedIndex == 1 ? Colors.blue : Colors.grey),
                  onPressed: () => onItemTapped(1),
                ),
                SizedBox(width: 50), // gap for center FAB
                IconButton(
                  icon: Icon(Icons.home,
                      color: selectedIndex == 2 ? Colors.blue : Colors.grey),
                  onPressed: () => onItemTapped(2),
                ),
                IconButton(
                  icon: Icon(Icons.share,
                      color: selectedIndex == 3 ? Colors.blue : Colors.grey),
                  onPressed: () => onItemTapped(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}













class CustomBottomBarExample extends StatefulWidget {
  @override
  State<CustomBottomBarExample> createState() => _CustomBottomBarExampleState();
}

class _CustomBottomBarExampleState extends State<CustomBottomBarExample> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    Center(child: Text("Home")),
    Center(child: Text("Heart / Action")),
    Center(child: Text("Settings")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1);
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.favorite, color: Colors.white),
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.purple,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex == 1 ? 0 : _selectedIndex,
          onTap: (int index) {
            if (index == 0) {
              _onItemTapped(0);
            } else if (index == 1) {
              _onItemTapped(2);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
    );
  }
}
