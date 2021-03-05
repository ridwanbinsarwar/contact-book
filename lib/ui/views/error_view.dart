import 'package:demo_project/scoped_models/home_model.dart';
import 'package:demo_project/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        builder: (context, child, model) => Scaffold(
              body: Center(
                child: Text(this.runtimeType.toString()),
              ),
            ));
  }
}
