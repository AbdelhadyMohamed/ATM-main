import 'package:flutter/material.dart';

// Source https://digitaljoni.com/blog/how-to-apply-gradients-to-icons-in-flutter/

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key,
    required this.icon,
    this.gradient,
    this.size = 50,
    this.onPress,
    this.iconColor = Colors.white
  });

  final IconData icon;
  final double? size;
  final Gradient? gradient;
  final void Function()? onPress;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () => {},
      child: ShaderMask(
        child: SizedBox(
          width: size! * 1.2,
          height: size! * 1.2,
          child: Icon(
            icon,
            size: size,
            color: iconColor,
          ),
        ),
        shaderCallback: (Rect bounds) {
          final Rect rect = Rect.fromLTRB(0, 0, size!, size!);

          Gradient? tmpGradient;

          if (gradient != null) {
            tmpGradient = gradient;
          } else {
            tmpGradient = const LinearGradient(
              colors: <Color>[
                Color(0xFFFFFFFF),
                Color(0xFF000000),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
          }

          return tmpGradient!.createShader(rect);
        },
      ),
    );
  }
}