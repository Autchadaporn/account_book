import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';

import 'package:savemoney2/pages/logout.dart';

import 'saveMoney.dart';
import 'statement.dart';
import 'total.dart';


class homepage extends StatefulWidget {
  @override
  _homepage createState() => _homepage();
}

class _homepage extends State<homepage> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    saveMoney(),
    statement(),
    total(),
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    }); //ทำให้ icon ข้างล่างเปลี่ยนสีตาม
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

        onTap: _onItemTapped,
        // backgroundColor: Color(0Xfffdebd3),
        iconSize: 30,
        items:[
          BottomNavigationBarItem(
            
            icon: Icon(
              Icons.note_add ,
              color: _selectedIndex ==0 ? Color(0Xff679186): Colors.grey ,
            ),
            
            title:Text("Add Account",
            style: TextStyle (
              color: _selectedIndex ==0 ? Color(0Xff679186): Colors.grey ,
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.featured_play_list,
              color: _selectedIndex ==1 ? Color(0Xff264e70): Colors.grey ,
            ),
            
            title:Text("Account Book",
            style: TextStyle (
              color: _selectedIndex ==1 ? Color(0Xff264e70): Colors.grey ,
            ),),
            
          ),
          // BottomNavigationBarItem(
            
          //   icon: Icon(
          //     Icons.account_circle,
          //     color: _selectedIndex ==2 ? Color(0Xff4e1b3c): Colors.grey ,
          //   ),
          //   title:Text("Me",
          //   style: TextStyle (
          //     color: _selectedIndex ==2 ? Color(0Xff4e1b3c): Colors.grey ,
              
          //   ),
          //   ),
            
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.home,
          //     color: _selectedIndex ==3 ? Colors.red: Colors.grey ,
          //   ),
          //   title:Text("home",
          //   style: TextStyle (
          //     color: _selectedIndex ==3 ? Colors.red: Colors.grey ,
          //   ),),
          // ),

        ],
      ),
    );
  }
}

