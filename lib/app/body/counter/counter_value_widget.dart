import 'package:flutter/material.dart';
import 'package:together/app/body/counter/counter.dart';
import 'package:provider/provider.dart';

class CounterValueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.display1,
          ),
    );
  }
}
