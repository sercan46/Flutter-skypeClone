import 'package:flutter/material.dart';
import 'package:skype_clone/core/init/theme/custom_theme.dart';
import 'package:skype_clone/pages/calls_page.dart';
import 'package:skype_clone/pages/chats_page.dart';
import 'package:skype_clone/pages/notification.dart';
import 'package:skype_clone/pages/persons_page.dart';
import 'package:skype_clone/pages/profile_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: customTheme, home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: changeAppBar(context),
      body: Center(
        child: changeBody(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Sohbetler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Aramalar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_sharp),
              label: 'Kişiler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Bildirimler',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF01a7e7),
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButton: changeFloatingButton(),
    );
  }

  changeBody() {
    if (_selectedIndex == 0) {
      return const ChatPage();
    } else if (_selectedIndex == 1) {
      return const CallPage();
    } else if (_selectedIndex == 2) {
      return const PersonPage();
    } else if (_selectedIndex == 3) {
      return const NotificationPage();
    }
  }

  changeAppBar(BuildContext context) {
    if (_selectedIndex == 0) {
      return AppBar(
          centerTitle: true,
          elevation: 0,
          title: SizedBox(
            width: 45,
            height: 45,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileDetailPage()));
                  },
                  child: const CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage(
                        'https://www.sercanozbek.com/assests/img/benkim.jpg'),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(5), // Image radius
                        child: Container(
                          color: Colors.green,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam_outlined),
              onPressed: () {},
            )
          ]);
    } else if (_selectedIndex == 1) {
      return AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Aramalar'),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add_call),
              onPressed: () {},
            )
          ]);
    } else if (_selectedIndex == 2) {
      return AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Kişiler'),
      );
    } else if (_selectedIndex == 3) {
      return AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Bildirimler'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.videocam_outlined),
              onPressed: () {},
            )
          ]);
    }
  }

  changeFloatingButton() {
    if (_selectedIndex == 0) {
      return FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
          child: const Icon(
            Icons.launch,
            size: 25,
          ),
        ),
        onPressed: () {},
      );
    } else if (_selectedIndex == 1) {
      return FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
          child: const Icon(
            Icons.grid_on,
            size: 25,
          ),
        ),
        onPressed: () {},
      );
    } else if (_selectedIndex == 2) {
      return FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
          child: const Icon(
            Icons.person_add_outlined,
            size: 25,
          ),
        ),
        onPressed: () {},
      );
    }
  }
}
