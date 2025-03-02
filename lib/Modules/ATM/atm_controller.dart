import 'package:hypelify/models/atm_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'atm_data_handler.dart';

class AtmController extends ControllerMVC {
  // singleton
  factory AtmController() {
    _this ??= AtmController._();
    return _this!;
  }

  static AtmController? _this;

  AtmController._();

  bool loading = false;

  List<AtmModel> atms = [];
  List<AtmModel> filteredAtms = [];

  getATM({required String id}) async {
    setState(() => loading = true);
    final result = await AtmDataHandler.getAtmApi(id: id);
    result.fold((l) => null, (r) {
      atms = r;
      filteredAtms = r;

    });
    setState(() => loading = false);
  }
  void searchVisits(String query) {
    filteredAtms = atms
        .where((atm) =>
    atm.nickname!.toLowerCase().contains(query.toLowerCase())
        // || atm.atm!.toLowerCase().contains(query.toLowerCase())
    )
        .toList();
    setState(() {});
  }
}
