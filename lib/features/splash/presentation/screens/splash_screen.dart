import 'package:dayflow/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryDark, AppColors.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo Container
              Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      size: 64,
                      color: AppColors.primary,
                    ),
                  )
                  .animate()
                  .scale(duration: 600.ms, curve: Curves.easeOutBack)
                  .fade(duration: 400.ms)
                  .then() // Wait for previous animations
                  .shimmer(duration: 1200.ms, color: AppColors.primaryLight)
                  .effect(
                    duration: 1000.ms,
                    curve: Curves.easeInOut,
                  ), // Continuous shimmer/effect could be applied

              const SizedBox(height: 24),

              // Title "DayFlow"
              Text(
                    'DayFlow',
                    style: GoogleFonts.poppins(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  )
                  .animate()
                  .moveY(
                    begin: 30,
                    end: 0,
                    delay: 300.ms,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fade(delay: 300.ms, duration: 600.ms),

              const SizedBox(height: 8),

              // Tagline
              Text(
                    'Plan. Act. Track.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                  .animate()
                  .moveY(
                    begin: 20,
                    end: 0,
                    delay: 600.ms,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fade(delay: 600.ms, duration: 600.ms),

              const SizedBox(height: 48),

              // Loading Indicator
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ).animate().fade(delay: 1000.ms, duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }
}
