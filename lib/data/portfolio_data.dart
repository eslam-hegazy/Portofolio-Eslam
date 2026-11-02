class ProjectCaseStudy {
  final String id;
  final String title;
  final String subtitle;
  final String domain;
  final String problem;
  final String outcome;
  final String? googlePlayUrl;
  final String? appStoreUrl;
  
  // Mobile Perspective Details
  final String mobileRole;
  final String mobileArchitecture;
  final List<String> mobileStack;
  final List<String> mobileHighlights;

  // Backend Perspective Details
  final String backendRole;
  final String backendArchitecture;
  final List<String> backendStack;
  final List<String> backendHighlights;

  const ProjectCaseStudy({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.domain,
    required this.problem,
    required this.outcome,
    this.googlePlayUrl,
    this.appStoreUrl,
    required this.mobileRole,
    required this.mobileArchitecture,
    required this.mobileStack,
    required this.mobileHighlights,
    required this.backendRole,
    required this.backendArchitecture,
    required this.backendStack,
    required this.backendHighlights,
  });
}

class ExperienceItem {
  final String title;
  final String company;
  final String period;
  final String location;
  final List<String> highlights;
  final List<String> coreStack;

  const ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.highlights,
    required this.coreStack,
  });
}

class SkillCategory {
  final String title;
  final String iconName;
  final List<String> skills;
  final String description;

  const SkillCategory({
    required this.title,
    required this.iconName,
    required this.skills,
    required this.description,
  });
}

class PortfolioData {
  static const String name = 'Eslam Hegazy';
  static const String headline = 'Senior Software Engineer';
  static const String specialization = 'Flutter Mobile Architecture & Java Spring Boot Backend Systems';
  static const String location = 'Cairo, Egypt';
  static const String email = 'eslamhegazy968@gmail.com';
  static const String phone = '+20 101 921 1216';
  static const String githubUrl = 'https://github.com/eslam-hegazy';
  static const String linkedinUrl = 'https://linkedin.com/in/eslam-hegazy-08223a1b7';
  static const String flutterResumePath = 'assets/resumes/Senior_Flutter_Resume_Eslam_Hegazy.pdf';
  static const String backendResumePath = 'assets/resumes/Software_Engineer_Resume_Eslam_Hegazy.pdf';

  static const String heroTagline =
      'Architecting resilient, high-throughput digital platforms across mobile clients and mission-critical cloud backends.';
  
