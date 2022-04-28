import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/widgets/appbar.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey,
      appBar: CustomAppBar("Seus Simulados"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ListView.builder(
              itemCount: 2,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return InkWell(
                  child: const Card(
                    color: Color(0xFFFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "Simulado 2",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("/simulados");
                  },
                );
              }),
        ),
      ),
    );
  }
}
