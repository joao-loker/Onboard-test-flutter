import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatefulWidget {
  final String videoPath;
  final bool isActive;

  const VideoBackground({
    super.key,
    required this.videoPath,
    this.isActive = false,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      debugPrint('Iniciando carregamento do vídeo: ${widget.videoPath}');
      _controller = VideoPlayerController.asset(widget.videoPath);
      debugPrint('Controlador criado para: ${widget.videoPath}');
      
      await _controller!.initialize();
      debugPrint('Vídeo inicializado com sucesso: ${widget.videoPath}');
      
      _controller!.setLooping(true);
      _controller!.setVolume(0.0);
      
      if (widget.isActive) {
        _controller!.play();
        debugPrint('Iniciando reprodução do vídeo: ${widget.videoPath}');
      }
      
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _hasError = false;
        });
      }
    } catch (e, stackTrace) {
      debugPrint('Error initializing video: ${widget.videoPath}');
      debugPrint('Error details: $e');
      debugPrint('Stack trace: $stackTrace');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void didUpdateWidget(VideoBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPath != oldWidget.videoPath) {
      _initializeVideo();
    }
    if (_controller != null && widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller!.play();
      } else {
        _controller!.pause();
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Erro ao carregar o vídeo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
} 