  static const String aboutStory =
      'Senior Software Engineer with 4+ years of battle-tested engineering experience designing and building scalable systems across FinTech, Healthcare, Logistics, and E-Commerce. Uniquely equipped with dual-depth expertise: crafting high-performance, secure Flutter applications on the client side, while engineering robust, transactional Java Spring Boot microservices and RESTful APIs on the server side.\n\n'
      'A steadfast practitioner of Clean Architecture, SOLID principles, TDD, and CI/CD pipelines, with a proven track record of mentoring engineering teams, driving 35%+ throughput improvements via Redis caching and query tuning, and cutting crash rates by 50%. Adept at leveraging modern AI-assisted engineering tools to accelerate release velocity without sacrificing architectural rigor.';

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Mobile Engineering',
      iconName: 'mobile',
      description: 'Production Flutter, native iOS/Android bridge, state machines, and high-performance rendering.',
      skills: [
        'Flutter (iOS & Android)',
        'Dart',
        'BLoC / Cubit',
        'Riverpod',
        'Provider',
        'GetX',
        'Kotlin (Android Native)',
        'Swift (iOS Native)',
        'Local Caching (Hive, SQLite)',
        'GraphQL & WebSockets',
      ],
    ),
    SkillCategory(
      title: 'Backend Engineering',
      iconName: 'server',
      description: 'Distributed services, transactional integrity, caching strategies, and event streaming.',
      skills: [
        'Java & Kotlin',
        'Spring Boot & Spring MVC',
        'Spring Security',
        'Spring Data JPA / Hibernate',
        'Redis (Caching & Sessions)',
        'Apache Kafka',
        'RabbitMQ',
        'Connection Pooling (HikariCP)',
        'PostgreSQL, MySQL & MongoDB',
        'Swagger / OpenAPI',
      ],
    ),
    SkillCategory(
      title: 'Architecture & Patterns',
      iconName: 'sitemap',
      description: 'Decoupled domain models, predictable data flows, and maintainable enterprise software.',
      skills: [
        'Clean Architecture (Uncle Bob)',
        'SOLID Principles',
        'Microservices & Modular Monoliths',
        'Repository & Factory Patterns',
        'MVVM & MVI',
        'Test-Driven Development (TDD)',
        'Domain-Driven Design (DDD)',
        'API First Design',
      ],
    ),
    SkillCategory(
      title: 'Security & Compliance',
      iconName: 'shield',
      description: 'Zero-trust authorization, strict client-server cryptographic defense, and compliance standards.',
      skills: [
        'JWT & OAuth2 Authorization',
        'HIPAA Data Compliance',
        'PCI-DSS Payment Handling',
        'SSL / Certificate Pinning',
        'Flutter Obfuscation & ProGuard/R8',
        'Biometric Authentication',
        'Secure Storage (KeyStore/KeyChain)',
      ],
    ),
    SkillCategory(
      title: 'DevOps, Cloud & Testing',
      iconName: 'cloud',
      description: 'Automated continuous integration, containerization, and rigorous test coverage.',
      skills: [
        'Docker & Containerization',
        'GitHub Actions & CI/CD Pipelines',
        'Azure DevOps & GitFlow',
        'Fastlane Automation',
        'AWS (EC2, S3)',
        'Firebase (Crashlytics, FCM, Auth)',
        'JUnit, Mockito & TDD',
        'Widget & Integration Testing',
      ],
    ),
    SkillCategory(
      title: 'Payment Integrations',
      iconName: 'credit-card',
      description: 'Secure, PCI-DSS aligned payment flow integrations across MENA and global providers.',
      skills: [
        'HyperPay Payment Gateway',
        'PayTabs Integration',
        'Fawaterk Invoicing & Payments',
        'Stripe Checkout & Webhooks',
        'Webhook Verification & Idempotency',
      ],
    ),
  ];

  static const List<ProjectCaseStudy> featuredProjects = [
    ProjectCaseStudy(
      id: 'shamy-store',
      title: 'Shamy Store LLC',
      subtitle: 'High-Volume Gaming E-Commerce Ecosystem',
      domain: 'Gaming E-Commerce & Digital Goods',
      problem:
          'Gamers required sub-second inventory validation, instant digital code fulfillment, and bulletproof payment flows without duplicate charge vulnerabilities or cart race conditions.',
      outcome:
          'Shipped high-converting Flutter mobile app paired with high-throughput Spring Boot services handling rapid flash-sales and real-time inventory allocation.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.shamy.stores',
      appStoreUrl: 'https://apps.apple.com/app/shamy-stores/id1615629161',
      mobileRole:
          'Engineered the cross-platform Flutter client with intuitive catalog navigation, dynamic cart calculations, instant push notification alerts, and seamless checkout dialogs.',
      mobileArchitecture:
          'Clean Architecture with BLoC state management, local Hive cache for offline catalog browsing, and robust error-state recovery.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'Hive', 'FCM Push Notifications', 'Dio', 'Fawaterk SDK'],
      mobileHighlights: [
        'Smooth 60 FPS animated micro-interactions for digital code reveals.',
        'Optimized local cache reducing redundant category network queries by 45%.',
        'Biometric authentication and secure token storage for account safety.',
      ],
      backendRole:
          'Architected RESTful Spring Boot APIs for real-time inventory locking, asynchronous digital key delivery, and webhook processing for Fawaterk and PayTabs.',
      backendArchitecture:
          'Spring Boot microservice layer with Redis distributed locks for inventory management and PostgreSQL with ACID transaction boundaries.',
      backendStack: ['Java', 'Spring Boot', 'Spring Security (JWT)', 'PostgreSQL', 'Redis', 'PayTabs / Fawaterk APIs'],
      backendHighlights: [
        'Implemented Redis caching for product catalog, dropping average latency below 50ms.',
        'Idempotent webhook handlers ensuring zero double-charging or missed code deliveries.',
        'Automated database indexing and connection pool optimization under heavy gaming drops.',
      ],
    ),
    ProjectCaseStudy(
      id: 'csc-kw',
      title: 'CSC KW (Kuwait Civil Service Commission)',
      subtitle: 'National Government Digital Workplace Platform',
      domain: 'Public Sector / Enterprise Government',
      problem:
          '10,000+ Kuwaiti government civil servants required a reliable, ultra-secure mobile and web interface to view official ministerial announcements, job promotions, salaries, and personnel service requests.',
      outcome:
          'Delivered enterprise-grade platform achieving 99.9% uptime during nationwide announcement releases with instant push alerts and verified security compliance.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=kw.gov.csc.diwani',
      appStoreUrl: 'https://apps.apple.com/app/csc-kw/id1501718049',
      mobileRole:
          'Led development of the Flutter government client, ensuring accessibility, multilingual Arabic/English RTL support, and high-readability UI for thousands of state employees.',
      mobileArchitecture:
          'Strict Clean Architecture separating presentation, domain, and data layers with Cubit state management and certificate pinning.',
      mobileStack: ['Flutter', 'Dart', 'Cubit', 'SSL Pinning', 'Secure Storage', 'Dio', 'Firebase FCM'],
      mobileHighlights: [
        'Flawless Arabic typography with full dynamic bidirectional localization.',
        'Certificate pinning and Root/Jailbreak detection safeguarding state documents.',
        'Instant multi-channel push notification listener with deep-linking to ministry circulars.',
      ],
      backendRole:
          'Built robust Spring Boot backend services delivering real-time announcement feeds, employee directory sync, and automated transactional notification pipelines.',
      backendArchitecture:
          'Modular Spring Boot backend integrated with government LDAP/OAuth2 identity providers and MySQL high-availability clusters.',
      backendStack: ['Java', 'Spring Boot', 'Spring Security', 'OAuth2 / JWT', 'MySQL', 'Redis Cache'],
      backendHighlights: [
        'Role-Based Access Control (RBAC) separating ministerial hierarchy levels.',
        'Redis cache invalidation strategy ensuring newly published laws broadcast in real time.',
        'High-concurrency query optimization supporting morning clock-in traffic surges.',
      ],
    ),
    ProjectCaseStudy(
      id: 'smou-care',
      title: 'Smou Care',
      subtitle: 'HIPAA-Aligned Digital Healthcare & Diagnostics',
      domain: 'Telehealth & Clinical Diagnostics',
      problem:
          'Patients needed a secure way to book specialized at-home medical visits, track clinical sample dispatch in real-time, and download encrypted laboratory diagnostic results while strictly observing healthcare privacy regulations.',
      outcome:
          'Launched production healthcare solution connecting clinics, mobile nurses, and patients with zero HIPAA privacy violations and 50% reduction in crash rates.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.smoulabs.app',
      appStoreUrl: 'https://apps.apple.com/app/smou-care/id1639352934',
      mobileRole:
          'Developed patient Flutter application featuring interactive branch locator maps, dynamic appointment scheduling slots, and encrypted in-app PDF lab result rendering.',
      mobileArchitecture:
          'Clean Architecture with MVVM + BLoC pattern, encrypted SQLite/Hive local storage, and biometric unlock before displaying lab data.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'Google Maps API', 'PDF Viewer', 'Biometrics', 'Hive Encrypted'],
      mobileHighlights: [
        'Biometric authentication (Fingerprint / Face ID) safeguarding diagnostic medical files.',
        'Real-time GPS tracking for mobile nurse dispatched home-visit appointments.',
        'Crashlytics error capture integrated with immediate graceful user feedback.',
      ],
      backendRole:
          'Engineered HIPAA-aligned Spring Boot microservices handling encrypted patient health records (EHR), lab instrumentation data exchange, and dispatch schedule slotting.',
      backendArchitecture:
          'Spring Boot with Spring Security, AES-256 field-level encryption for sensitive diagnostic results, and PostgreSQL partitioned tables.',
      backendStack: ['Java', 'Spring Boot', 'Spring Data JPA', 'PostgreSQL', 'AES-256 Encryption', 'Docker'],
      backendHighlights: [
        'HIPAA-compliant audit logging recording every diagnostic record access and update.',
        'Optimized DB connection pooling and index design handling high-volume morning test uploads.',
        'Secure signed S3 URLs for transient, encrypted patient report downloads.',
      ],
    ),
    ProjectCaseStudy(
      id: 'mindscape-therapy',
      title: 'MindScape Therapy',
      subtitle: 'End-to-End Encrypted Tele-Psychotherapy System',
      domain: 'Mental Health & Secure Consultations',
      problem:
          'Tele-therapy demands the highest echelon of confidentiality. Patients and licensed psychologists required secure communication, encrypted session notes, and friction-free appointment matching.',
      outcome:
          'Engineered end-to-end encrypted consultation platform providing confidential voice, video, and notes exchange with licensed practitioners.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=app.mindscape.selfimprovement',
      appStoreUrl: 'https://apps.apple.com/app/mindscape-therapy/id1620000000',
      mobileRole:
          'Built the Flutter therapy application with calm, soothing user interface aesthetics, session booking calendars, and private consultation portals.',
      mobileArchitecture:
          'BLoC state management with client-side cryptographic key generation and strict memory hygiene preventing screenshots or clipboard snooping.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'WebRTC', 'Flutter Secure Storage', 'Dio', 'FCM'],
      mobileHighlights: [
        'Window privacy flags blocking OS task switcher snapshots of therapy notes.',
        'Interactive therapist filter by specialty, clinical modality, and availability slots.',
        'Offline session reminders and mood tracking journal stored locally in secure vault.',
      ],
      backendRole:
          'Implemented Spring Boot backend services facilitating zero-knowledge encrypted messaging, therapist credential verification, and automated recurring session schedules.',
      backendArchitecture:
          'Spring Boot API with Spring Security JWT tokens, WebSockets for secure signaling, and PostgreSQL encrypted data partitions.',
      backendStack: ['Java', 'Spring Boot', 'Spring Security', 'WebSockets', 'PostgreSQL', 'Redis'],
      backendHighlights: [
        'End-to-end key exchange validation ensuring backend cannot decipher therapist-patient consultations.',
        'Spring Security method-level authorization `@PreAuthorize` guaranteeing absolute therapist-patient isolation.',
        'Automated calendar recurrence engine with timezone-aware appointment reminders.',
      ],
    ),
    ProjectCaseStudy(
      id: 'ito-logistics',
      title: 'iTO & iTO Captain',
      subtitle: 'Multi-Modal Ride-Hailing, Logistics & Driver Platform',
      domain: 'Transportation & Last-Mile Logistics',
      problem:
          'Coordinating passenger rides, motorcycle courier express delivery, and furniture-moving heavy freight required sub-second geospatial driver matching, transparent trip fare calculations, and resilient real-time driver tracking.',
      outcome:
          'Architected dual-app suite (Rider Client + Driver Captain) operating smoothly across peak city traffic with live telemetry and transparent earnings calculations.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.itosmart.itocaptandriver',
      appStoreUrl: 'https://apps.apple.com/app/ito-smart/id1628100000',
      mobileRole:
          'Developed both Flutter apps: iTO for consumer trip booking and iTO Captain for drivers with background location broadcasting, turn-by-turn routing, and live earnings dashboards.',
      mobileArchitecture:
          'Clean Architecture with Riverpod & BLoC state streams, custom battery-optimized location telemetry listener, and resilient WebSocket reconnect logic.',
      mobileStack: ['Flutter', 'Dart', 'BLoC / Riverpod', 'Google Maps / Polyline', 'WebSockets', 'Geolocator'],
      mobileHighlights: [
        'Smooth polyline route rendering with car heading rotation and live driver progress.',
        'Driver battery optimization throttling GPS polling intelligently based on vehicle motion.',
        'Instant audio-tactile trip dispatch alerts ensuring drivers never miss trip bids.',
      ],
      backendRole:
          'Designed scalable backend services handling real-time driver coordinate ingestion, geospatial queries, dynamic fare estimation, and driver payout ledgering.',
      backendArchitecture:
          'Spring Boot microservices paired with Redis geospatial indexing (`GEOSEARCH`), RabbitMQ message broker for trip distribution, and MySQL transactions.',
      backendStack: ['Java', 'Spring Boot', 'Redis GEO', 'RabbitMQ', 'MySQL', 'WebSockets', 'Docker'],
      backendHighlights: [
        'Redis geospatial queries matching nearest 5 drivers in under 15ms.',
        'RabbitMQ decoupled event pipeline preventing server bottlenecks during rush hour spikes.',
        'Driver payout ledger with immutable transaction logs and automated shift reconciliations.',
      ],
    ),
    ProjectCaseStudy(
      id: 'puricom-egypt',
      title: 'Puricom Egypt',
      subtitle: 'IoT-Ready Water Purification Equipment & Service Ecosystem',
      domain: 'Smart Utilities & Enterprise Field Service',
      problem:
          'Ensuring genuine filter cartridge authenticity, tracking periodic maintenance schedules for enterprise water systems, and providing instant QR verification across industrial units.',
      outcome:
          'Delivered end-to-end QR/serial verification and automated service contract maintenance booking with PCI-DSS aligned payment handling.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.puricomegypt',
      appStoreUrl: 'https://apps.apple.com/app/puricom-egypt/id1552554707',
      mobileRole:
          'Created Flutter client with instant camera QR scanning, warranty status inspection, filter replacement countdown indicators, and technician dispatch booking.',
      mobileArchitecture:
          'BLoC architecture with camera hardware optimization, localized service history cache, and intuitive step-by-step service request wizards.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'Mobile Scanner (QR)', 'Dio', 'Local Notifications'],
      mobileHighlights: [
        'Sub-200ms QR scanner identifying serial numbers and detecting counterfeit equipment.',
        'Visual water filter health gauges with predictive replacement reminder notifications.',
        'Integrated customer service ticketing with direct field technician status updates.',
      ],
      backendRole:
          'Built Spring Boot backend APIs managing serialized inventory records, warranty validation rules, automated recurring maintenance jobs, and PCI-DSS payment hooks.',
      backendArchitecture:
          'Spring Boot REST APIs with Spring Data JPA, MySQL relational schema with indexing on serial barcodes, and Fawaterk/PayTabs payment adapters.',
      backendStack: ['Java', 'Spring Boot', 'Spring Data JPA', 'MySQL', 'Spring Scheduled Tasks', 'PayTabs'],
      backendHighlights: [
        'PCI-DSS compliant payment processing for recurring water filter subscription packages.',
        'Automated scheduled cron jobs evaluating warranty expiration dates and dispatching service alerts.',
        'Query optimization cutting barcode verification response times by 35%.',
      ],
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      title: 'Senior Software Engineer (Mobile & Backend Systems)',
      company: 'Beshara Group',
      period: 'Jun 2025 – Present',
      location: 'Cairo, Egypt',
      coreStack: ['Flutter', 'Dart', 'Java', 'Spring Boot', 'Spring Security', 'Redis', 'Clean Architecture', 'Docker'],
      highlights: [
        'Architected and delivered enterprise-grade Flutter applications and companion Spring Boot backend APIs serving 1,000+ clients.',
        'Improved backend system throughput and mobile app efficiency by 35% through Redis caching, query optimization, connection pooling (HikariCP), and intelligent local caching.',
        'Owned end-to-end architectural decisions related to scalability, mobile-backend contract design, security, and SOLID principles.',
        'Mentored junior and mid-level engineers through structured code reviews and TDD practices, slashing bug regression rates by 25%.',
        'Directed Agile sprint planning and backlog refinement across cross-functional teams, hitting a 95% on-time sprint completion rate.',
        'Leveraged AI-assisted development tooling (Claude, GitHub Copilot) to accelerate delivery velocity and automate review pipelines.',
      ],
    ),
    ExperienceItem(
      title: 'Senior Software Engineer (Healthcare Domain)',
      company: 'National Technology',
      period: 'Jun 2024 – Jun 2025',
      location: 'Cairo, Egypt',
      coreStack: ['Java', 'Spring Boot', 'Flutter', 'HIPAA Security', 'PostgreSQL', 'TDD', 'Crashlytics'],
      highlights: [
        'Engineered and maintained production Flutter mobile apps and Spring Boot microservices for HIPAA-aligned healthcare platforms supporting 1,000+ active users.',
        'Reduced technical debt by 20% by refactoring core modules into Clean Architecture layers and enforcing strict code quality benchmarks.',
        'Cut mobile crash rates and API fault rates by 50% via strengthened error boundaries, Crashlytics monitoring, and robust authorization controls.',
        'Implemented lab data exchange APIs with field-level encryption safeguarding sensitive patient medical records.',
      ],
    ),
    ExperienceItem(
      title: 'Software Engineer (Mobile & Backend)',
      company: 'RunProf LLC',
      period: 'Feb 2023 – Jun 2024',
      location: 'Cairo, Egypt',
      coreStack: ['Flutter', 'Java', 'Spring Boot', 'OAuth2', 'JWT', 'Redis', 'GraphQL', 'Kotlin Native', 'JUnit/Mockito'],
      highlights: [
        'Developed 5+ cross-platform mobile applications integrating GraphQL, Kotlin-based Android modules, and Spring Boot REST APIs.',
        'Implemented JWT authentication and OAuth2 authorization flows across mobile and backend, boosting security compliance by 30%.',
        'Reduced API response times by 35% through SQL query optimization, Redis cache layers, and database connection pooling.',
        'Backed all feature releases with unit, widget, and integration test coverage (JUnit/Mockito, Flutter test), achieving 90% on-time delivery.',
        'Achieved a 40% improvement in mobile application efficiency through optimized API calls and local caching (Hive/SQLite).',
      ],
    ),
    ExperienceItem(
      title: 'Software Engineer',
      company: 'Alareeb Information & Communication Company',
      period: 'Feb 2022 – Feb 2023',
      location: 'Cairo, Egypt',
      coreStack: ['Flutter', 'Java', 'Spring Boot', 'HyperPay', 'PCI-DSS', 'REST APIs', 'MySQL'],
      highlights: [
        'Integrated HyperPay payment gateway into Flutter mobile apps and Spring Boot backend services with strict PCI-DSS aligned security.',
        'Reduced overall application load times by 35% through mobile rendering optimizations and efficient database query refactoring.',
        'Delivered 2 custom enterprise applications end-to-end: from UI/UX design, API modeling, and security testing through App Store and Google Play deployment.',
      ],
    ),
  ];

  static const List<Map<String, String>> engineeringPrinciples = [
    {
      'title': 'Dual-Sided Clean Architecture',
      'icon': 'layers',
      'detail':
          'Separating Domain, Use Cases, and Infrastructure. On mobile, decoupling UI widgets from data providers using BLoC. On backend, decoupling Spring controllers from core domain services and repositories.',
    },
    {
      'title': 'Enterprise Security & Compliance',
      'icon': 'shield-check',
      'detail':
          'Zero-trust mindset. Enforcing OAuth2/JWT token rotation, SSL certificate pinning on mobile, ProGuard/R8 obfuscation, and full adherence to HIPAA and PCI-DSS transaction boundaries.',
    },
    {
      'title': 'High-Throughput Performance',
      'icon': 'zap',
      'detail':
          'Eliminating bottlenecks on both sides of the wire: 60 FPS Jank-free Flutter rendering with smart cache layers (Hive/SQLite), backed by Redis caching and HikariCP connection pooling delivering 35%+ throughput improvements.',
    },
    {
      'title': 'Test-Driven Reliability (TDD)',
      'icon': 'check-circle',
      'detail':
          'Protecting business logic with JUnit, Mockito, and Flutter unit/widget testing. Strict CI/CD pipelines catching regressions before reaching production.',
    },
    {
      'title': 'Robust API Contracts',
      'icon': 'code',
      'detail':
          'Designing APIs with OpenAPI/Swagger standards, explicit DTO validation, standardized error handling envelopes, and backward compatibility for mobile client versions.',
    },
    {
      'title': 'Agile Mentorship & AI Acceleration',
      'icon': 'users',
      'detail':
          'Leading cross-functional sprints (95% completion rate), mentoring engineers through pair programming, and leveraging AI tools (Claude, Copilot) to accelerate delivery velocity.',
    },
  ];
}
