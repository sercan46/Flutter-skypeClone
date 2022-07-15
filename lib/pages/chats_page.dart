import 'package:flutter/material.dart';
import 'package:skype_clone/core/mock_data/chat_list.dart';
import 'package:skype_clone/pages/chat_detail_page.dart';
import 'package:skype_clone/widgets/custom_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 3,
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2b2b33),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.filter_list_rounded,
                        color: Color(0xFF9c9da2),
                      )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 7,
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
                            backgroundImage: NetworkImage(
                                _chatListData.chatList[index]['profile_image']),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size:
                                      const Size.fromRadius(5), // Image radius
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatDetailPage(
                                    imageUrl: _chatListData.chatList[index]
                                        ['profile_image'],
                                    userName: _chatListData.chatList[index]
                                        ['name'],
                                  )));
                    },
                    title: Text(
                      _chatListData.chatList[index]['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      _chatListData.chatList[index]['last_message'],
                      style: const TextStyle(color: Color(0xFF8c8b8f)),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            _chatListData.chatList[index]['time'],
                            style: const TextStyle(
                                color: Color(0xFF8c8b8f), fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
