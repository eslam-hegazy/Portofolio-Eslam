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
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=co.shopney.shamystores',
      appStoreUrl: 'https://apps.apple.com/us/app/shamy-stores/id1533831789',
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
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=kw.gov.csc.diwani&hl=ar',
      appStoreUrl: 'https://apps.apple.com/us/app/csc-kw/id1483907307',
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
      id: 'elmatches',
      title: 'ElMatches',
      subtitle: 'Real-Time Sports Analytics & Fan Engagement Platform',
      domain: 'Sports Media & Fan Engagement',
      problem:
          'Football fans needed real-time match events, instant player ratings, interactive debate forums, and live prediction games capable of handling intense peak spikes during major tournament derbies.',
      outcome:
          'Delivered high-performance sports application with sub-second live score sync, interactive community voting, and seamless cross-platform performance.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.elmatches',
      appStoreUrl: 'https://apps.apple.com/us/app/elmatches/id6596777262',
      mobileRole:
          'Engineered the responsive Flutter mobile experience featuring dynamic match center widgets, real-time fan sentiment sliders, and instant goal alert notifications.',
      mobileArchitecture:
          'Clean Architecture with BLoC and WebSockets for live match telemetry, optimized widget rebuild trees, and persistent offline standings cache.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'WebSockets', 'Hive', 'FCM', 'Dio'],
      mobileHighlights: [
        'Real-time WebSocket event streaming delivering goal updates in under 200ms.',
        'High-efficiency custom painter timeline rendering minute-by-minute match momentum.',
        'Rich push notifications with rich media previews and quick voting buttons.',
      ],
      backendRole:
          'Developed scalable Spring Boot ingestion services connecting live sports data provider feeds and broadcasting real-time websocket updates.',
      backendArchitecture:
          'Event-driven Spring Boot architecture using Redis Pub/Sub to fan-out live match statistics to tens of thousands of active socket clients.',
      backendStack: ['Java', 'Spring Boot', 'WebSockets / STOMP', 'Redis Pub/Sub', 'PostgreSQL', 'Docker'],
      backendHighlights: [
        'Sub-50ms message broadcast latency across massive concurrent user spikes during derby finals.',
        'Optimized PostgreSQL time-series queries for historic head-to-head match stats.',
        'Rate-limiting and anti-spam algorithms protecting fan comment sections.',
      ],
    ),
    ProjectCaseStudy(
      id: 'hwaidak-hotels',
      title: 'Hwaidak Hotels — Titanic Group',
      subtitle: 'Luxury Resort Booking & Guest Experience Ecosystem',
      domain: 'Hospitality & Travel Technology',
      problem:
          'Titanic resort guests in Hurghada required an all-in-one mobile concierge for room booking, itinerary management, restaurant reservations, and on-premise service requests with multilingual support.',
      outcome:
          'Deployed high-end resort app elevating guest satisfaction ratings, streamlining front-desk workload, and facilitating smooth in-app payments.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.hwaidakhotels.guest',
      appStoreUrl: 'https://apps.apple.com/us/app/hwaidak-hotels-titanic-group/id6744203258',
      mobileRole:
          'Built the Flutter client with elegant luxury visuals, interactive resort maps, multilingual Arabic/English/German support, and smooth booking wizards.',
      mobileArchitecture:
          'MVVM with Riverpod state management, cached interactive resort asset maps, and offline digital key passes.',
      mobileStack: ['Flutter', 'Dart', 'Riverpod', 'CachedNetworkImage', 'Dio', 'FCM', 'PayTabs'],
      mobileHighlights: [
        'Bespoke animated luxury UI micro-interactions matching Titanic Hotel branding.',
        'Dynamic multilingual room service menu with dietary filters and customization notes.',
        'Offline-capable guest itinerary and activity schedule caching.',
      ],
      backendRole:
          'Integrated property management systems (PMS) with Spring Boot APIs for real-time room availability, billing reconciliation, and concierge dispatching.',
      backendArchitecture:
          'Secure Spring Boot gateway handling payment tokenization, reservation locking, and automated guest notification triggers.',
      backendStack: ['Java', 'Spring Boot', 'Spring Security', 'MySQL', 'PayTabs SDK', 'Docker'],
      backendHighlights: [
        'Atomic reservation hold transactions eliminating room double-booking.',
        'Webhook integrations for automated reservation confirmation SMS and emails.',
        'Optimized query pipelines reducing seasonal room search response time by 40%.',
      ],
    ),
    ProjectCaseStudy(
      id: 'smou-care',
      title: 'Smou Care',
      subtitle: 'HIPAA-Aligned Digital Healthcare & Diagnostics',
      domain: 'Healthcare & Clinical Diagnostics',
      problem:
          'Patients needed a secure way to book specialized at-home medical visits, track clinical sample dispatch in real-time, and download encrypted laboratory diagnostic results while strictly observing healthcare privacy regulations.',
      outcome:
          'Launched production healthcare solution connecting clinics, mobile nurses, and patients with zero HIPAA privacy violations and 50% reduction in crash rates.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.nt.smoucare',
      appStoreUrl: 'https://apps.apple.com/app/smou-care/id6740776462',
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
      domain: 'Healthcare & Mental Health',
      problem:
          'Tele-therapy demands the highest echelon of confidentiality. Patients and licensed psychologists required secure communication, encrypted session notes, and friction-free appointment matching.',
      outcome:
          'Engineered end-to-end encrypted consultation platform providing confidential voice, video, and notes exchange with licensed practitioners.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.mindscape.app&hl=en',
      appStoreUrl: 'https://apps.apple.com/us/app/mindscape-therapy/id6446362496',
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
      id: 'drug-deal',
      title: 'Drug Deal',
      subtitle: 'AI-Powered Medical Encyclopedia & Drug Interaction Engine',
      domain: 'Healthcare & Pharmacology',
      problem:
          'Healthcare professionals and patients required instant verification of pharmaceutical drug interactions, dosage recommendations, and active ingredient generic equivalents in emergency and clinical contexts.',
      outcome:
          'Delivered comprehensive pharmaceutical reference app with fast offline search, dosage calculator, and AI-assisted contraindication alerts.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.drugdeal',
      appStoreUrl: 'https://apps.apple.com/eg/app/drug-deal/id1565732393',
      mobileRole:
          'Architected the Flutter client featuring sub-millisecond local SQLite indexed search, interactive body-system categories, and contraindication warning badges.',
      mobileArchitecture:
          'Clean Architecture with BLoC, pre-compiled offline SQLite database with FTS5 full-text indexing, and graceful remote delta synchronizations.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'sqflite (FTS5)', 'Dio', 'SharedPreferences'],
      mobileHighlights: [
        'Instant offline search across 10,000+ trade and scientific drug names in under 10ms.',
        'Interactive drug-drug interaction matrix displaying severity indicators and clinical guidance.',
        'Dark mode optimized for clinical and hospital nighttime on-call shifts.',
      ],
      backendRole:
          'Built medical database management APIs in Spring Boot to ingest updated pharmaceutical circulars and push encrypted delta sync bundles to mobile clients.',
      backendArchitecture:
          'Spring Boot microservices paired with PostgreSQL Full-Text Search and automated daily medical data validation jobs.',
      backendStack: ['Java', 'Spring Boot', 'PostgreSQL', 'Spring Batch', 'Docker'],
      backendHighlights: [
        'Automated differential sync pipeline compressing daily updates to under 50KB for mobile download.',
        'Comprehensive drug classification taxonomy mapped to international WHO ATC standards.',
        'Optimized batch indexing supporting instant synonym search queries.',
      ],
    ),
    ProjectCaseStudy(
      id: 'ito-app',
      title: 'iTO (Ride-Hailing & Logistics)',
      subtitle: 'Multi-Modal Passenger Ride-Hailing & Freight Delivery',
      domain: 'Transportation & Logistics',
      problem:
          'Urban commuters and businesses required a unified platform for passenger rides, express motorcycle parcel courier dispatch, and heavy furniture-moving logistics with transparent upfront pricing.',
      outcome:
          'Created highly reliable on-demand mobility platform facilitating thousands of completed daily trips across various vehicle tiers.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.iTO.app',
      appStoreUrl: 'https://apps.apple.com/us/app/ito/id6741041097',
      mobileRole:
          'Engineered passenger booking Flutter application featuring interactive Google Maps navigation, live vehicle pin tracking, multi-stop trips, and digital wallet top-ups.',
      mobileArchitecture:
          'Clean Architecture with Riverpod & BLoC state streams, custom battery-efficient location listener, and resilient WebSocket reconnect logic.',
      mobileStack: ['Flutter', 'Dart', 'Riverpod', 'Google Maps / Polyline', 'WebSockets', 'Dio'],
      mobileHighlights: [
        'Smooth 60 FPS marker interpolation for moving vehicles with heading rotation.',
        'Multi-point route waypoint routing with automated dynamic fare recalculation.',
        'Integrated multi-gateway payment processing (Card, Wallet, Cash).',
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
      id: 'ito-captain',
      title: 'iTO Captain (Driver & Fleet)',
      subtitle: 'High-Precision Driver Telemetry & Fleet Dispatch App',
      domain: 'Transportation & Logistics',
      problem:
          'Captains operating cars, motorbikes, and heavy transport trucks required an intuitive, distraction-free driver interface with live GPS telemetry, audio trip bids, and transparent earnings breakdown.',
      outcome:
          'Shipped mission-critical driver app with background GPS tracking, battery throttle management, and zero recorded mid-trip disconnections.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.ito.driver',
      appStoreUrl: 'https://apps.apple.com/eg/app/ito-driver/id6740854493',
      mobileRole:
          'Developed driver Flutter application with background location services, automated acceptance countdown timers, in-app navigation, and instant earnings withdrawal requests.',
      mobileArchitecture:
          'BLoC architecture paired with native foreground service bridge (Kotlin) for uninterrupted background location reporting.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'Foreground Service', 'Google Maps Native', 'Geolocator'],
      mobileHighlights: [
        'Adaptive battery management throttling GPS updates dynamically based on vehicle motion.',
        'High-contrast night-mode dashboard built for safe behind-the-wheel driver ergonomics.',
        'Transparent daily earnings and commission settlement summaries.',
      ],
      backendRole:
          'Engineered the driver state machine and trip dispatch engine delivering orders to optimal drivers within sub-second intervals.',
      backendArchitecture:
          'Spring Boot cluster with distributed state handling in Redis and Kafka/RabbitMQ trip broadcasting queues.',
      backendStack: ['Java', 'Spring Boot', 'Redis', 'RabbitMQ', 'MySQL', 'WebSockets'],
      backendHighlights: [
        'Real-time heartbeat monitor detecting driver disconnection and initiating failover re-assignment.',
        'Instant automated commission ledger balancing on every trip completion.',
        'Sub-100ms driver telemetry ingestion pipeline handling continuous mobile pings.',
      ],
    ),
    ProjectCaseStudy(
      id: 'egyptian-greece',
      title: 'Egyptian Greece',
      subtitle: 'Smart Gated Community & QR Access Control Platform',
      domain: 'Community & Smart Real Estate',
      problem:
          'Compound residents and facility managers needed a modernized security access platform for issuing temporary visitor QR codes, facility reservations, maintenance ticketing, and official community broadcasts.',
      outcome:
          'Deployed modern community platform cutting gate check-in delays by 60% and digitizing 100% of resident maintenance and amenity bookings.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.egyptiangreece',
      appStoreUrl: 'https://apps.apple.com/eg/app/egyptian-greece/id6450964227',
      mobileRole:
          'Created resident Flutter application with dynamic visitor QR badge generation, facility calendar reservations, community news feeds, and push security notices.',
      mobileArchitecture:
          'Clean Architecture with Cubit state management, local secure token caching, and real-time gate scanner notification listeners.',
      mobileStack: ['Flutter', 'Dart', 'Cubit', 'qr_flutter', 'Dio', 'FCM', 'ImagePicker'],
      mobileHighlights: [
        'One-tap timed visitor pass generation with instant WhatsApp and SMS share sheets.',
        'Interactive community service ticketing with camera photo attachments and repair status tracking.',
        'Multilingual Arabic and English RTL/LTR switching.',
      ],
      backendRole:
          'Built Spring Boot security gate APIs validating incoming QR codes in real time, managing resident household accounts, and dispatching gate alerts.',
      backendArchitecture:
          'Spring Boot REST APIs with Spring Security JWT tokens, Redis cache for instant QR validity checks, and PostgreSQL database.',
      backendStack: ['Java', 'Spring Boot', 'Spring Security', 'PostgreSQL', 'Redis', 'Docker'],
      backendHighlights: [
        'Sub-50ms QR validation response time at security guard barrier gates.',
        'Automated expiration of visitor access passes eliminating unauthorized re-entry.',
        'Comprehensive audit log tracing every gate entry and exit event.',
      ],
    ),
    ProjectCaseStudy(
      id: 'puricom-egypt',
      title: 'Puricom Egypt',
      subtitle: 'IoT-Ready Water Purification Equipment & Service Ecosystem',
      domain: 'Smart Utilities & Field Service',
      problem:
          'Ensuring genuine filter cartridge authenticity, tracking periodic maintenance schedules for enterprise water systems, and providing instant QR verification across industrial units.',
      outcome:
          'Delivered end-to-end QR/serial verification and automated service contract maintenance booking with PCI-DSS aligned payment handling.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.puricomegypt&hl=en',
      appStoreUrl: 'https://apps.apple.com/eg/app/puricom-egypt/id1551475189',
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
    ProjectCaseStudy(
      id: 'home-food-plus',
      title: 'Home Food Plus Captain',
      subtitle: 'Real-Time Food Delivery Dispatch & Courier Earnings App',
      domain: 'Food Delivery & Logistics',
      problem:
          'Home-cooked food delivery couriers required an efficient mobile application for receiving dispatched meal orders, navigating to home kitchens and customers, and tracking cash collections and tips.',
      outcome:
          'Shipped resilient courier app reducing delivery hand-off times and empowering drivers with clear order instructions and real-time earnings tracking.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.runprof.homefoodpluscaptain',
      appStoreUrl: 'https://apps.apple.com/us/app/home-food-plus-captain/id6451399703',
      mobileRole:
          'Engineered courier Flutter application featuring real-time order accept/reject modals, live turn-by-turn routing, customer call masking, and digital delivery confirmations.',
      mobileArchitecture:
          'Clean Architecture with BLoC, audio player notifications for incoming orders, and resilient network retry interceptors.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'Google Maps API', 'AudioPlayer', 'Dio', 'FCM'],
      mobileHighlights: [
        'Audible and haptic alerts waking the screen when high-priority meal orders are ready.',
        'Order status state machine with one-tap kitchen arrival, pickup confirmation, and drop-off.',
        'Detailed daily reconciliation ledger showing cash collected versus in-app earnings.',
      ],
      backendRole:
          'Architected the dispatch matching service coordinating orders between home-kitchen cooks and nearby delivery captains.',
      backendArchitecture:
          'Spring Boot microservice layer utilizing Redis for courier spatial matching and PostgreSQL for order lifecycle tracking.',
      backendStack: ['Java', 'Spring Boot', 'Redis GEO', 'PostgreSQL', 'Spring WebSocket'],
      backendHighlights: [
        'Proximity-based dispatch algorithm assigning couriers within a 3km radius in seconds.',
        'Idempotent delivery completion hooks preventing accounting discrepancies.',
        'Real-time customer tracking endpoint updating delivery arrival countdowns.',
      ],
    ),
    ProjectCaseStudy(
      id: 'royal-link',
      title: 'Royal Link',
      subtitle: 'High-Throughput Clinical Exchange & Medical Network',
      domain: 'Healthcare & Hospital Networks',
      problem:
          'Diagnostic laboratories, hospitals, and independent medical clinics required a unified digital network for transferring high-volume diagnostic orders, patient test results, and secure billing clearances without latency.',
      outcome:
          'Engineered mission-critical medical platform linking multiple regional labs with zero data transmission failures and optimized database performance.',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.nt.royallink',
      appStoreUrl: 'https://apps.apple.com/us/app/royal-link/id6740776946',
      mobileRole:
          'Developed clinical portal Flutter application enabling medical directors and lab technicians to track specimen pipelines, approve urgent result releases, and review analytics dashboards.',
      mobileArchitecture:
          'Clean Architecture with BLoC, strict session timeout controls, and encrypted offline report caches.',
      mobileStack: ['Flutter', 'Dart', 'BLoC', 'FlChart', 'Dio', 'Biometric Auth', 'Secure Storage'],
      mobileHighlights: [
        'Interactive diagnostic volume charts visualizing clinical throughput across hospital branches.',
        'Instant push alerts for critical lab values (panic results) requiring physician attention.',
        'Strict biometric session lock ensuring HIPAA patient confidentiality.',
      ],
      backendRole:
          'Architected high-throughput Spring Boot backend handling HL7/FHIR medical data exchange, laboratory instrumentation integration, and relational database partitioning.',
      backendArchitecture:
          'Spring Boot microservices with Spring Data JPA/Hibernate, PostgreSQL table partitioning, and Redis caching for rapid clinical lookups.',
      backendStack: ['Java', 'Spring Boot', 'Spring Data JPA', 'PostgreSQL', 'Redis', 'Docker'],
      backendHighlights: [
        'PostgreSQL table partitioning and indexing handling millions of annual test records without degradation.',
        'Multi-tenant security architecture ensuring absolute isolation between competing laboratory networks.',
        'High-performance batch processing jobs reconciling daily clinical invoicing.',
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
