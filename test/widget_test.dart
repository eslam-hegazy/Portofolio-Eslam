import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/data/portfolio_data.dart';

void main() {
  testWidgets('Portfolio app renders hero section and core navigation elements', (WidgetTester tester) async {
    // Provide a standard desktop screen size for testing
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const EslamHegazyPortfolioApp());
    await tester.pump();

    // Verify name appears
    expect(find.text(PortfolioData.name), findsWidgets);

    // Verify headline / senior badge appears
    expect(find.text('SENIOR SOFTWARE ENGINEER • 4+ YEARS'), findsOneWidget);

    // Verify Download CV button appears
    expect(find.text('Download CV'), findsWidgets);

    // Verify project section filter tabs
    expect(find.text('All Projects'), findsOneWidget);
    expect(find.text('FinTech & E-Commerce'), findsOneWidget);
    expect(find.text('Healthcare & Clinical'), findsOneWidget);
    expect(find.text('Enterprise, Gov & Mobility'), findsOneWidget);
  });

  testWidgets('Mobile viewport renders hamburger navigation menu', (WidgetTester tester) async {
    // Provide a mobile screen size (iPhone width)
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const EslamHegazyPortfolioApp());
    await tester.pump();

    // Verify hamburger menu icon is rendered
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });
}

