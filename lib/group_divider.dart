import 'package:flutter/material.dart';
import 'package:group_devider/group_lists.dart';
import 'package:group_devider/home.dart';

class GroupDivider extends StatefulWidget {
  const GroupDivider({super.key});

  @override
  State<GroupDivider> createState() => _GroupDividerState();
}

class _GroupDividerState extends State<GroupDivider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage())),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 30)),
                  child: const Text('<')),
              const SizedBox(
                width: 10,
              ),
              const Text("A D D  L I S T  O F  M E M B E R S"),
            ],
          ),
        ),
        body: const AddListDecoration(),
      ),
    );
  }
}

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class AddListDecoration extends StatelessWidget {
  const AddListDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
              colors: [Colors.blue, Colors.white])),
      child: const Center(child: AddListContains()),
    );
  }
}

class AddListContains extends StatefulWidget {
  const AddListContains({super.key});

  @override
  State<AddListContains> createState() => _AddListContainsState();
}

class _AddListContainsState extends State<AddListContains> {
  //Members List
  List<String> memberList = [];

  //To Show the text Field Empty Warning
  bool showWarning = false;

  //TextEditController
  final TextEditingController _addMemberController = TextEditingController();

  //Add Member Button Action
  void addMemberOnPressed() {
    _showAddMemberDialog();
  }

  void _showAddMemberDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Add Member"),
              content: SizedBox(
                width: 200,
                height: 150,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                          controller: _addMemberController,
                          decoration:
                              const InputDecoration(hintText: 'Enter Name')),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        TextButton(
                          onPressed: () {
                            if (_addMemberController.text != "") {
                              memberList.add(_addMemberController.text);
                              setState(() {
                                _addMemberController.text = "";
                                showWarning = false;
                                print(memberList);
                              });
                            } else {
                              setState(() {
                                showWarning = true;
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 68, 43, 231),
                              foregroundColor:
                                  const Color.fromARGB(255, 229, 228, 235),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          child: const Text('Add'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 231, 99, 43),
                              foregroundColor:
                                  const Color.fromARGB(255, 229, 228, 235),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          child: const Text('Close'),
                        )
                      ])
                    ]),
              ));
        });
  }

  bool isMembersEnough() {
    if (memberList.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: memberList.isEmpty
                  ? const Column(children: [
                      SizedBox(height: 20),
                      Text("Name List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 10),
                      Text("No Members Added!!")
                    ])
                  : DataTable(
                      headingRowHeight: 70,
                      columns: [
                        DataColumn(
                          label: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Name List",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const DataColumn(label: Text("")),
                      ],
                      rows: memberList
                          .map(
                            (name) => DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: 160,
                                    child: Text(' $name'),
                                  ),
                                ),
                                DataCell(
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      deleteMember(name);
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 79, 89, 227),
                    foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: addMemberOnPressed,
                child: const Text('Add Member'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 79, 79),
                    foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                child: const Text('Clear the List'),
                onPressed: () {
                  setState(() {
                    memberList = [];
                  });
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: !isMembersEnough()
                  ? null
                  : () {
                      memberList.shuffle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GroupLists(memberList: memberList)));
                    },
              child: const Text("Divide to Groups")),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  void deleteMember(String name) {
    setState(() {
      memberList.remove(name);
    });
  }
}
