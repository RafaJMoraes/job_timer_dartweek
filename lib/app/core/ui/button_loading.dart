import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonLoading<B extends StateStreamable<S>, S> extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;

  const ButtonLoading(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.selector,
      required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: BlocSelector<B, S, bool>(
          bloc: bloc,
          selector: selector,
          builder: (context, loading){
            if(!loading) return Text(label);
            return Stack(
              alignment: Alignment.center,
              children: [
                Text(label),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
                )
              ],
            );
          },
        )
    );
  }
}
