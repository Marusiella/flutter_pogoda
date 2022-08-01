import 'package:flutter/material.dart';
import 'package:flutter_pogoda_test/big_dark.dart';
import 'package:flutter_pogoda_test/provider.dart';
import 'package:flutter_pogoda_test/small_dark.dart';
import 'package:provider/provider.dart';

class Dark extends StatelessWidget {
  const Dark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        // transition zoom in/out with opacity
        // transitionBuilder: (child, animation) =>
        //     ScaleTransition(scale: animation, child: child),
        child: Provider.of<MyProvider>(context).getVisibility < 0.29
            ? const Small()
            : const BigDark());
  }
}
