import 'package:assignments/assignment_4/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'assignment_1/profile_card.dart';
import 'assignment_2/navigation.dart';
import 'assignment_3/login_form.dart';
import 'assignment_4/todo_list.dart';
import 'assignment_5/user_fetcher.dart';
import 'assignment_6/responsive_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Assignments",
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = [
      {
        'title': 'Profile Card',
        'widget': const ProfileCard(),
      },
      {
        'title': 'Navigation & Return',
        'widget': NavigationHomePage(),
      },
      {
        'title': 'Login Form',
        'widget': const LoginForm(),
      },
      {
        'title': 'Todo List',
        'widget': ChangeNotifierProvider(
          create: (_) => TodoProvider(),
          child: const TodoList(),
        ),
      },
      {
        'title': 'User Fetcher',
        'widget': const UserFetcher(),
      },
      {
        'title': 'Responsive Grid',
        'widget': const ResponsiveGrid(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shadab's Flutter Assignments"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: assignments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4 / 3,
          ),
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => assignment['widget'] as Widget,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade200,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      assignment['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
