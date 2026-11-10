import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/resume_download_modal.dart';
import '../widgets/case_study_modal.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _approachKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isScrolled = false;
  String _activeProjectTab = 'all';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final isScrolled = _scrollController.offset > 60;
      if (isScrolled != _isScrolled) {
        setState(() {
          _isScrolled = isScrolled;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (e) {
      debugPrint('Error launching URL $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.background,
      endDrawer: isDesktop ? null : _buildMobileDrawer(context),
      body: Stack(
        children: [
          // Ambient Minimal Glows (Subtle monochrome contrast)
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              width: 550,
              height: 550,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.white.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            right: -100,
            child: Container(
              width: 650,
              height: 650,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.mobileCyan.withValues(alpha: 0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main Scrollable Content
          SelectionArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 90), // Fixed navbar spacing
                  _buildHeroSection(isDesktop, isTablet, screenWidth),
                  _buildAboutSection(isDesktop),
                  _buildExpertiseSection(isDesktop, isTablet),
                  _buildProjectsSection(isDesktop, isTablet),
                  _buildExperienceSection(isDesktop),
                  _buildEngineeringApproachSection(isDesktop, isTablet),
                  _buildContactSection(isDesktop),
                  _buildFooter(),
                ],
              ),
            ),
          ),

          // Top Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildNavigationBar(isDesktop, screenWidth),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // NAVIGATION BAR
  // ==========================================
  Widget _buildNavigationBar(bool isDesktop, double screenWidth) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : (screenWidth < 400 ? 12 : 20),
        vertical: _isScrolled ? 14 : 20,
      ),
      decoration: BoxDecoration(
        color: _isScrolled
            ? const Color(0xFF000000).withValues(alpha: 0.94)
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? AppTheme.borderSubtle : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Brand Logo with User Avatar / Initials
          Flexible(
            child: InkWell(
            onTap: () => _scrollToKey(_heroKey),
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth < 400 ? 38 : 44,
                  height: screenWidth < 400 ? 38 : 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.white, width: 1.5),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/eslam_hegazy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      PortfolioData.name,
                      style: GoogleFonts.outfit(
                        fontSize: screenWidth < 400 ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (screenWidth >= 360)
                      Text(
                        'Senior Software Engineer',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth < 400 ? 10 : 11,
                          color: AppTheme.textMuted,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          ), // end Flexible (brand logo)

          const Spacer(),

          if (isDesktop) ...[
            _navLink('About', () => _scrollToKey(_aboutKey)),
            _navLink('Expertise', () => _scrollToKey(_expertiseKey)),
            _navLink('Projects', () => _scrollToKey(_projectsKey)),
            _navLink('Experience', () => _scrollToKey(_experienceKey)),
            _navLink('Approach', () => _scrollToKey(_approachKey)),
            _navLink('Contact', () => _scrollToKey(_contactKey)),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => ResumeDownloadModal.show(context),
              icon: const Icon(Icons.file_download_outlined, size: 16),
              label: Text(
                'Download CV',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ] else ...[
            if (screenWidth >= 480) ...[
              ElevatedButton.icon(
                onPressed: () => ResumeDownloadModal.show(context),
                icon: const Icon(Icons.file_download_outlined, size: 15),
                label: Text(
                  'Download CV',
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.white,
                  foregroundColor: AppTheme.background,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                ),
              ),
              const SizedBox(width: 8),
            ],
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.menu_rounded, color: AppTheme.white, size: 24),
              tooltip: 'Navigation Menu',
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.surfaceElevated,
                padding: const EdgeInsets.all(10),
                side: const BorderSide(color: AppTheme.borderSubtle),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ==========================================
  // MOBILE NAVIGATION DRAWER
  // ==========================================
  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.white, width: 1.5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/eslam_hegazy.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: GoogleFonts.outfit(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        Text(
                          'Senior Software Engineer',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, color: AppTheme.gray400),
                  ),
                ],
              ),
            ),
            const Divider(color: AppTheme.borderSubtle, height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                children: [
                  _drawerItem('About', Icons.person_outline_rounded, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_aboutKey);
                  }),
                  _drawerItem('Expertise', Icons.code_rounded, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_expertiseKey);
                  }),
                  _drawerItem('Projects & Case Studies', Icons.dashboard_outlined, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_projectsKey);
                  }),
                  _drawerItem('Career Timeline', Icons.work_outline_rounded, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_experienceKey);
                  }),
                  _drawerItem('Engineering Approach', Icons.architecture_rounded, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_approachKey);
                  }),
                  _drawerItem('Contact & Socials', Icons.mail_outline_rounded, () {
                    Navigator.of(context).pop();
                    _scrollToKey(_contactKey);
                  }),
                ],
              ),
            ),
            const Divider(color: AppTheme.borderSubtle, height: 1),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ResumeDownloadModal.show(context);
                      },
                      icon: const Icon(Icons.file_download_outlined, size: 18),
                      label: Text(
                        'Download CV (PDF)',
                        style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        foregroundColor: AppTheme.background,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _launchUrl(PortfolioData.githubUrl),
                        icon: const FaIcon(FontAwesomeIcons.github, size: 18, color: AppTheme.white),
                        tooltip: 'GitHub',
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => _launchUrl(PortfolioData.linkedinUrl),
                        icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 18, color: AppTheme.white),
                        tooltip: 'LinkedIn',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.gray300, size: 20),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.textPrimary,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppTheme.gray500, size: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: onTap,
    );
  }

  Widget _navLink(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // HERO SECTION (With User Photo)
  // ==========================================
  Widget _buildHeroSection(bool isDesktop, bool isTablet, double screenWidth) {
    return Container(
      key: _heroKey,
      constraints: const BoxConstraints(minHeight: 740),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (screenWidth < 400 ? 16 : 24),
        vertical: isDesktop ? 60 : 36,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroLeftContent(isDesktop, isTablet, screenWidth),
                    ),
                    const SizedBox(width: 50),
                    Expanded(flex: 4, child: _buildHeroPhotoCard()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeroPhotoCard(size: isTablet ? 300 : (screenWidth < 380 ? 220 : 260)),
                    const SizedBox(height: 36),
                    _buildHeroLeftContent(isDesktop, isTablet, screenWidth),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroLeftContent(bool isDesktop, bool isTablet, double screenWidth) {
    final isSmall = screenWidth < 400;
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        // Senior Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: isSmall ? 10 : 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.borderLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.springGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                isSmall ? 'SENIOR SOFTWARE ENGINEER' : 'SENIOR SOFTWARE ENGINEER • 4+ YEARS',
                style: GoogleFonts.inter(
                  fontSize: isSmall ? 10 : 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: isSmall ? 0.8 : 1.1,
                  color: AppTheme.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Hero Title - Bold Black & White with subtle accent mix
        Column(
          crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Text(
              'Eslam Hegazy',
              style: GoogleFonts.outfit(
                fontSize: isDesktop ? 54 : (isTablet ? 42 : (isSmall ? 30 : 36)),
                fontWeight: FontWeight.w800,
                color: AppTheme.white,
                letterSpacing: -1.2,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmall ? 8 : 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Senior Flutter Developer',
                    style: GoogleFonts.outfit(
                      fontSize: isDesktop ? 34 : (isTablet ? 26 : (isSmall ? 18 : 22)),
                      fontWeight: FontWeight.w900,
                      color: AppTheme.background,
                      letterSpacing: -0.6,
                    ),
                  ),
                ),
                Text(
                  '&',
                  style: GoogleFonts.outfit(
                    fontSize: isDesktop ? 28 : (isTablet ? 22 : 18),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmall ? 8 : 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.dns_rounded,
                        color: AppTheme.backendEmerald,
                        size: isSmall ? 18 : 22,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Java Spring Boot',
                        style: GoogleFonts.outfit(
                          fontSize: isDesktop ? 32 : (isTablet ? 24 : (isSmall ? 17 : 20)),
                          fontWeight: FontWeight.w800,
                          color: AppTheme.white,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Tagline
        Text(
          PortfolioData.heroTagline,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: isDesktop ? 18 : (isSmall ? 13 : 15),
            color: AppTheme.gray400,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // Dual Specialization Pills
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _buildSpecializationTag(
              'Mobile Developer: Flutter & Native Bridges',
              AppTheme.mobileCyan,
            ),
            _buildSpecializationTag(
              'Backend Developer: Java Spring Boot',
              AppTheme.backendEmerald,
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Action Buttons
        Wrap(
          spacing: 14,
          runSpacing: 14,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollToKey(_projectsKey),
              icon: const Icon(Icons.arrow_downward_rounded, size: 16),
              label: Text(
                'Explore Projects',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.background,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => ResumeDownloadModal.show(context),
              icon: const Icon(Icons.file_download_outlined, size: 16),
              label: Text(
                'Download CVs',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.white,
                side: const BorderSide(color: AppTheme.borderLight),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            IconButton(
              onPressed: () => _launchUrl(PortfolioData.githubUrl),
              tooltip: 'GitHub Profile',
              icon: const FaIcon(
                FontAwesomeIcons.github,
                size: 20,
                color: AppTheme.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.surfaceElevated,
                padding: const EdgeInsets.all(16),
                side: const BorderSide(color: AppTheme.borderSubtle),
              ),
            ),
            IconButton(
              onPressed: () => _launchUrl(PortfolioData.linkedinUrl),
              tooltip: 'LinkedIn Profile',
              icon: const FaIcon(
                FontAwesomeIcons.linkedinIn,
                size: 20,
                color: AppTheme.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.surfaceElevated,
                padding: const EdgeInsets.all(16),
                side: const BorderSide(color: AppTheme.borderSubtle),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // User Profile Photo Card
  Widget _buildHeroPhotoCard({double? size}) {
    final double cardWidth = size ?? 380;
    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppTheme.borderLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Photo Container with subtle gradient vignette
            Stack(
              children: [
                Image.asset(
                  'assets/images/eslam_hegazy.jpg',
                  width: double.infinity,
                  height: cardWidth * 1.05,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          AppTheme.surfaceElevated.withValues(alpha: 0.85),
                          AppTheme.surfaceElevated,
                        ],
                        stops: const [0.0, 0.65, 0.9, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.borderLight),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppTheme.springGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Available for Hire',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Profile Info Bar Under Photo
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          PortfolioData.name,
                          style: GoogleFonts.outfit(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.verified,
                        color: AppTheme.white,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cairo, Egypt • Mobile & Backend Architecture',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.gray400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecializationTag(String text, Color accentColor) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.borderLight),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray300,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // ABOUT SECTION
  // ==========================================
  Widget _buildAboutSection(bool isDesktop) {
    return Container(
      key: _aboutKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                tag: 'PROFESSIONAL SYNERGY',
                title: 'One Cohesive Engineering Identity',
                subtitle:
                    'Bridging client-side Flutter performance with resilient Java Spring Boot backend infrastructure.',
              ),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(isDesktop ? 40 : 24),
                decoration: AppTheme.glassBox(
                  color: AppTheme.surfaceCard,
                  borderRadius: 24,
                  borderColor: AppTheme.borderLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PortfolioData.aboutStory,
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 16 : 14,
                        color: AppTheme.gray300,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Divider(color: AppTheme.borderSubtle),
                    const SizedBox(height: 24),

                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildAboutPillar(
                              title: 'The Mobile Lens',
                              role: 'Senior Mobile Engineer (Flutter)',
                              color: AppTheme.white,
                              accentColor: AppTheme.mobileCyan,
                              icon: Icons.phone_android_rounded,
                              points: [
                                'Deep mastery of Flutter rendering, widget trees, and custom painters.',
                                'Clean Architecture with predictable BLoC/Cubit and Riverpod state flows.',
                                'Local offline-first persistence with Hive, SQLite, and encrypted KeyStore.',
                                'Defense-in-depth: SSL pinning, biometric auth, and ProGuard/R8 obfuscation.',
                              ],
                            ),
                          ),
                          const SizedBox(width: 28),
                          Expanded(
                            child: _buildAboutPillar(
                              title: 'The Backend Lens',
                              role:
                                  'Senior Software Engineer (Java & Spring Boot)',
                              color: AppTheme.white,
                              accentColor: AppTheme.backendEmerald,
                              icon: Icons.storage_rounded,
                              points: [
                                'Scalable RESTful microservices and modular Spring Boot architectures.',
                                'Zero-trust OAuth2 / JWT authentication, RBAC, and HIPAA compliance.',
                                'Query optimization, HikariCP connection pooling, and multi-tier Redis caching.',
                                'Event-driven streaming with Apache Kafka, RabbitMQ, and transaction rollback boundaries.',
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _buildAboutPillar(
                            title: 'The Mobile Lens',
                            role: 'Senior Mobile Engineer (Flutter)',
                            color: AppTheme.white,
                            accentColor: AppTheme.mobileCyan,
                            icon: Icons.phone_android_rounded,
                            points: [
                              'Deep mastery of Flutter rendering and widget trees.',
                              'Clean Architecture with predictable BLoC/Cubit flows.',
                              'Local offline-first persistence with Hive and SQLite.',
                              'Defense-in-depth: SSL pinning and biometric auth.',
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildAboutPillar(
                            title: 'The Backend Lens',
                            role:
                                'Senior Software Engineer (Java & Spring Boot)',
                            color: AppTheme.white,
                            accentColor: AppTheme.backendEmerald,
                            icon: Icons.storage_rounded,
                            points: [
                              'Scalable RESTful microservices with Spring Boot.',
                              'Zero-trust OAuth2 / JWT and HIPAA compliance.',
                              'Query tuning, HikariCP, and multi-tier Redis caching.',
                              'Event-driven streaming with Kafka and RabbitMQ.',
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutPillar({
    required String title,
    required String role,
    required Color color,
    required Color accentColor,
    required IconData icon,
    required List<String> points,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.borderLight),
                ),
                child: Icon(icon, color: accentColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    Text(
                      role,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.gray400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ...points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(Icons.check, color: accentColor, size: 15),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      p,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.gray300,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // EXPERTISE SECTION
  // ==========================================
  Widget _buildExpertiseSection(bool isDesktop, bool isTablet) {
    return Container(
      key: _expertiseKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                tag: 'TECHNICAL PROFICIENCY',
                title: 'Structured Engineering Competencies',
                subtitle:
                    'Exhaustive skill groups verified across production deployments in FinTech, Healthcare, Logistics, and E-Commerce.',
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 340,
                    ),
                    itemCount: PortfolioData.skillCategories.length,
                    itemBuilder: (context, index) {
                      final category = PortfolioData.skillCategories[index];
                      return _buildSkillCategoryCard(category);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategoryCard(SkillCategory cat) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: AppTheme.glassBox(
        color: AppTheme.surfaceCard,
        borderColor: AppTheme.borderLight,
        borderRadius: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.borderLight),
                ),
                child: Icon(
                  _getCategoryIcon(cat.iconName),
                  color: AppTheme.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  cat.title,
                  style: GoogleFonts.outfit(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            cat.description,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.gray400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: AppTheme.borderSubtle),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: cat.skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.borderSubtle),
                    ),
                    child: Text(
                      skill,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.gray300,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'mobile':
        return Icons.phone_android_rounded;
      case 'server':
        return Icons.dns_rounded;
      case 'sitemap':
        return Icons.hub_outlined;
      case 'shield':
        return Icons.security_rounded;
      case 'cloud':
        return Icons.cloud_done_outlined;
      case 'credit-card':
        return Icons.credit_card_rounded;
      default:
        return Icons.code_rounded;
    }
  }

  // ==========================================
  // FEATURED PROJECTS & CASE STUDIES
  // ==========================================
  Widget _buildProjectsSection(bool isDesktop, bool isTablet) {
    final filteredProjects = PortfolioData.featuredProjects.where((p) {
      final domain = p.domain.toLowerCase();
      if (_activeProjectTab == 'fintech') {
        return domain.contains('commerce') ||
            domain.contains('payment') ||
            domain.contains('travel') ||
            domain.contains('hospitality');
      }
      if (_activeProjectTab == 'healthcare') {
        return domain.contains('health') ||
            domain.contains('mental') ||
            domain.contains('clinical') ||
            domain.contains('pharmacology');
      }
      if (_activeProjectTab == 'enterprise') {
        return domain.contains('government') ||
            domain.contains('logistics') ||
            domain.contains('utilities') ||
            domain.contains('transport') ||
            domain.contains('community') ||
            domain.contains('real estate') ||
            domain.contains('sports');
      }
      return true;
    }).toList();

    return Container(
      key: _projectsKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                tag: 'VERIFIED CONTRIBUTIONS',
                title: 'Featured Projects & Case Studies',
                subtitle:
                    'Select any project to explore the dual mobile client & backend systems architecture.',
              ),
              const SizedBox(height: 24),

              // Filter Tabs (B&W High Contrast)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _filterButton('All Projects', 'all'),
                  _filterButton('FinTech & E-Commerce', 'fintech'),
                  _filterButton('Healthcare & Clinical', 'healthcare'),
                  _filterButton('Enterprise, Gov & Mobility', 'enterprise'),
                ],
              ),
              const SizedBox(height: 36),

              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 470,
                    ),
                    itemCount: filteredProjects.length,
                    itemBuilder: (context, index) {
                      final project = filteredProjects[index];
                      return _buildProjectCard(project);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterButton(String label, String tabKey) {
    final isActive = _activeProjectTab == tabKey;
    return InkWell(
      onTap: () => setState(() => _activeProjectTab = tabKey),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.white : AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? AppTheme.white : AppTheme.borderLight,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isActive ? AppTheme.background : AppTheme.gray300,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(ProjectCaseStudy project) {
    return Container(
      decoration: AppTheme.glassBox(
        color: AppTheme.surfaceCard,
        borderRadius: 20,
        borderColor: AppTheme.borderLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    project.domain.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: AppTheme.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderSubtle),
                  ),
                  child: Text(
                    'Verified Case Study',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: AppTheme.gray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project.subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.gray400,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              project.problem,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppTheme.gray400,
                height: 1.45,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildPerspectivePreviewRow(
                  label: 'Flutter Mobile',
                  techs: project.mobileStack.take(3).join(' • '),
                  color: AppTheme.mobileCyan,
                ),
                const SizedBox(height: 6),
                _buildPerspectivePreviewRow(
                  label: 'Spring Backend',
                  techs: project.backendStack.take(3).join(' • '),
                  color: AppTheme.backendEmerald,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppTheme.borderSubtle, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => CaseStudyModal.show(
                      context,
                      project,
                      initialIsBackend: false,
                    ),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 14),
                    label: Text(
                      'Case Study',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      foregroundColor: AppTheme.background,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
                if (project.googlePlayUrl != null) ...[
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () => _launchUrl(project.googlePlayUrl!),
                    borderRadius: BorderRadius.circular(10),
                    child: Tooltip(
                      message: 'Open in Google Play',
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceElevated,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.borderLight),
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.googlePlay,
                          size: 14,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
                if (project.appStoreUrl != null) ...[
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () => _launchUrl(project.appStoreUrl!),
                    borderRadius: BorderRadius.circular(10),
                    child: Tooltip(
                      message: 'Open in App Store',
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceElevated,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.borderLight),
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.appStoreIos,
                          size: 14,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 6),
                InkWell(
                  onTap: () => CaseStudyModal.show(
                    context,
                    project,
                    initialIsBackend: true,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  child: Tooltip(
                    message: 'Backend Architecture',
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceElevated,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.borderLight),
                      ),
                      child: const Icon(
                        Icons.dns_rounded,
                        size: 16,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerspectivePreviewRow({
    required String label,
    required String techs,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppTheme.white,
          ),
        ),
        Expanded(
          child: Text(
            techs,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(fontSize: 11, color: AppTheme.gray400),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // PROFESSIONAL EXPERIENCE SECTION
  // ==========================================
  Widget _buildExperienceSection(bool isDesktop) {
    return Container(
      key: _experienceKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                tag: 'CAREER TIMELINE',
                title: 'Professional Employment History',
                subtitle:
                    'Documented engineering milestones, technical leadership, and system performance impact.',
              ),
              const SizedBox(height: 40),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.experiences.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final exp = PortfolioData.experiences[index];
                  return _buildExperienceCard(exp, isDesktop);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(ExperienceItem exp, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32 : 20),
      decoration: AppTheme.glassBox(
        color: AppTheme.surfaceCard,
        borderRadius: 20,
        borderColor: AppTheme.borderLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp.title,
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${exp.company} • ${exp.location}',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.gray300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: Text(
                    exp.period,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: Text(
                    exp.period,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  exp.title,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${exp.company} • ${exp.location}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.gray300,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 18),
          ...exp.highlights.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.arrow_right,
                      color: AppTheme.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.gray300,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: exp.coreStack.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: Text(
                  tech,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.gray300,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // ENGINEERING APPROACH & ARCHITECTURE
  // ==========================================
  Widget _buildEngineeringApproachSection(bool isDesktop, bool isTablet) {
    return Container(
      key: _approachKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(
                tag: 'ARCHITECTURAL RIGOR',
                title: 'Engineering Principles & Clean Code',
                subtitle:
                    'How architectural patterns, testing disciplines, and security boundaries govern every production line of code.',
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 220,
                    ),
                    itemCount: PortfolioData.engineeringPrinciples.length,
                    itemBuilder: (context, index) {
                      final item = PortfolioData.engineeringPrinciples[index];
                      return Container(
                        padding: const EdgeInsets.all(22),
                        decoration: AppTheme.glassBox(
                          color: AppTheme.surfaceCard,
                          borderRadius: 18,
                          borderColor: AppTheme.borderLight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceElevated,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppTheme.borderLight),
                              ),
                              child: const Icon(
                                Icons.architecture_rounded,
                                color: AppTheme.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              item['title']!,
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                item['detail']!,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppTheme.gray400,
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // CONTACT & DOWNLOAD SECTION
  // ==========================================
  Widget _buildContactSection(bool isDesktop) {
    return Container(
      key: _contactKey,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: EdgeInsets.all(isDesktop ? 48 : 28),
          decoration: AppTheme.glassBox(
            color: const Color(0xFF101010),
            borderColor: AppTheme.borderLight,
            borderRadius: 28,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppTheme.background,
                  size: 30,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Let\'s Build Mission-Critical Software Together',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: isDesktop ? 32 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Text(
                  'Open to Senior Software Engineer, Lead Mobile Engineer, and Backend Architect roles in FinTech, Healthcare, Enterprise, and High-Scale ventures.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.gray400,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 36),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _contactCard(
                    icon: Icons.email_rounded,
                    title: 'Email',
                    value: PortfolioData.email,
                    onTap: () => _launchUrl('mailto:${PortfolioData.email}'),
                  ),
                  _contactCard(
                    icon: Icons.phone_android_rounded,
                    title: 'Phone / WhatsApp',
                    value: PortfolioData.phone,
                    onTap: () => _launchUrl('tel:${PortfolioData.phone}'),
                  ),
                  _contactCard(
                    icon: Icons.location_on_rounded,
                    title: 'Location',
                    value: PortfolioData.location,
                    onTap: null,
                  ),
                ],
              ),
              const SizedBox(height: 36),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => ResumeDownloadModal.show(context),
                    icon: const Icon(Icons.file_download_outlined, size: 18),
                    label: Text(
                      'Download Verified CVs (PDF)',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      foregroundColor: AppTheme.background,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl(PortfolioData.linkedinUrl),
                    icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 16),
                    label: Text(
                      'LinkedIn Profile',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.white,
                      side: const BorderSide(color: AppTheme.borderLight),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launchUrl(PortfolioData.githubUrl),
                    icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                    label: Text(
                      'GitHub Profile',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.white,
                      side: const BorderSide(color: AppTheme.borderLight),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderLight),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.white, size: 18),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.gray400,
                    ),
                  ),
                  Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // FOOTER
  // ==========================================
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      decoration: const BoxDecoration(
        color: Color(0xFF050505),
        border: Border(top: BorderSide(color: AppTheme.borderSubtle)),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              '${PortfolioData.name} • Senior Software Engineer',
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Built with Flutter Web • Monochromatic Architecture & Dual Technical Perspective',
              style: GoogleFonts.inter(fontSize: 12, color: AppTheme.gray400),
            ),
            const SizedBox(height: 12),
            Text(
              '© 2026 Eslam Hegazy. All rights reserved.',
              style: GoogleFonts.inter(fontSize: 11, color: AppTheme.gray500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String tag,
    required String title,
    required String subtitle,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 400;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: isSmall ? 10 : 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.borderLight),
          ),
          child: Text(
            tag,
            style: GoogleFonts.inter(
              fontSize: isSmall ? 10 : 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
              color: AppTheme.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: screenWidth < 400 ? 24 : (screenWidth < 640 ? 28 : 32),
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: isSmall ? 13 : 15,
              color: AppTheme.gray400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
