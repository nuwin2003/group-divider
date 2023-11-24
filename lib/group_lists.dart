import 'dart:math';

import 'package:flutter/material.dart';
import 'package:group_devider/group_divider.dart';

class GroupLists extends StatefulWidget {
  final List<String> memberList;

  const GroupLists({super.key, required this.memberList});

  @override
  State<GroupLists> createState() => _GroupListsState();
}

class _GroupListsState extends State<GroupLists> {
  @override
  void initState() {
    super.initState();

    divideToGroups();
  }

  List<List<String>> groups = [];

  //Used Logic
  void divideToGroups() {
    setState(() {
      //Outer loop iterate for number of groups
      for (int i = 0; i < widget.memberList.length; i += 5) {
        List<String> group = [];
        //Check memberList
        if (widget.memberList.length % 5 < 4 &&
            i + 5 >= widget.memberList.length) {
          //Randomly divide remaining to groups
          for (int k = i + group.length; k < widget.memberList.length; k++) {
            groups[Random().nextInt(groups.length)].add(widget.memberList[k]);
          }
        } else {
          //Sequentially divide
          for (int j = i; j < i + 5 && j < widget.memberList.length; j++) {
            group.add(widget.memberList[j]);
          }
          groups.add(group);
        }
      }
    });
  }

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
            body: SingleChildScrollView(
                child: Column(children: [
              for (int i = 0; i < groups.length; i++)
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "Group ${i + 1}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.blue,
                      ),
                      for (int j = 0; j < groups[i].length; j++)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("${j + 1}) ${groups[i][j]}\n",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        )
                    ],
                  ),
                )
            ]))));
  }
}

//Ideal members for a group --> 5
//Maximum members for a group --> 6
//Minimum members for a group --> 4

