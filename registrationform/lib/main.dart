import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // <--- Add this
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersonalDetail(),
      ),
    ),
  );
}

class RegistrationProvider extends ChangeNotifier {
  Future<void> saveToFirestore() async {
    try {
      // 'registrations' is the folder name in Firebase
      await FirebaseFirestore.instance.collection('registrations').add({
        'fullName': fullName,
        'email': email,
        'degree': degree,
        'university': university,
        'company': company,
        'years': years,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Data sent to Firebase!");
    } catch (e) {
      print("Error saving to Firebase: $e");
      rethrow; // Pass error back to UI if needed
    }
  }
  String fullName = "";
  String email = "";
  String degree = "";
  String university = "";
  String company = "";
  String years = "";

  void UpdatePersonal(String name, String mail) {
    fullName = name;
    email = mail;
    notifyListeners();
  }

  void UpdateEducation(String deg, String uni) {
    degree = deg;
    university = uni;
    notifyListeners();
  }

  void updateExperience(String comp, String yr) {
    company = comp;
    years = yr;
    notifyListeners();
  }
}

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(title: const Text("Page 1:Personal Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => provider.fullName = val,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              onChanged: (val) => provider.email = val,
              decoration: InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EducationPage()),
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
    final provider = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("PAGE 2 :EDUCATION")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) => provider.degree = val,
              decoration: const InputDecoration(labelText: "Highest Degree"),
            ),
            TextField(
              onChanged: (val) => provider.university = val,
              decoration: const InputDecoration(labelText: "University"),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExperiencePage()),
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
    final provider = Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: const Text("Page 3 Experince Page")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => provider.company = val,
              decoration: const InputDecoration(labelText: "Company Name"),
            ),
            TextField(
              onChanged: (val) => provider.years = val,
              decoration: InputDecoration(labelText: "Years of Experience"),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                // 1. Send the data to Firebase
                await provider.saveToFirestore();

                // 2. Then navigate to SuccessPage
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SuccessPage()),
                  );
                }
              },
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
    final data = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("page 4 SUBMISSION")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              "SUBMITTTED SUCCESSFULLY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "times new roman",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("Name :"), Text(data.fullName)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("Email :"), Text(data.email)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("Degree :"), Text(data.degree)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("university :"), Text(data.university)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("company :"), Text(data.company)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("years :"), Text(data.years)],
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text("Start NEW REGISTRATION"),
            ),
          ],
        ),
      ),
    );
  }
}


