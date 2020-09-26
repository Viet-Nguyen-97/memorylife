import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:memorylife/ui/menu/tai_khoan.dart';
import 'package:memorylife/ui/menu/nhat_ki.dart';
import 'package:memorylife/ui/menu/lich.dart';
import 'package:memorylife/ui/menu/kho_anh.dart';
import 'package:memorylife/ui/menu/ban_do.dart';

import 'drawer/app_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final _pageOptions = [NhatKi(), Lich(), KhoAnh(), BanDo(), TaiKhoan()];
  Icon searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          new IconButton(
            icon: searchIcon,
            onPressed: (){},
          ),

          new IconButton(
            icon: Icon(Icons.notifications),
            onPressed: (){},
          )
        ],
      ),
      body: _pageOptions[selectedPage],
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AppNavigator.navigateCreateDiary();
        },
        tooltip: 'Thêm nhật kí',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: Colors.blue,
        style: TabStyle.react,
        items: [
          TabItem(icon: Image.asset("assets/note.png", color: selectedPage == 0
              ? Colors.blue
              : Colors.grey,
          ),
              title: 'Nhật kí'),

          TabItem(icon: Image.asset("assets/calendar.png", color: selectedPage == 1
              ? Colors.blue
              : Colors.grey,
          ), title: 'Lịch'),

          TabItem(icon: Image.asset("assets/card_image.png", color: selectedPage == 2
              ? Colors.blue
              : Colors.grey,
          ), title: 'Kho ảnh'),

          TabItem(icon: Image.asset("assets/map.png", color: selectedPage == 3
              ? Colors.blue
              : Colors.grey,
          ), title: 'Bản đồ'),

          TabItem(icon: Image.asset("assets/user.png", color: selectedPage == 4
              ? Colors.blue
              : Colors.grey,
          ), title: 'Tài khoản'),
        ],
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i ){
          setState(() {
            selectedPage = i;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
