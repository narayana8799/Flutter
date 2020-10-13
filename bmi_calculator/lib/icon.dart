import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcon extends StatelessWidget {
  final IconData icon;
  final String gender;
  GenderIcon({@required this.icon, @required this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: tStyle,
        ),
      ],
    );
  }
}
