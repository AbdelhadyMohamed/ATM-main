import 'package:atm/Modules/Auth/Visits/visits_data_handler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../models/visit_model.dart';

class VisitsController extends ControllerMVC {
  // singleton
  factory VisitsController() {
    _this ??= VisitsController._();
    return _this!;
  }

  static VisitsController? _this;

  VisitsController._();

  bool loading = false;

  List<VisitModel> visits = [];

  getVisits() async {
    setState(() => loading = true);
    final result = await VisitsDataHandler.getVisitsApi();
    result.fold((l) => null, (r) => visits = r);
    setState(() => loading = false);
  }
}
