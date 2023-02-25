import 'package:flutter/cupertino.dart';
import '../../utils/constant_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.logoTextColor,
    required this.logoBackgroundtColor,
  });

  final Color logoTextColor;
  final Color logoBackgroundtColor;

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the device
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.07,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          size.width * 0.03,
        ),
        color: logoBackgroundtColor,
      ),
      child: Center(
        child: Text(
          'L',
          style: TextStyle(
            fontSize: size.width * 0.1,
            color: logoTextColor,
          ),
        ),
      ),
    );
  }
}
