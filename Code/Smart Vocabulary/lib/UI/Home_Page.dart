import 'package:flutter/material.dart';
import 'package:dictionary/Utils/Pallet.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  int _currentIndex = 0;

  final Pages = [
    const Dictionary(),
    const Exam(),
    const Statistic(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //////////////////// APP BAR ////////////////////

      appBar: AppBar(
        backgroundColor: Pallet.Purple,
        title: Text("Smart Vocabulary", style: TextStyle(color: Pallet.lightYellow),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings, color: Pallet.lightYellow,),
          )
        ],
      ),

      //////////////////// BODY ////////////////////

      body: Pages[_currentIndex],

      //////////////////// BOTTOM NAVIGATION BAR ////////////////////

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Pallet.Purple,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Pallet.lightYellow,
        unselectedItemColor: Colors.white.withOpacity(0.3),
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            label: 'Dictionaries',
            icon: Icon(Icons.book)
          ),

          BottomNavigationBarItem(
              label: 'Exams',
              icon: Icon(Icons.collections_bookmark)
          ),

          BottomNavigationBarItem(
              label: 'Statistics',
              icon: Icon(Icons.score)
          )
        ],
      ),

    );
  }
}

class Dictionary extends StatelessWidget {

  const Dictionary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Exam extends StatelessWidget {

  const Exam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Statistic extends StatelessWidget {

  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}