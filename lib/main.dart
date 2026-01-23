import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'lift_page.dart';
import 'routine_page.dart';
import 'test_list.dart';
import 'lift.dart';

void main() {
  runApp(const IronSights());
}

class IronSights extends StatelessWidget {
  const IronSights({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IronState(),
      child: MaterialApp(
        title: 'IronSights',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomePage(),
      )
    );
  }
}

class IronState extends ChangeNotifier {
  List<Lift> liftItems = createList();

  void addLift(Lift newLift) {
    liftItems.add(newLift);
    notifyListeners();
  }

  void editLift(Lift editLift) {
    liftItems[liftItems.indexWhere((lift) => lift.id == editLift.id)] = editLift;
    notifyListeners();
  }

  int getNewestId() {
    List<Lift> liftCopy = liftItems;
    if(liftCopy.isNotEmpty) {
      liftCopy.sort((a, b) => a.getId().compareTo(b.getId()));
      return liftCopy.last.getId() + 1;
    }
    else {
      return 1;
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomepageWidget(),
    RoutinepageWidget(),
    LiftPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IronSights'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          onTabTapped(index);
        },
        selectedIndex: _currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Routines',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center),
            icon: Icon(Icons.fitness_center_outlined),
            label: 'Lifts'
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
