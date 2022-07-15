import 'package:flutter/material.dart';
import 'package:skype_clone/core/mock_data/message_list.dart';

class ChatDetailPage extends StatefulWidget {
  final String imageUrl;
  final String userName;
  const ChatDetailPage(
      {Key? key, required this.imageUrl, required this.userName})
      : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final MessageListData _messageListData = MessageListData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            radius: 20, // Image radius
            backgroundImage: NetworkImage(
              widget.imageUrl,
            ),
          ),
          title: Text(
            widget.userName,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Row(
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(5), // Image radius
                  child: Container(
                    color: Colors.green,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Şimdi etkin",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
            child: const Icon(
              Icons.videocam_outlined,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
            child: const Icon(
              Icons.call,
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              reverse: false,
              itemCount: _messageListData.messageList.length,
              itemBuilder: ((context, index) {
                return Container(
                  width: size.width,
                  alignment: _messageListData.messageList[index]['isOther']
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: SizedBox(
                    width: size.width / 1.3,
                    child: ListTile(
                      leading:
                          _messageListData.messageList[index]['isOther'] == true
                              ? CircleAvatar(
                                  radius: 20, // Image radius
                                  backgroundImage: NetworkImage(
                                    _messageListData.messageList[index]
                                        ['profile_image'],
                                  ),
                                )
                              : const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                      title: _messageListData.messageList[index]['isOther'] ==
                              true
                          ? Text(
                              _messageListData.messageList[index]['name'] +
                                  ', ' +
                                  _messageListData.messageList[index]['time'],
                              style:
                                  const TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          : const SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      subtitle: Card(
                        color: _messageListData.messageList[index]['isOther']
                            ? const Color(0xFF282f35)
                            : const Color(0xFF2b2b2b),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  _messageListData.messageList[index]
                                      ['message'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xFF00a8e9), Color(0xFF0288d9)])),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xFF9c9da2)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF2b2b33),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    suffixIcon: const Icon(
                      Icons.emoji_emotions,
                      color: Color(0xFF9c9da2),
                    ),
                    hintText: "Mesaj yazın",
                    hintStyle: const TextStyle(color: Color(0xFF9c9da2)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 32.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 32.0),
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 70,
                child: Row(children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.mic_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.white,
                  )
                ]),
              ),
              const SizedBox(
                width: 15,
              ),
              // Send Button
            ],
          ),
        ),
      ),
    );
  }
}
