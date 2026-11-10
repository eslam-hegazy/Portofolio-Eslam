import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/download_helper.dart';

class ResumeDownloadModal extends StatelessWidget {
  const ResumeDownloadModal({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (context) => const ResumeDownloadModal(),
    );
  }

  Future<void> _downloadResume(BuildContext context, String url, String filename) async {
    try {
      await downloadPdfAsset(url, filename);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppTheme.springGreen, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Downloading $filename...',
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFF1E293B),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download resume: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmall = screenWidth < 500;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isSmall ? 16 : 24,
        vertical: 16,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 620,
          maxHeight: screenHeight * 0.9,
        ),
        padding: EdgeInsets.all(isSmall ? 20 : 28),
        decoration: AppTheme.glassBox(
          color: const Color(0xFF0F0F0F),
          borderColor: AppTheme.borderLight,
          borderRadius: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isSmall ? 10 : 12),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderLight),
                  ),
                  child: Icon(
                    Icons.file_download_outlined,
                    color: AppTheme.white,
                    size: isSmall ? 22 : 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Download Verified CV',
                        style: GoogleFonts.outfit(
                          fontSize: isSmall ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Select the curriculum vitae tailored to your engineering opportunity',
                        style: GoogleFonts.inter(
                          fontSize: isSmall ? 11 : 13,
                          color: AppTheme.gray400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppTheme.gray400),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Flexible Scrollable Body to prevent any viewport overflow
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Option 1: Mobile & Flutter CV
                    _buildOptionCard(
                      context: context,
                      title: 'Senior Mobile Engineer CV (Flutter & Native)',
                      subtitle: 'Tailored for Lead Flutter, Mobile Architecture, Clean Code & App Performance',
                      badge: 'Flutter Specialization',
                      accentColor: AppTheme.mobileCyan,
                      icon: Icons.phone_android_rounded,
                      url: 'assets/resumes/Senior_Flutter_Resume_Eslam_Hegazy.pdf',
                      filename: 'Senior_Flutter_Resume_Eslam_Hegazy.pdf',
                      isSmall: isSmall,
                    ),
                    const SizedBox(height: 14),

                    // Option 2: Java Spring Boot & Backend CV
                    _buildOptionCard(
                      context: context,
                      title: 'Senior Software Engineer CV (Java Spring Boot)',
                      subtitle: 'Tailored for Backend Architecture, Microservices, Security, Redis & High Throughput',
                      badge: 'Backend Specialization',
                      accentColor: AppTheme.backendEmerald,
                      icon: Icons.dns_rounded,
                      url: 'assets/resumes/Software_Engineer_Resume_Eslam_Hegazy.pdf',
                      filename: 'Software_Engineer_Resume_Eslam_Hegazy.pdf',
                      isSmall: isSmall,
                    ),
                    const SizedBox(height: 18),

                    Center(
                      child: Text(
                        'Both CVs reflect Eslam Hegazy\'s unified 4+ years of cross-functional engineering experience.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppTheme.gray500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
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

  Widget _buildOptionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String badge,
    required Color accentColor,
    required IconData icon,
    required String url,
    required String filename,
    required bool isSmall,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderLight),
      ),
      padding: EdgeInsets.all(isSmall ? 14 : 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(20),
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
                    const SizedBox(width: 6),
                    Text(
                      badge,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.picture_as_pdf, color: AppTheme.white, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: isSmall ? 15 : 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: isSmall ? 11 : 12,
              color: AppTheme.gray400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: isSmall ? 40 : 44,
            child: ElevatedButton.icon(
              onPressed: () {
                _downloadResume(context, url, filename);
              },
              icon: const Icon(Icons.download_rounded, size: 18),
              label: Text(
                'Open / Download PDF',
                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 13),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.background,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
