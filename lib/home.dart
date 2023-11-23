import 'package:flutter/material.dart';
import 'package:group_devider/group_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("H O M E  P A G E"),
            centerTitle: true,
          ),
          body: const HomeDecoration()),
    );
  }
}

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class HomeDecoration extends StatelessWidget {
  const HomeDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
              colors: [Colors.blue, Colors.white])),
      child: const Center(child: HomeIncludes()),
    );
  }
}

class HomeIncludes extends StatelessWidget {
  const HomeIncludes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/Group_Divide.png',
          width: 350,
          height: 300,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GroupDivider()),
              );
            },
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            child: const Text("Start Group Divide"))
      ],
    );
  }
}
