import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonName;
  final bool useGradient;
  final Color startColor;
  final Color endColor;
  final Color buttonBgColor;
  final Color nameColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final VoidCallback onTap;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final bool textToUpperCase;
  final bool animation;

  const ButtonWidget({
    super.key,
    required this.buttonName,
    this.useGradient = true,
    this.startColor = const Color(0xFFDF02FF),
    this.endColor = const Color(0xFF9302FF),
    this.buttonBgColor = Colors.transparent,
    required this.onTap,
    this.height = 12.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.textToUpperCase = false,
    this.nameColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.fontSize = 14.0,
    this.animation = true,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.animation) {
      _controller.forward().then((_) => _controller.reverse());
    }
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.useGradient
                    ? LinearGradient(
                        colors: [widget.startColor, widget.endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: widget.useGradient ? null : widget.buttonBgColor,
                borderRadius: widget.borderRadius,
                border: widget.borderWidth > 0
                    ? Border.all(
                        color: widget.borderColor, width: widget.borderWidth)
                    : null,
              ),
              padding: EdgeInsets.symmetric(vertical: widget.height),
              child: Center(
                child: Text(
                  widget.textToUpperCase
                      ? widget.buttonName.toUpperCase()
                      : widget.buttonName,
                  style: GoogleFonts.poppins(
                    color: widget.nameColor,
                    fontWeight: FontWeight.w600,
                    fontSize: widget.fontSize,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
