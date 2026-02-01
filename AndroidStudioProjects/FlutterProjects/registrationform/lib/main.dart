import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalDetail(),
    ),
  );
}

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text("Page 1:Personal Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            const TextField(decoration: InputDecoration(labelText: "Email")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EducationPage()),
                  ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PAGE 2 :EDUCATION")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Highest Degree"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "University"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExperiencePage()),
                  ),
              child: const Text("Next page 3 Experience"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text("Page 3 Experince Page")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Company Name"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Years of Experience"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPage()),
                  ),
              child: const Text("PAGE 4 SUBMIT"),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("page 4 SUBMISSION")
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              const Text("SUBMITTTED SUCCESSFULLY", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "times new roman"),

              ),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text("Start NEW REGISTRATION"),
              ),
            ],
          ),
        ),
    );
  }

}
