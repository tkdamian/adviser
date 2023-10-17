import 'package:adviser/presentation/widgets/advice_field.dart';
import 'package:adviser/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Adviser"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const Expanded(
                    child: Center(
                        child: AdviceField(
                  advice: "This is a Test Advice!",
                ))),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: CustomButton(
                      onPressed: () {
                        print("button pressed");
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
