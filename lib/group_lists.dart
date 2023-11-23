import 'package:flutter/material.dart';
import 'package:group_devider/group_divider.dart';

class GroupLists extends StatefulWidget {
  final List<String> memberList;

  const GroupLists({super.key, required this.memberList});

  @override
  State<GroupLists> createState() => _GroupListsState();
}

class _GroupListsState extends State<GroupLists> {
  var numberOfGroups = 0;
  var remainingMembers = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
              title: Row(
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GroupDivider())),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 30)),
                      child: const Text('<')),
                  const SizedBox(
                    width: 40,
                  ),
                  const Text("D I V I D E D  G R O U P S"),
                ],
              ),
            ),
            body: Container()));
  }
}

void divideToGroups() {}

//Maximum members for a group --> 6
//Minimum members for agroup --> 4

//memberList.length/5



//child: Text("${widget.memberList}")