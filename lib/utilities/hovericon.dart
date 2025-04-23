import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/strings.dart';

class HoverIconButton extends StatefulWidget {
 final String imagePath;
  final VoidCallback? onPressed;

   const HoverIconButton({
    Key? key,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  HoverIconButtonState createState() => HoverIconButtonState();
}

class HoverIconButtonState extends State<HoverIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          padding: MaterialStateProperty.all(EdgeInsets.all(8)),
          side: MaterialStateProperty.all(
            BorderSide(color: Colors.black, width: 1),
          ),
          backgroundColor: MaterialStateProperty.all(
            _isHovered ? Colors.black : Colors.white,
          ),
        ),
        child: Image.asset(
         widget.imagePath,
          width: 24,
          color: _isHovered ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
