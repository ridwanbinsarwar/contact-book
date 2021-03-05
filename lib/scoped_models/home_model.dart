import 'package:demo_project/enums/view_state.dart';
import 'package:demo_project/scoped_models/base_model.dart';
import 'package:demo_project/service_locator.dart';
import 'package:demo_project/services/storage_service.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();
  String title = "HomeModel";

  Future<bool> saveData() async {
    setState(ViewState.Busy);
    setTitle("Saving Data");
    await storageService.saveData();
    setTitle("Data Saved");
    setState(ViewState.Retrieved);

    return true;
  }

  void setTitle(String value) {
    title = value;
  }
}
