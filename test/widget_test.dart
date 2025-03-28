import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_plan/main.dart';
import 'package:master_plan/views/plan_screen.dart'; // Pastikan path ini sesuai dengan struktur project kamu

void main() {
  testWidgets('MasterPlanApp widget test', (WidgetTester tester) async {
    // Menjalankan aplikasi
    await tester.pumpWidget(const MasterPlanApp());

    // Pastikan ada widget utama yang ditampilkan (contoh: PlanScreen)
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(PlanScreen), findsOneWidget);
  });
}
