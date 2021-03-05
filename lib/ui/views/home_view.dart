import 'package:demo_project/enums/view_state.dart';
import 'package:demo_project/scoped_models/home_model.dart';
import 'package:demo_project/ui/views/base_view.dart';
import 'package:demo_project/ui/views/error_view.dart';
import 'package:demo_project/ui/views/success_view.dart';
import 'package:demo_project/ui/widgets/busy_overlay.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => BusyOverlay(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _getBodyUi(model.state),
              Text(model.title),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var whereToNavigate = await model.saveData();
              if (whereToNavigate) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SuccessView(title: "Passed in from home")));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ErrorView()));
              }
            },
            child: Icon(Icons.navigation_rounded),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }
}
