import 'package:flutter/material.dart';
import 'package:skype_clone/core/mock_data/chat_list.dart';
import 'package:skype_clone/widgets/custom_text_field.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final ChatListData _chatListData = ChatListData();
  final CustomTextField _customTextField = CustomTextField();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 18, child: _customTextField.returnCustom()),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ListTile(
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF4DBD59),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ücretsiz \ndeneme',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(children: [
                    const Icon(
                      Icons.language,
                      size: 55,
                      color: Color(0xFF0377D2),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(14), // Image radius
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(
                                        0xFFE89D4C), //                   <--- border color
                                    width: 4.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 20,
                              height: 20,
                              child: const Center(
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                      color: Color(0xFFE89D4C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ))
                  ]),
                ),
                title: const Text(
                  '''Skype'tan Telefona''',
                  style: TextStyle(color: Color(0xFF8c8b8f), fontSize: 13),
                ),
                subtitle: const Text(
                    '''Uygun tarifelerle telefon numaralarını arayın''',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              )),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                itemCount: _chatListData.chatList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 45,
                        height: 45,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 48, // Image radius
                              backgroundImage: NetworkImage(_chatListData
                                  .chatList[index]['profile_image']),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(5), // Image radius
                                    child: Container(
                                      color: Colors.orange,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      title: Text(
                        _chatListData.chatList[index]['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.phone_callback_outlined,
                            color: Color(0xFF8c8b8f),
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            _chatListData.chatList[index]['time'],
                            style: const TextStyle(color: Color(0xFF8c8b8f)),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 98,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.videocam_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
