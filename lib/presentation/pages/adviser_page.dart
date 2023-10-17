import 'package:adviser/presentation/application/bloc/advice_bloc.dart';
import 'package:adviser/presentation/widgets/advice_field.dart';
import 'package:adviser/presentation/widgets/custom_button.dart';
import 'package:adviser/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Adviser"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Expanded(
                    child: Center(
                  child: BlocBuilder<AdviceBloc, AdviceState>(
                    bloc: BlocProvider.of<AdviceBloc>(context),
                    builder: (context, adviceState) {
                      if (adviceState is AdviceInitial) {
                        return Text('Your Advice is waiting for you!',
                            style: themeData.textTheme.displayLarge);
                      } else if (adviceState is AdviceStateLoading) {
                        return CircularProgressIndicator(
                          color: themeData.colorScheme.secondary,
                        );
                      } else if (adviceState is AdviceStateLoaded) {
                        return AdviceField(
                          advice: adviceState.advice,
                        );
                      } else if (adviceState is AdviceStateError) {
                        return ErrorMessage(
                          message: adviceState.message,
                        );
                      }
                      return const Placeholder();
                    },
                  ),
                )),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: CustomButton(
                      onPressed: () {
                        BlocProvider.of<AdviceBloc>(context)
                            .add(AdviceRequestEvent());
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
