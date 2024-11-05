// Define a Program class
import 'package:flutter/material.dart';

class Program {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  Program(this.title, this.description, this.startTime, this.endTime);
}

// Create a list of Program objects
List<Program> programs = [
  Program('Program 1', 'Description 1', DateTime(2022, 1, 1, 10, 0),
      DateTime(2022, 1, 1, 11, 0)),
  Program('Program 2', 'Description 2', DateTime(2022, 1, 1, 11, 0),
      DateTime(2022, 1, 1, 12, 0)),
  // Add more programs as needed
];

// Create a ProgramWidget
class ProgramWidget extends StatelessWidget {
  final Program program;

  const ProgramWidget(this.program, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title:
          Text('${program.title} (${program.startTime} - ${program.endTime})'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(program.description),
        ),
      ],
    );
  }
}

// Create an EPGWidget
class EPGWidget extends StatelessWidget {
  const EPGWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var upcomingPrograms = programs
        .where(
          (program) => program.endTime.isAfter(now),
        )
        .toList();
    return ListView.builder(
      itemCount: upcomingPrograms.length,
      itemBuilder: (context, index) {
        return ProgramWidget(upcomingPrograms[index]);
      },
    );
  }
}
