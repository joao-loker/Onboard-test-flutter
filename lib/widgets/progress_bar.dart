import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final bool isActive;
  final bool isCompleted;
  final Duration duration;
  final VoidCallback? onComplete;

  const ProgressBar({
    super.key,
    this.isActive = false,
    this.isCompleted = false,
    this.duration = const Duration(seconds: 8),
    this.onComplete,
  });

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    if (widget.isActive) {
      _controller.forward();
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  @override
  void didUpdateWidget(ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Se a barra não está mais completa, reseta
    if (!widget.isCompleted && oldWidget.isCompleted) {
      _controller.reset();
    }
    
    // Se a barra se tornou ativa
    if (widget.isActive && !oldWidget.isActive) {
      _controller.forward(from: 0.0);
    } 
    // Se a barra não está mais ativa e não está completa
    else if (!widget.isActive && oldWidget.isActive && !widget.isCompleted) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Se a barra está completa, mostra preenchida
    if (widget.isCompleted) {
      return Container(
        width: 37.38,
        height: 4,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFE0E0E0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
    }

    // Se não está completa, mostra a animação ou vazia
    return Container(
      width: 37.38,
      height: 4,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x3FE0E0E0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _animation.value,
                  child: Container(
                    height: 4,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE0E0E0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
} 