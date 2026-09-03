import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1B2A4A); 
    const Color accentColor = Color(0xFF2E9E8C); 
    const Color backgroundColor = Color(0xFFF5F7FA);

    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: accentColor,
          surface: backgroundColor,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
          bodyMedium: TextStyle(
            color: Colors.black87,
            height: 1.4,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  // ---------- EDIT THESE VALUES ----------
  final String fullName = "Josel Reimar M. Butin"; 
  final String professorName = "Prof. Albert Q. Alforja"; 
  final DateTime examDate = DateTime.now();
  // ----------------------------------------

  final String bio =
      "I am a BS Information Technology student passionate about mobile "
      "app development, UI/UX design, and problem solving."

  final List<Map<String, String>> skills = [
    {"title": "Flutter & Dart", "subtitle": "Cross-platform mobile development"},
    {"title": "UI/UX Design", "subtitle": "Clean, consistent, user-centered layouts"},
    {"title": "Java / OOP", "subtitle": "Object-oriented programming fundamentals"},
    {"title": "Database Design", "subtitle": "SQL and relational database concepts"},
    {"title": "Problem Solving", "subtitle": "Algorithms and logical thinking"},
  ];

  String _statusMessage = "Tap, double-tap, or long-press the button below.";

  // ---------------- GESTURE HANDLERS ----------------

  void _handleSingleTap() {
    // Single Tap -> print the current date of the exam
    final String formattedDate =
        "${examDate.month}/${examDate.day}/${examDate.year}";
    debugPrint("=========================================");
    debugPrint("[SINGLE TAP] Exam Date: $formattedDate");
    debugPrint("=========================================");
    setState(() {
      _statusMessage = "Single Tap detected → Exam Date: $formattedDate";
    });
  }

  void _handleDoubleTap() {
    // Double Tap -> print the full name of ITP107 professor
    debugPrint("=========================================");
    debugPrint("[DOUBLE TAP] ITP107 Professor: $professorName");
    debugPrint("=========================================");
    setState(() {
      _statusMessage = "Double Tap detected → Professor: $professorName";
    });
  }

  void _handleLongPress() {
    // Long Press -> print your full name
    debugPrint("=========================================");
    debugPrint("[LONG PRESS] Student Name: $fullName");
    debugPrint("=========================================");
    setState(() {
      _statusMessage = "Long Press detected → Student: $fullName";
    });
  }

  // ----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ---------------- HEADER / PROFILE SECTION ----------------
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: theme.colorScheme.secondary,
                  child: const CircleAvatar(
                    radius: 51,
                    backgroundImage: NetworkImage(
                      "https://media.themoviedb.org/t/p/w300_and_h450_face/rfKfSmbwdfw1UMxPb2ygpNbyypN.jpg",
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  fullName,
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  "BSIT Student  •  Aspiring Mobile Developer",
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ---------------- ABOUT ME CARD ----------------
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text("About Me", style: theme.textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(bio, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ---------------- SKILLS SECTION ----------------
          Text("Skills & Interests", style: theme.textTheme.titleLarge),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: List.generate(skills.length, (index) {
                final skill = skills[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            theme.colorScheme.secondary.withOpacity(0.15),
                        child: Icon(Icons.check,
                            color: theme.colorScheme.secondary),
                      ),
                      title: Text(
                        skill["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(skill["subtitle"]!),
                    ),
                    if (index != skills.length - 1)
                      const Divider(height: 1, indent: 16, endIndent: 16),
                  ],
                );
              }),
            ),
          ),

          const SizedBox(height: 28),

          // ---------------- GESTURE DETECTOR SECTION ----------------
          Text("Try the Interactive Button",
              style: theme.textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            "Single tap, double tap, or long press. Check the Debug Console "
            "for the printed output.",
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),

          Center(
            child: GestureDetector(
              onTap: _handleSingleTap,
              onDoubleTap: _handleDoubleTap,
              onLongPress: _handleLongPress,
              child: ElevatedButton(
                onPressed: _handleSingleTap,
                child: const Text("Click Me"),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Status feedback panel
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.2),
              ),
            ),
            child: Text(
              _statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // ---------------- FOOTER ----------------
          Center(
            child: Text(
              "ITP107 • Laboratory Examination • Set A",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
