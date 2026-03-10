import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FitMirror"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            _buildButton(
              context,
              "Try Virtual Outfit",
              Icons.camera_alt,
            ),

            const SizedBox(height: 20),

            _buildButton(
              context,
              "Browse Dresses",
              Icons.checkroom,
            ),

            const SizedBox(height: 20),

            _buildButton(
              context,
              "My Saved Looks",
              Icons.favorite,
            ),

            const SizedBox(height: 20),

            _buildButton(
              context,
              "Profile",
              Icons.person,
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon) {
    return SizedBox(
      width: double.infinity,
      height: 60,

      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),

        onPressed: () {},
      ),
    );
  }
}