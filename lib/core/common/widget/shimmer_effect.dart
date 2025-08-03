import 'package:flutter/material.dart';

class ShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  /// Optional: allows custom shimmer colors
  final List<Color>? shimmerColors;

  const ShimmerEffect({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 8,
    this.shimmerColors,
  });

  @override
  ShimmerEffectState createState() => ShimmerEffectState();
}

class ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Color> get _defaultDarkColors => [
    const Color(0xFF2A2A2A), // Base dark
    const Color(0xFF3A3A3A), // Lighter shimmer
    const Color(0xFF4A4A4A), // Highlight shimmer
    const Color(0xFF3A3A3A),
    const Color(0xFF2A2A2A),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = widget.shimmerColors ?? _defaultDarkColors;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1, -0.3),
              end: Alignment(1, 0.3),
              colors: colors,
              stops: [
                _animation.value - 1,
                _animation.value - 0.5,
                _animation.value,
                _animation.value + 0.5,
                _animation.value + 1,
              ],
            ),
          ),
        );
      },
    );
  }
}
