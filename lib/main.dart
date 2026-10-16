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
        children: [for (final student in students) Text(student.name)],
      ),
    );
  }
}
