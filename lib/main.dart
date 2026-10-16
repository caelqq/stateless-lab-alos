import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// Plain data class: all fields are final and the constructor is const, so a Student never changes.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded sample data (at least 5 students).
const List<Student> students = [
  Student(
    name: 'Aeon Aloww',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'aeon.aloww@school.edu',
  ),
  Student(
    name: 'Ram Ferbizz',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'ram.ferbizz@school.edu',
  ),
  Student(
    name: 'Jezrel Carboo',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'jezrel.carboo@school.edu',
  ),
  Student(
    name: 'Marjun Lauree',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'marjun.lauree@school.edu',
  ),
  Student(
    name: 'John Leo Terr',
    course: 'BS Information Technology',
    yearLevel: 2,
    email: 'john.leo.terr@school.edu',
  ),
];

// Stateless because it only holds app-wide settings that never change while running.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DirectoryScreen());
  }
}

// Stateless because the screen only displays the hard-coded list; nothing on it changes by itself.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Directory')),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'),
          for (final student in students) StudentCard(student: student),
        ],
      ),
    );
  }
}

// Stateless because it just shows the title it receives through its constructor.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold, // bold heading
              color: Theme.of(context).colorScheme.primary, // colored heading
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

// Stateless because it only displays the icon and text passed in by its parent.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6), // small gap between icon and text
        Expanded(child: Text(text)),
      ],
    );
  }
}

// Stateless because it only displays the Student it is given; if the data changes, the parent rebuilds it with a new Student.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(child: Text(student.name[0])),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(student.course),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
