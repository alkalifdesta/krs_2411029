import 'package:flutter/material.dart';

void main() {
  runApp(const KrsApp());
}

// ============================================================
// WARNA
// ============================================================

class AppColors {
  static const background = Color(0xFF05080F);
  static const surface = Color(0xFF0C1320);
  static const card = Color(0xFF111C2E);
  static const blue = Color(0xFF1677FF);
  static const lightBlue = Color(0xFF55A8FF);
  static const border = Color(0xFF24334C);
  static const secondary = Color(0xFFAAB7CA);
}

// ============================================================
// APP
// ============================================================

class KrsApp extends StatelessWidget {
  const KrsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KRS 2411029',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blue,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.card,
          labelStyle: const TextStyle(
            color: AppColors.secondary,
          ),
          hintStyle: const TextStyle(
            color: Colors.white38,
          ),
          prefixIconColor: AppColors.lightBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.border,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.blue,
              width: 1.5,
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ============================================================
// LOGIN
// ============================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nimController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void login() {
    final nim = nimController.text.trim();
    final password = passwordController.text.trim();

    if (nim == '2411029' && password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'NIM atau password salah.',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    nimController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue.withOpacity(0.10),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -100,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue.withOpacity(0.06),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 440,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.blue,
                              Color(0xFF0044AA),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blue.withOpacity(0.25),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.school_rounded,
                          color: Colors.white,
                          size: 46,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'SISTEM KRS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Kartu Rencana Studi Mahasiswa',
                        style: TextStyle(
                          color: AppColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Login Mahasiswa',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Silakan masuk menggunakan akun mahasiswa.',
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 22),
                            TextField(
                              controller: nimController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'NIM',
                                hintText: 'Masukkan NIM',
                                prefixIcon: Icon(
                                  Icons.badge_outlined,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: passwordController,
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Masukkan password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword =
                                          !obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) => login(),
                            ),
                            const SizedBox(height: 22),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: login,
                                icon: const Icon(
                                  Icons.login_rounded,
                                ),
                                label: const Text(
                                  'MASUK',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                  ),
                                ),
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
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String waktuKuliah = 'Kuliah Pagi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.school_rounded,
              color: AppColors.lightBlue,
            ),
            SizedBox(width: 10),
            Text(
              'KRS Mahasiswa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _welcome(),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= 700) {
                      return Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _profile(),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: _academic(),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        _profile(),
                        const SizedBox(height: 18),
                        _academic(),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                _waktu(),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KrsPage(
                            waktuKuliah: waktuKuliah,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit_note_rounded,
                    ),
                    label: const Text(
                      'ISI KRS SEKARANG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _welcome() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0D47A1),
            Color(0xFF061426),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.blue.withOpacity(0.3),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Datang,',
            style: TextStyle(
              color: Color(0xFFBBD8FF),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Alkalif Desta Dinova',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Silakan lengkapi Kartu Rencana Studi Semester 5.',
            style: TextStyle(
              color: Color(0xFFD7E7FF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profile() {
    return Panel(
      title: 'Profil Mahasiswa',
      icon: Icons.person_outline_rounded,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 95,
            height: 115,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/foto_alkalif.jpg',
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return const Icon(
                  Icons.person_rounded,
                  size: 55,
                  color: AppColors.lightBlue,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              children: [
                ProfileRow(
                  label: 'Nama',
                  value: 'Alkalif Desta Dinova',
                ),
                ProfileRow(
                  label: 'NIM',
                  value: '2411029',
                ),
                ProfileRow(
                  label: 'Kelas',
                  value: 'IFB5A',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _academic() {
    return const Panel(
      title: 'Informasi Akademik',
      icon: Icons.account_balance_outlined,
      child: Column(
        children: [
          ProfileRow(
            label: 'Prodi',
            value: 'Informatika',
          ),
          ProfileRow(
            label: 'Semester',
            value: '5',
          ),
          ProfileRow(
            label: 'Kelas',
            value: 'IFB5A',
          ),
          ProfileRow(
            label: 'Status',
            value: 'Aktif',
          ),
        ],
      ),
    );
  }

  Widget _waktu() {
    return Panel(
      title: 'Pilih Waktu Kuliah',
      icon: Icons.schedule_rounded,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 550) {
            return Row(
              children: [
                Expanded(
                  child: WaktuCard(
                    title: 'Kuliah Pagi',
                    icon: Icons.wb_sunny_outlined,
                    selected:
                        waktuKuliah == 'Kuliah Pagi',
                    onTap: () {
                      setState(() {
                        waktuKuliah = 'Kuliah Pagi';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WaktuCard(
                    title: 'Kuliah Malam',
                    icon: Icons.nightlight_outlined,
                    selected:
                        waktuKuliah == 'Kuliah Malam',
                    onTap: () {
                      setState(() {
                        waktuKuliah = 'Kuliah Malam';
                      });
                    },
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              WaktuCard(
                title: 'Kuliah Pagi',
                icon: Icons.wb_sunny_outlined,
                selected:
                    waktuKuliah == 'Kuliah Pagi',
                onTap: () {
                  setState(() {
                    waktuKuliah = 'Kuliah Pagi';
                  });
                },
              ),
              const SizedBox(height: 12),
              WaktuCard(
                title: 'Kuliah Malam',
                icon: Icons.nightlight_outlined,
                selected:
                    waktuKuliah == 'Kuliah Malam',
                onTap: () {
                  setState(() {
                    waktuKuliah = 'Kuliah Malam';
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// ============================================================
// WIDGET DASHBOARD
// ============================================================

class Panel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const Panel({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color:
                      AppColors.blue.withOpacity(0.13),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: AppColors.lightBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 11,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 85,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 12,
              ),
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(
              color: AppColors.secondary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaktuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const WaktuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 180,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.blue.withOpacity(0.13)
              : AppColors.card,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected
                ? AppColors.blue
                : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? AppColors.lightBlue
                  : AppColors.secondary,
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? Colors.white
                      : AppColors.secondary,
                ),
              ),
            ),
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selected
                  ? AppColors.lightBlue
                  : AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MODEL MATA KULIAH
// ============================================================

class MataKuliah {
  final String kode;
  final String nama;
  final int sks;
  final String hari;
  final String jam;
  final String kelas;
  final String ruangan;
  final String dosen;

  const MataKuliah({
    required this.kode,
    required this.nama,
    required this.sks,
    required this.hari,
    required this.jam,
    required this.kelas,
    required this.ruangan,
    required this.dosen,
  });
}

// ============================================================
// DATA MATA KULIAH
// ============================================================

const List<MataKuliah> daftarMataKuliah = [
  MataKuliah(
    kode: '111500',
    nama: 'Sistem Manajemen Basis Data',
    sks: 3,
    hari: 'Senin',
    jam: '08:00 - 10:30',
    kelas: 'IFB5A',
    ruangan: 'LAB D (FKOM)',
    dosen:
        'Nashruddin Bin Idris, S.Kom., M.Kom',
  ),
  MataKuliah(
    kode: '111400',
    nama: 'Simulasi dan Game Komputer',
    sks: 3,
    hari: 'Senin',
    jam: '10:30 - 13:00',
    kelas: 'IFB5A',
    ruangan: 'LAB A (FKOM)',
    dosen:
        'Heruzulkifli Rowa, S.Kom., M.Kom',
  ),
  MataKuliah(
    kode: '111600',
    nama: 'Teknologi Aplikasi Bergerak',
    sks: 3,
    hari: 'Senin',
    jam: '13:00 - 15:30',
    kelas: 'IFB5A',
    ruangan: 'LAB B (FKOM)',
    dosen:
        'Istia Budi, S.T., M.M',
  ),
  MataKuliah(
    kode: '111100',
    nama: 'Penalaran Komputer',
    sks: 3,
    hari: 'Selasa',
    jam: '13:00 - 15:30',
    kelas: 'IFB5A',
    ruangan: 'A201',
    dosen:
        'Isa Rosita, S.Kom., M.Cs.',
  ),
  MataKuliah(
    kode: '110600',
    nama: 'Jaringan Nirkabel',
    sks: 3,
    hari: 'Kamis',
    jam: '08:00 - 10:30',
    kelas: 'IFB5A',
    ruangan: 'LAB JARINGAN (FKOM)',
    dosen:
        'Wisnu Hera Pamungkas, S.T.P., M.Eng',
  ),
  MataKuliah(
    kode: '111000',
    nama: 'Pemrograman Aplikasi Bergerak',
    sks: 3,
    hari: 'Kamis',
    jam: '13:00 - 15:30',
    kelas: 'IFB5A',
    ruangan: 'LAB A (FKOM)',
    dosen:
        'Pramudya Prima Insan, S.Kom., M.Kom.',
  ),
  MataKuliah(
    kode: '000000',
    nama: 'Penulisan dan Publikasi Ilmiah',
    sks: 2,
    hari: 'Jumat',
    jam: '08:00 - 09:40',
    kelas: 'IFB5A',
    ruangan: 'A202',
    dosen:
        'Yusuf Wibisono, S.E., M.T.I.',
  ),
  MataKuliah(
    kode: '110700',
    nama: 'Kriptografi',
    sks: 3,
    hari: 'Jumat',
    jam: '10:30 - 13:00',
    kelas: 'IFB5A',
    ruangan: 'A202',
    dosen:
        'Sumardi, S.Kom., M.Kom.',
  ),
];

// ============================================================
// ISI KRS
// ============================================================

class KrsPage extends StatefulWidget {
  final String waktuKuliah;

  const KrsPage({
    super.key,
    required this.waktuKuliah,
  });

  @override
  State<KrsPage> createState() =>
      _KrsPageState();
}

class _KrsPageState extends State<KrsPage> {
  final Set<String> selectedKode = {};

  int get totalSks {
    int total = 0;

    for (final mk in daftarMataKuliah) {
      if (selectedKode.contains(mk.kode)) {
        total += mk.sks;
      }
    }

    return total;
  }

  List<MataKuliah> get selectedCourses {
    return daftarMataKuliah
        .where(
          (mk) =>
              selectedKode.contains(mk.kode),
        )
        .toList();
  }

  void pilihSemua() {
    setState(() {
      if (selectedKode.length ==
          daftarMataKuliah.length) {
        selectedKode.clear();
      } else {
        selectedKode.clear();

        for (final mk in daftarMataKuliah) {
          selectedKode.add(mk.kode);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final semuaDipilih =
        selectedKode.length ==
            daftarMataKuliah.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Isi KRS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF061426),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.edit_calendar_rounded,
                            color:
                                AppColors.lightBlue,
                            size: 35,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'KRS Semester 5',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight:
                                    FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Pilih mata kuliah yang akan diambil pada semester ini.',
                        style: TextStyle(
                          color:
                              Color(0xFFD7E7FF),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          InfoChip(
                            icon: Icons.schedule,
                            text:
                                widget.waktuKuliah,
                          ),
                          const InfoChip(
                            icon:
                                Icons.groups_outlined,
                            text: 'IFB5A',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >=
                        600) {
                      return Row(
                        children: [
                          Expanded(
                            child: StatCard(
                              title:
                                  'Mata Kuliah',
                              value:
                                  '${selectedKode.length} / 8',
                              icon: Icons
                                  .menu_book_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: StatCard(
                              title: 'Total SKS',
                              value:
                                  '$totalSks / 23 SKS',
                              icon: Icons
                                  .calculate_outlined,
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        StatCard(
                          title: 'Mata Kuliah',
                          value:
                              '${selectedKode.length} / 8',
                          icon: Icons
                              .menu_book_outlined,
                        ),
                        const SizedBox(height: 12),
                        StatCard(
                          title: 'Total SKS',
                          value:
                              '$totalSks / 23 SKS',
                          icon:
                              Icons.calculate_outlined,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Daftar Mata Kuliah',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: pilihSemua,
                      icon: Icon(
                        semuaDipilih
                            ? Icons
                                .remove_done_rounded
                            : Icons
                                .done_all_rounded,
                      ),
                      label: Text(
                        semuaDipilih
                            ? 'Batalkan Semua'
                            : 'Pilih Semua',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ...daftarMataKuliah.map(
                  (mk) {
                    final selected =
                        selectedKode.contains(
                      mk.kode,
                    );

                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: MataKuliahCard(
                        mataKuliah: mk,
                        selected: selected,
                        onTap: () {
                          setState(() {
                            if (selected) {
                              selectedKode
                                  .remove(mk.kode);
                            } else {
                              selectedKode
                                  .add(mk.kode);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        BorderRadius.circular(18),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (context, constraints) {
                      if (constraints.maxWidth >
                          500) {
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${selectedKode.length} Mata Kuliah • $totalSks SKS',
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                    AppColors.blue,
                                foregroundColor:
                                    Colors.white,
                              ),
                              onPressed:
                                  selectedKode.isEmpty
                                      ? null
                                      : lanjut,
                              icon: const Icon(
                                Icons
                                    .arrow_forward_rounded,
                              ),
                              label: const Text(
                                'Lanjut',
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .stretch,
                        children: [
                          Text(
                            '${selectedKode.length} Mata Kuliah • $totalSks SKS',
                            textAlign:
                                TextAlign.center,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            style: ElevatedButton
                                .styleFrom(
                              backgroundColor:
                                  AppColors.blue,
                              foregroundColor:
                                  Colors.white,
                            ),
                            onPressed:
                                selectedKode.isEmpty
                                    ? null
                                    : lanjut,
                            icon: const Icon(
                              Icons
                                  .arrow_forward_rounded,
                            ),
                            label: const Text(
                              'LANJUT',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void lanjut() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RingkasanKrsPage(
          mataKuliah: selectedCourses,
          waktuKuliah: widget.waktuKuliah,
        ),
      ),
    );
  }
}

// ============================================================
// WIDGET KRS
// ============================================================

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoChip({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.lightBlue,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  AppColors.blue.withOpacity(0.12),
              borderRadius:
                  BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color: AppColors.lightBlue,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MataKuliahCard extends StatelessWidget {
  final MataKuliah mataKuliah;
  final bool selected;
  final VoidCallback onTap;

  const MataKuliahCard({
    super.key,
    required this.mataKuliah,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 180),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.blue.withOpacity(0.10)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? AppColors.blue
                : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.blue
                    : AppColors.card,
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: Icon(
                selected
                    ? Icons.check_rounded
                    : Icons.menu_book_outlined,
                color: selected
                    ? Colors.white
                    : AppColors.lightBlue,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          mataKuliah.nama,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.blue
                              .withOpacity(0.15),
                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Text(
                          '${mataKuliah.sks} SKS',
                          style: const TextStyle(
                            color:
                                AppColors.lightBlue,
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${mataKuliah.kode} • ${mataKuliah.kelas}',
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 14,
                    runSpacing: 8,
                    children: [
                      MiniInfo(
                        icon: Icons
                            .calendar_today_outlined,
                        text: mataKuliah.hari,
                      ),
                      MiniInfo(
                        icon:
                            Icons.access_time_rounded,
                        text: mataKuliah.jam,
                      ),
                      MiniInfo(
                        icon: Icons
                            .location_on_outlined,
                        text: mataKuliah.ruangan,
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  MiniInfo(
                    icon:
                        Icons.person_outline_rounded,
                    text: mataKuliah.dosen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const MiniInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 15,
          color: AppColors.lightBlue,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// RINGKASAN KRS
// ============================================================

class RingkasanKrsPage extends StatelessWidget {
  final List<MataKuliah> mataKuliah;
  final String waktuKuliah;

  const RingkasanKrsPage({
    super.key,
    required this.mataKuliah,
    required this.waktuKuliah,
  });

  int get totalSks {
    int total = 0;

    for (final mk in mataKuliah) {
      total += mk.sks;
    }

    return total;
  }

  Future<void> simpan(
    BuildContext context,
  ) async {
    final hasil = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: const Text(
            'Simpan KRS?',
          ),
          content: Text(
            'Anda akan menyimpan ${mataKuliah.length} mata kuliah dengan total $totalSks SKS.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                  false,
                );
              },
              child: const Text(
                'Batal',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(
                  dialogContext,
                  true,
                );
              },
              child: const Text(
                'Simpan',
              ),
            ),
          ],
        );
      },
    );

    if (hasil == true && context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => KrsBerhasilPage(
            mataKuliah: mataKuliah,
            waktuKuliah: waktuKuliah,
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ringkasan KRS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF061426),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons
                            .assignment_turned_in_outlined,
                        color: AppColors.lightBlue,
                        size: 45,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Ringkasan KRS',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight:
                              FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '${mataKuliah.length} Mata Kuliah • $totalSks SKS',
                        style: const TextStyle(
                          color:
                              Color(0xFFD7E7FF),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        BorderRadius.circular(18),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: Column(
                    children: [
                      const ProfileRow(
                        label: 'Nama',
                        value:
                            'Alkalif Desta Dinova',
                      ),
                      const ProfileRow(
                        label: 'NIM',
                        value: '2411029',
                      ),
                      const ProfileRow(
                        label: 'Kelas',
                        value: 'IFB5A',
                      ),
                      ProfileRow(
                        label: 'Waktu',
                        value: waktuKuliah,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                ...mataKuliah.asMap().entries.map(
                  (entry) {
                    final no = entry.key + 1;
                    final mk = entry.value;

                    return Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),
                      padding:
                          const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius:
                            BorderRadius.circular(
                          17,
                        ),
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            alignment:
                                Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.blue
                                  .withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              '$no',
                              style: const TextStyle(
                                color: AppColors
                                    .lightBlue,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  mk.nama,
                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${mk.kode} • ${mk.sks} SKS • ${mk.kelas}',
                                  style:
                                      const TextStyle(
                                    color: AppColors
                                        .secondary,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '${mk.hari}, ${mk.jam} • ${mk.ruangan}',
                                  style:
                                      const TextStyle(
                                    color: AppColors
                                        .secondary,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  mk.dosen,
                                  style:
                                      const TextStyle(
                                    color: AppColors
                                        .secondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color:
                        AppColors.blue.withOpacity(
                      0.10,
                    ),
                    borderRadius:
                        BorderRadius.circular(16),
                    border: Border.all(
                      color:
                          AppColors.blue.withOpacity(
                        0.35,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calculate_outlined,
                        color: AppColors.lightBlue,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Total SKS',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '$totalSks SKS',
                        style: const TextStyle(
                          color:
                              AppColors.lightBlue,
                          fontSize: 19,
                          fontWeight:
                              FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),
                    ),
                    onPressed: () {
                      simpan(context);
                    },
                    icon: const Icon(
                      Icons.save_rounded,
                    ),
                    label: const Text(
                      'SIMPAN KRS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// KRS BERHASIL
// ============================================================

class KrsBerhasilPage extends StatelessWidget {
  final List<MataKuliah> mataKuliah;
  final String waktuKuliah;

  const KrsBerhasilPage({
    super.key,
    required this.mataKuliah,
    required this.waktuKuliah,
  });

  int get totalSks {
    int total = 0;

    for (final mk in mataKuliah) {
      total += mk.sks;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 650,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blue
                          .withOpacity(0.15),
                      border: Border.all(
                        color: AppColors.blue,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.lightBlue,
                      size: 68,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'KRS Berhasil Disimpan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Kartu Rencana Studi Semester 5 berhasil disimpan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondary,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius:
                          BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.border,
                      ),
                    ),
                    child: Column(
                      children: [
                        const ProfileRow(
                          label: 'Nama',
                          value:
                              'Alkalif Desta Dinova',
                        ),
                        const ProfileRow(
                          label: 'NIM',
                          value: '2411029',
                        ),
                        const ProfileRow(
                          label: 'Kelas',
                          value: 'IFB5A',
                        ),
                        ProfileRow(
                          label: 'Matkul',
                          value:
                              '${mataKuliah.length}',
                        ),
                        ProfileRow(
                          label: 'SKS',
                          value: '$totalSks SKS',
                        ),
                        ProfileRow(
                          label: 'Waktu',
                          value: waktuKuliah,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.blue,
                        foregroundColor:
                            Colors.white,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                JadwalKuliahPage(
                              mataKuliah:
                                  mataKuliah,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons
                            .calendar_month_rounded,
                      ),
                      label: const Text(
                        'LIHAT JADWAL KULIAH',
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      style:
                          OutlinedButton.styleFrom(
                        foregroundColor:
                            AppColors.lightBlue,
                        side: const BorderSide(
                          color: AppColors.border,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const DashboardPage(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.home_outlined,
                      ),
                      label: const Text(
                        'Kembali ke Dashboard',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// JADWAL
// ============================================================

class JadwalKuliahPage extends StatelessWidget {
  final List<MataKuliah> mataKuliah;

  const JadwalKuliahPage({
    super.key,
    required this.mataKuliah,
  });

  List<MataKuliah> jadwalHari(
    String hari,
  ) {
    return mataKuliah
        .where(
          (mk) => mk.hari == hari,
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    const daftarHari = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jadwal Kuliah',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 950,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF061426),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons
                            .calendar_month_rounded,
                        size: 40,
                        color: AppColors.lightBlue,
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              'Jadwal Semester 5',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight:
                                    FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Alkalif Desta Dinova • IFB5A',
                              style: TextStyle(
                                color:
                                    Color(0xFFD7E7FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ...daftarHari.map(
                  (hari) => JadwalHariCard(
                    hari: hari,
                    mataKuliah:
                        jadwalHari(hari),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const DashboardPage(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.home_rounded,
                    ),
                    label: const Text(
                      'KEMBALI KE DASHBOARD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JadwalHariCard extends StatelessWidget {
  final String hari;
  final List<MataKuliah> mataKuliah;

  const JadwalHariCard({
    super.key,
    required this.hari,
    required this.mataKuliah,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            color: AppColors.card,
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.lightBlue,
                  size: 18,
                ),
                const SizedBox(width: 9),
                Text(
                  hari,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  mataKuliah.isEmpty
                      ? 'Tidak ada kuliah'
                      : '${mataKuliah.length} Mata Kuliah',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          if (mataKuliah.isEmpty)
            const Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(
                    Icons
                        .free_breakfast_outlined,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Tidak ada jadwal kuliah.',
                    style: TextStyle(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            )
          else
            ...mataKuliah.map(
              (mk) => Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(17),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                ),
                child: LayoutBuilder(
                  builder:
                      (context, constraints) {
                    if (constraints.maxWidth >
                        500) {
                      return Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          SizedBox(
                            width: 125,
                            child: Text(
                              mk.jam,
                              style:
                                  const TextStyle(
                                color: AppColors
                                    .lightBlue,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child:
                                JadwalDetail(
                              mataKuliah: mk,
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          mk.jam,
                          style: const TextStyle(
                            color:
                                AppColors.lightBlue,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        JadwalDetail(
                          mataKuliah: mk,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class JadwalDetail extends StatelessWidget {
  final MataKuliah mataKuliah;

  const JadwalDetail({
    super.key,
    required this.mataKuliah,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          mataKuliah.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${mataKuliah.kode} • ${mataKuliah.sks} SKS • ${mataKuliah.ruangan}',
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          mataKuliah.dosen,
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}