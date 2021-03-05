import 'package:demo_project/enums/view_state.dart';
import 'package:demo_project/scoped_models/home_model.dart';
import 'package:demo_project/scoped_models/success_model.dart';
import 'package:demo_project/ui/views/base_view.dart';
import 'package:demo_project/ui/widgets/busy_overlay.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  final String title;

  SuccessView({this.title});

  @override
  Widget build(BuildContext context) {
    return BaseView<SuccessModel>(
        onModelReady: (model) => model.fetchDuplicatedText(title),
        builder: (context, child, model) => BusyOverlay(
              child: Scaffold(
                body: Center(
                  child: Text(model.title),
                ),
              ),
            ));
  }
}
