import 'package:flutter/material.dart';
import 'dart:async';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'widgets/custom_buttons.dart';
import 'widgets/progress_bar.dart';
import 'widgets/video_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> _titles = [
    'Transforme seu celular\nem maquininha',
    'Maquininha com as\nmelhores taxas',
    'Link de Pagamento e\nboletos para vender online',
    'Conta completa com Pix\ngratuito e ilimitado',
    'Cartão virtual com\n1,5% de cashback',
    'Ative e receba suas\nvendas na hora',
    'Rendimento de 100%\ndo CDI em tempo real',
    'Empréstimo sem\nburocracia',
  ];

  final List<String> _videos = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
    'assets/videos/video6.mp4',
    'assets/videos/video7.mp4',
    'assets/videos/video8.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index % _videos.length;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final videoIndex = index % _videos.length;
              return VideoBackground(
                videoPath: _videos[videoIndex],
                isActive: videoIndex == _currentIndex,
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.43),
                    Colors.black.withOpacity(0.36),
                    Colors.black.withOpacity(0.29),
                    Colors.black.withOpacity(0.22),
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.08),
                    Colors.black.withOpacity(0.04),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 0.85, 0.92, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      _titles.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index != _titles.length - 1 ? 4 : 0,
                          ),
                          child: ProgressBar(
                            isActive: index == _currentIndex,
                            isCompleted: index < _currentIndex && _currentIndex != 0,
                            duration: const Duration(seconds: 10),
                            onComplete: () {
                              if (index == _currentIndex) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Group.png',
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Infinitepay • grátis para CPF e CNPJ',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 14,
                          fontFamily: 'Cera Pro',
                          fontWeight: FontWeight.w700,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _titles[_currentIndex],
                    style: const TextStyle(
                      color: Color(0xFFF6F6F6),
                      fontSize: 28,
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButtons.secondaryButton(
                        text: 'Criar conta',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButtons.primaryButton(
                        text: 'Já sou cliente',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
