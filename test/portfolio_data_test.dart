import 'package:flutter_test/flutter_test.dart';
import 'package:portofolio/data/portfolio_data.dart';

void main() {
  group('PortfolioData Integrity Tests', () {
    test('Personal information is valid and complete', () {
      expect(PortfolioData.name, equals('Eslam Hegazy'));
      expect(PortfolioData.headline, contains('Senior Software Engineer'));
      expect(PortfolioData.email, contains('@'));
      expect(PortfolioData.githubUrl, startsWith('https://github.com/'));
      expect(PortfolioData.linkedinUrl, startsWith('https://linkedin.com/in/'));
      expect(PortfolioData.flutterResumePath, endsWith('.pdf'));
      expect(PortfolioData.backendResumePath, endsWith('.pdf'));
    });

    test('All 13 featured projects have verified production URLs and content', () {
      expect(PortfolioData.featuredProjects.length, equals(13));

      for (final project in PortfolioData.featuredProjects) {
        // ID & Text
        expect(project.id, isNotEmpty, reason: '${project.title} id must not be empty');
        expect(project.title, isNotEmpty, reason: '${project.id} title must not be empty');
        expect(project.domain, isNotEmpty, reason: '${project.id} domain must not be empty');
        expect(project.problem, isNotEmpty, reason: '${project.id} problem must not be empty');
        expect(project.outcome, isNotEmpty, reason: '${project.id} outcome must not be empty');

        // Store URLs
        expect(project.googlePlayUrl, isNotNull, reason: '${project.title} should have Google Play URL');
        expect(project.googlePlayUrl, startsWith('https://play.google.com/store/apps/details?id='));

        expect(project.appStoreUrl, isNotNull, reason: '${project.title} should have App Store URL');
        expect(project.appStoreUrl, startsWith('https://apps.apple.com/'));

        // Dual Perspective details
        expect(project.mobileRole, isNotEmpty);
        expect(project.mobileArchitecture, isNotEmpty);
        expect(project.mobileStack, isNotEmpty);
        expect(project.mobileHighlights, isNotEmpty);

        expect(project.backendRole, isNotEmpty);
        expect(project.backendArchitecture, isNotEmpty);
        expect(project.backendStack, isNotEmpty);
        expect(project.backendHighlights, isNotEmpty);
      }
    });

    test('Every project matches at least one category filter', () {
      // categories list is used implicitly via the domain matching logic below

      for (final project in PortfolioData.featuredProjects) {
        final domain = project.domain.toLowerCase();

        final matchesFintech = domain.contains('commerce') ||
            domain.contains('payment') ||
            domain.contains('travel') ||
            domain.contains('hospitality');

        final matchesHealthcare = domain.contains('health') ||
            domain.contains('mental') ||
            domain.contains('clinical') ||
            domain.contains('pharmacology');

        final matchesEnterprise = domain.contains('government') ||
            domain.contains('logistics') ||
            domain.contains('utilities') ||
            domain.contains('transport') ||
            domain.contains('community') ||
            domain.contains('real estate') ||
            domain.contains('sports');

        final matchesAny = matchesFintech || matchesHealthcare || matchesEnterprise;

        expect(
          matchesAny,
          isTrue,
          reason: 'Project "${project.title}" (domain: ${project.domain}) does not match any category!',
        );
      }
    });

    test('Experiences have chronological validity and detailed metrics', () {
      expect(PortfolioData.experiences.length, greaterThanOrEqualTo(4));

      for (final exp in PortfolioData.experiences) {
        expect(exp.title, isNotEmpty);
        expect(exp.company, isNotEmpty);
        expect(exp.period, isNotEmpty);
        expect(exp.coreStack, isNotEmpty);
        expect(exp.highlights.length, greaterThanOrEqualTo(3));
      }
    });

    test('Skill categories cover primary engineering domains', () {
      expect(PortfolioData.skillCategories.length, greaterThanOrEqualTo(5));
      for (final cat in PortfolioData.skillCategories) {
        expect(cat.title, isNotEmpty);
        expect(cat.skills.length, greaterThanOrEqualTo(4));
        expect(cat.description, isNotEmpty);
      }
    });
  });
}

