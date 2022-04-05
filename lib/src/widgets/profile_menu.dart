import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/constants.dart';

class UserProfileOption extends StatefulWidget {
  const UserProfileOption({
    Key? key,
    required this.text,
    required this.icon,
    this.press, required this.rightIcon,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback? press;
  final Widget rightIcon;

  @override
  State<UserProfileOption> createState() => _UserProfileOptionState();
}

class _UserProfileOptionState extends State<UserProfileOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: kPrimaryColor,
              padding: const EdgeInsets.all(20),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: widget.press,
            child: Row(
              children: [
                Icon(widget.icon, color: kPrimaryColor, size: 22,),
                const SizedBox(width: 20),
                Expanded(child: Text(widget.text)),
                widget.rightIcon,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
