import 'package:flutter/material.dart';

class HomeMenuPage extends StatelessWidget {
  final String name;
  final String role;

  const HomeMenuPage({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1565C0),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang,',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getRoleLabel(role),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                      tooltip: 'Log Keluar',
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // Title
                const Text(
                  'Pilih Tindakan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Two menu boxes
                Expanded(
                  child: Row(
                    children: [
                      // View Dashboard
                      Expanded(
                        child: _buildMenuCard(
                          context,
                          icon: Icons.dashboard,
                          title: 'Lihat\nDashboard',
                          subtitle: 'Papar prestasi pelajar',
                          color: Colors.white,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/dashboard',
                              arguments: {'name': name, 'role': role},
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Update Data
                      Expanded(
                        child: _buildMenuCard(
                          context,
                          icon: Icons.upload_file,
                          title: 'Kemaskini\nData',
                          subtitle: 'Muat naik fail / data',
                          color: Colors.white,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/update',
                              arguments: {'name': name, 'role': role},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 64, color: const Color(0xFF1565C0)),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getRoleLabel(String role) {
    switch (role) {
      case 'admin':
        return 'Pentadbir';
      case 'teacher_form4':
        return 'Guru Tingkatan 4';
      case 'teacher_form5':
        return 'Guru Tingkatan 5';
      default:
        return '';
    }
  }
}