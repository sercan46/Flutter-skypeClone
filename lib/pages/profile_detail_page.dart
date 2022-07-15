import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Center(child: Text('Oturumu Kapat', style: TextStyle(fontSize: 12)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white12, //                   <--- border color
                width: 1.0,
              )),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 25, // Image radius
                      backgroundImage: NetworkImage(
                          'https://www.sercanozbek.com/assests/img/benkim.jpg'),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Sercan Özbek',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'chesercan@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    subtitle: const Text(
                      'Microsoft hesabım',
                      style: TextStyle(color: Color(0xFF0377D2), fontSize: 12),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(8), // Image radius
                          child: Container(
                            color: Colors.green,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    title: const Text(
                      'Uygun',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(Icons.chevron_right, color: Colors.white),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.mic_sharp,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Neler yaptığınızı paylaşın',
                        style: TextStyle(color: Colors.white30),
                      ),
                      trailing: Icon(Icons.draw, color: Colors.white30),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.markunread_mailbox_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Yer işaretleri',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Arkadaşlarınızı Davet Edin',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.grey[800],
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        '     YÖNET',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Skype profili',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.local_parking_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        '''Skype'tan Telefona''',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Uygun tarifelerle arayın',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.white12,
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      title: Text(
                        '''Ayarlar''',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color:
                          Colors.white12, //                   <--- border color
                      width: 1.0,
                    )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.label_important_rounded,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Yenilikler',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
