import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F0EB),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const LoginScreen(),
    );
  }
}

// ------------------------ LOGIN ------------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      icon: Icons.lock,
      title: 'Welcome Back!',
      subtitle: 'Login to continue',
      fields: [
        AuthTextField(
          hint: 'Email',
          icon: Icons.email_outlined,
          controller: emailController,
        ),
        AuthTextField(
          hint: 'Password',
          icon: Icons.lock_outline,
          controller: passwordController,
          obscureText: true,
        ),
      ],
      buttonText: 'Login',
      onButtonPressed: login,
      bottomText: "Don't have an account? ",
      bottomActionText: 'Sign up',
      onBottomAction: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SignupScreen()),
        );
      },
    );
  }
}

// ------------------------ SIGNUP ------------------------

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void signup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      icon: Icons.person_add_alt,
      title: 'Create Account',
      subtitle: 'Sign up to get started',
      fields: [
        AuthTextField(
          hint: 'Full Name',
          icon: Icons.person_outline,
          controller: nameController,
        ),
        AuthTextField(
          hint: 'Email',
          icon: Icons.email_outlined,
          controller: emailController,
        ),
        AuthTextField(
          hint: 'Password',
          icon: Icons.lock_outline,
          controller: passwordController,
          obscureText: true,
        ),
        AuthTextField(
          hint: 'Confirm Password',
          icon: Icons.lock_outline,
          controller: confirmController,
          obscureText: true,
        ),
      ],
      buttonText: 'Sign Up',
      onButtonPressed: signup,
      bottomText: 'Already have an account? ',
      bottomActionText: 'Login',
      onBottomAction: () {
        Navigator.pop(context);
      },
    );
  }
}

// ------------------------ DASHBOARD ------------------------

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeEl2bqk3s5rDbTy4fJQJ7lJk7QNcpHaV8JQ&s',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Welcome back,',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Harshit Varshney 👋',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          MenuTile(
            title: 'View Profile',
            subtitle: 'See and edit your personal information.',
            icon: Icons.person_outline,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          MenuTile(
            title: 'View Courses',
            subtitle: 'Continue learning or explore new topics.',
            icon: Icons.menu_book_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CoursesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ------------------------ PROFILE ------------------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgRhcZ9d9rP5yOut2L0ltHA9Hx_GbbGoEuzA&s',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                    'https://rukminim2.flixcart.com/image/850/1000/xif0q/poster/c/9/d/medium-poster-design-no-3303-ironman-poster-ironman-posters-for-original-imaggbyayfagz4jf.jpeg?q=90&crop=false',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Harshit Varshney',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text('harshit.varshney_cs23@gla.ac.in'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProfileStat(title: 'Courses', value: '12'),
                    ProfileStat(title: 'Badges', value: '5'),
                    ProfileStat(title: 'Rank', value: '23'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
          )
        ],
      ),
    );
  }
}

// ------------------------ COURSES ------------------------

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'Flutter Basics',
        'description': 'Introduction to Flutter.',
      },
      {
        'title': 'Dart Language',
        'description': 'Learn Dart in depth.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return MenuTile(
            title: course['title']!,
            subtitle: course['description']!,
            icon: Icons.book_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailScreen(
                    title: course['title']!,
                    description: course['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ------------------------ COURSE DETAILS ------------------------

class CourseDetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const CourseDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Course Description',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Course'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------ COMMON WIDGETS ------------------------

class AuthScaffold extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> fields;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String bottomText;
  final String bottomActionText;
  final VoidCallback onBottomAction;

  const AuthScaffold({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.fields,
    required this.buttonText,
    required this.onButtonPressed,
    required this.bottomText,
    required this.bottomActionText,
    required this.onBottomAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(icon, size: 80, color: Colors.white),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ...fields,
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(buttonText,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: onBottomAction,
                      child: Text.rich(
                        TextSpan(
                          text: bottomText,
                          style: const TextStyle(color: Colors.brown),
                          children: [
                            TextSpan(
                              text: bottomActionText,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFB38867),
    );
  }
}

class AuthTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.brown),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const ProfileStat({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        Text(title),
      ],
    );
  }
}