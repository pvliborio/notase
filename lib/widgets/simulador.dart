import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimuladorWidget extends StatelessWidget {
  const SimuladorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              AppLocalizations.of(context)!.simuladorSiSU,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.navy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Text("Em manutenção.", style: TextStyle(color: CustomColors.navy)),
        ]);
  }
}
