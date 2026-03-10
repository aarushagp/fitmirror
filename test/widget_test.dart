import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitmirror/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitmirror/firebase_options.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Build the app
    await tester.pumpWidget(const FitMirrorApp());
    await tester.pumpAndSettle();

    // Check that the home screen Scaffold exists
    expect(find.byType(Scaffold), findsOneWidget);

    // Optional: check for a text that exists in your home page
    expect(find.text('Welcome to FitMirror 👗✨'), findsOneWidget);
  });
}
