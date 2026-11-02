import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'resume_download_modal.dart';

class CaseStudyModal extends StatefulWidget {
  final ProjectCaseStudy project;
  final bool initialIsBackend;

  const CaseStudyModal({
    super.key,
    required this.project,
    this.initialIsBackend = false,
  });

  static void show(BuildContext context, ProjectCaseStudy project, {bool initialIsBackend = false}) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      builder: (context) => CaseStudyModal(
        project: project,
        initialIsBackend: initialIsBackend,
      ),
    );
  }

  @override
  State<CaseStudyModal> createState() => _CaseStudyModalState();
}

class _CaseStudyModalState extends State<CaseStudyModal> {
  late bool _showBackend;

  @override
  void initState() {
    super.initState();
    _showBackend = widget.initialIsBackend;
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 24 : 32,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 860, maxHeight: 720),
        decoration: AppTheme.glassBox(
          color: const Color(0xFF0F0F0F),
          borderColor: AppTheme.borderLight,
          borderRadius: 24,
        ),
        child: Column(
          children: [
            // Header bar
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 24, 20, 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceElevated,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.borderLight),
                    ),
                    child: Text(
                      p.domain,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.gray300,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: AppTheme.gray400),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            // Modal Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.title,
                      style: GoogleFonts.outfit(
                        fontSize: isMobile ? 24 : 30,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      p.subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppTheme.gray400,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Challenge & Problem
                    _buildSectionBlock(
                      title: 'The Challenge & Problem',
                      icon: Icons.flag_outlined,
                      accentColor: AppTheme.white,
                      content: p.problem,
                    ),
                    const SizedBox(height: 16),

                    // Outcome
                    _buildSectionBlock(
                      title: 'Verified Engineering Outcome',
                      icon: Icons.verified_outlined,
                      accentColor: AppTheme.springGreen,
                      content: p.outcome,
                    ),
                    const SizedBox(height: 28),

                    // PERSPECTIVE SWITCHER TABS (B&W)
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceElevated,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.borderLight),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildPerspectiveTab(
                              isActive: !_showBackend,
                              label: 'Mobile Perspective (Flutter)',
                              icon: Icons.phone_android_rounded,
                              accentColor: AppTheme.mobileCyan,
                              onTap: () => setState(() => _showBackend = false),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _buildPerspectiveTab(
                              isActive: _showBackend,
                              label: 'Backend Perspective (Java / Spring)',
                              icon: Icons.dns_rounded,
                              accentColor: AppTheme.backendEmerald,
                              onTap: () => setState(() => _showBackend = true),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // PERSPECTIVE CONTENT
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: _showBackend
                          ? _buildBackendPerspective(p)
                          : _buildMobilePerspective(p),
                    ),

                    const SizedBox(height: 28),
                    Row(
                      children: [
                        if (p.googlePlayUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(p.googlePlayUrl!),
                            icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 14),
                            label: const Text('Google Play'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.white,
                              side: const BorderSide(color: AppTheme.borderLight),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        if (p.googlePlayUrl != null && p.appStoreUrl != null)
                          const SizedBox(width: 12),
                        if (p.appStoreUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(p.appStoreUrl!),
                            icon: const FaIcon(FontAwesomeIcons.appStoreIos, size: 16),
                            label: const Text('App Store'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.white,
                              side: const BorderSide(color: AppTheme.borderLight),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ResumeDownloadModal.show(context);
                          },
                          icon: const Icon(Icons.description_outlined, size: 16),
                          label: const Text('View Full CV Details'),
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerspectiveTab({
    required bool isActive,
    required String label,
    required IconData icon,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? AppTheme.background : AppTheme.gray400,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive ? AppTheme.background : AppTheme.gray400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobilePerspective(ProjectCaseStudy p) {
    return Container(
      key: const ValueKey('mobile_perspective'),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.smartphone_rounded, color: AppTheme.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Mobile Engineering & Architecture',
                style: GoogleFonts.outfit(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            p.mobileRole,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.gray300,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoPill('Architecture', p.mobileArchitecture),
          const SizedBox(height: 16),
          Text(
            'Technologies & Packages:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray400,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: p.mobileStack
                .map((tech) => _buildTechTag(tech))
                .toList(),
          ),
          const SizedBox(height: 18),
          Text(
            'Key Implementation Highlights:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray400,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          ...p.mobileHighlights.map((h) => _buildBulletPoint(h)),
        ],
      ),
    );
  }

  Widget _buildBackendPerspective(ProjectCaseStudy p) {
    return Container(
      key: const ValueKey('backend_perspective'),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.storage_rounded, color: AppTheme.white, size: 20),
              const SizedBox(width: 10),
              Text(
                'Backend Engineering & System Architecture',
                style: GoogleFonts.outfit(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            p.backendRole,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.gray300,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoPill('Architecture & Scaling', p.backendArchitecture),
          const SizedBox(height: 16),
          Text(
            'Backend Technologies & Services:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray400,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: p.backendStack
                .map((tech) => _buildTechTag(tech))
                .toList(),
          ),
          const SizedBox(height: 18),
          Text(
            'Key Architecture & Security Highlights:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray400,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          ...p.backendHighlights.map((h) => _buildBulletPoint(h)),
        ],
      ),
    );
  }

  Widget _buildSectionBlock({
    required String title,
    required IconData icon,
    required Color accentColor,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 16),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppTheme.gray300,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPill(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppTheme.white,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.gray300,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderLight),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray300,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.arrow_right, color: AppTheme.white, size: 16),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.gray300,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
