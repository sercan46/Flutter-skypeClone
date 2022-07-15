import 'package:flutter/material.dart';
import 'package:skype_clone/core/mock_data/person_list.dart';
import 'package:skype_clone/widgets/custom_text_field.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final PersonListData _personList = PersonListData();
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
              itemCount: _personList.personList.length,
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
                                _personList.personList[index]['profile_image']),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(5), // Image radius
                                  child: Container(
                                    color: _personList.personList[index]
                                                ['status'] ==
                                            0
                                        ? Colors.orange
                                        : _personList.personList[index]
                                                    ['status'] ==
                                                1
                                            ? Colors.green
                                            : Colors.red,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    title: Text(
                      _personList.personList[index]['name'],
                      style: const TextStyle(color: Colors.white),
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
