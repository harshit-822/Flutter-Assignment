import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: StatePlayground(),
    debugShowCheckedModeBanner: false,
  ));
}

class StatePlayground extends StatefulWidget {
  const StatePlayground({Key? key}) : super(key: key);

  @override
  State<StatePlayground> createState() => _StatePlaygroundState();
}

class _StatePlaygroundState extends State<StatePlayground> {
  int _counter = 0;
  bool _showWidget = true;
  final List<bool> _tasks = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TASK & TAP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Counter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the button to increment the counter.',
              style: TextStyle(color: Colors.white70,fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Count: $_counter',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: const Text("Increment"),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Toggle Visibility',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Toggle the visibility of the widget below.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              value: _showWidget,
              onChanged: (value) {
                setState(() {
                  _showWidget = value;
                });
              },
              title: const Text("Show Widget", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            if (_showWidget)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://webinarninja.com/blog/wp-content/uploads/2024/07/Feature_WN_5-Interactive-Product-Demo-Examples_-What-Are-They-How-to-Create-One-in-2024_.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 24),
            const Text(
              'Task List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mark tasks as completed by checking the boxes.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _tasks[0],
              onChanged: (val) => setState(() => _tasks[0] = val!),
              title: const Text("Task 1: Do Classes & Tasks", style: TextStyle(color: Colors.white)),
            ),
            CheckboxListTile(
              value: _tasks[1],
              onChanged: (val) => setState(() => _tasks[1] = val!),
              title: const Text("Task 2: Do Assignments", style: TextStyle(color: Colors.white)),
            ),
            CheckboxListTile(
              value: _tasks[2],
              onChanged: (val) => setState(() => _tasks[2] = val!),
              title: const Text("Task 3: Do mini projects", style: TextStyle(color: Colors.white)),
            ),
            CheckboxListTile(
              value: _tasks[3],
              onChanged: (val) => setState(() => _tasks[3] = val!),
              title: const Text("Task 4: Do project & Tell progress", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}