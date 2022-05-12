import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';

class SimuladorWidget extends StatelessWidget {
  const SimuladorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Simulador SiSU",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Text("Em manutenção.", 
              style: TextStyle(
                color: CustomColors.navy)),
        ]);
  }
}
