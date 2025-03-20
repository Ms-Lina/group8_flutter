import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'forgot_password_page.dart'; // Import Forgot Password Page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthScreen(),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.green),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 60),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.orange,
                tabs: const [
                  Tab(text: "Login"),
                  Tab(text: "Sign-up"),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildLoginTab(context),
                    _buildSignupTab(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        const Text("Email address", style: TextStyle(fontSize: 16)),
        TextField(controller: _emailController, decoration: const InputDecoration(hintText: "Enter email")),
        const SizedBox(height: 2),
        const Text("Password", style: TextStyle(fontSize: 16)),
        TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(hintText: "Enter password")),
        const SizedBox(height: 2),
        
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
            },
            child: const Text("Forgot passcode?", style: TextStyle(color: Colors.orange)),
          ),
        ),
        
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              context.read<AuthBloc>().add(SignInEvent(email: _emailController.text, password: _passwordController.text));
            },
            child: const Padding(padding: EdgeInsets.all(6), child: Text("Login", style: TextStyle(fontSize: 18))),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        const Text("Full Name", style: TextStyle(fontSize: 16)),
        TextField(controller: _nameController, decoration: const InputDecoration(hintText: "Enter your name")),
        const SizedBox(height: 2),
        const Text("Email address", style: TextStyle(fontSize: 16)),
        TextField(controller: _emailController, decoration: const InputDecoration(hintText: "Enter email")),
        const SizedBox(height: 2),
        const Text("Password", style: TextStyle(fontSize: 16)),
        TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(hintText: "Enter password")),
        const SizedBox(height: 2),
        
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
            },
            child: const Text("Forgot passcode?", style: TextStyle(color: Colors.orange)),
          ),
        ),
        
        const Spacer(), // Push the button to the bottom
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(SignUpEvent(
                name: _nameController.text,
                email: _emailController.text,
                password: _passwordController.text,
              ));
            },
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Text("Sign Up", style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
        
        const SizedBox(height: 5), // Bottom spacing
      ],
    );
  }
}
