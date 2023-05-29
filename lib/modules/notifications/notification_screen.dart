import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: const ListTile(
                    title: Text(
                        "Library that allows you to display progress widgets based on percentage, can be Circular or Linear,"),
                    subtitle: Row(
                      children: [Icon(Icons.lock_clock), Text("8:10 am")],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
