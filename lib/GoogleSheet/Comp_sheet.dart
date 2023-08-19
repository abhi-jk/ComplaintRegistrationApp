import 'package:gsheets/gsheets.dart';
import 'fields_sheets.dart';

class compSheet {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "gsheets-382011",
  "private_key_id": "e8b3dece412f02b341e765dcfbe0b8b48c35ebe4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC+SFO13d5eHPb+\nBK7e9vFdFQHELRSNBtRwJdo7e8j+9Z2RDUAnwGg8EuP+/3TNfXuZI0TlIpGTiDuB\n6WUYMb1RDRxz+54S6Ks90SVDjb8nn+aHbTUAClWaGjWGFcNc1k7OIR2Ps34oN8Ff\noz6rjc1dr7Js3VKIIdT8UntU0SIeHb7YQooscwQdb8DcnatiikiW95UF1j6Tvn7B\nKzqTyJyTfPp/MlLpfWhKxadEXyONdRoK8TtM3ST4ffpnIZ5ryVpJJQHsPvoWfTMx\nXYk4+ZFM6UsBkD/7smXjk/WybKTlN34+P10TF2iwvYpz/HFHqkU16wwpEsJ3hPbD\n1LdQA2J7AgMBAAECggEAOfT6tk7FT8IfwwA3KUdq/dCLsK6Qb2IQq7YD0hFih7HV\nE9zG2TTEKuQQGNfDQmHBl0PEVMxiLd8VTP0DY0qnILxPGc6ed6Dxo4sEAB75Bb8w\n7rfnKEN9jkoEWnpffnPyHdu9Tss7llFhL1mgGY2/6xS8UmdZH4i6gD45PXzTmPss\nkNoDpCCb2gjlN2QDtp7cpQi9EmPX1M/21QHiU4AtMS5s53/2TrTo9c+PPpFLJ+lc\n1I8aMwLU+teF+i96WhHNjpWOvRSY8kfRh/RghT1xzaG2shAs5/nxst1h19BphZlM\nkuMunynOSbsabztkZtXPV3Tu65c8E4dYSUkvz05zvQKBgQDuStafrQz3JQKjnph8\npRH1/GVXceCyp93uWghpLwdznimCNNV/12LYNrk5mooMBQZriLahrnSHWKDDSCZK\nhvV35Je82sZrqM2vd6PPedaVn414ExKqueKk8eIHULHXOHvJ9D/yu26qt9c2ab4+\n4s/pz84c8cxGKZ2rj79SUHTF1wKBgQDMbCwqIcZ0QI/aY9FruedeROkGGmbF3IDG\nTi7MX8qVayN3SoZNUD/ZM6yJmAzr3Lw10Qs8NW6I0G5hWZxCALgpg3bawZgug6G0\nbHonZxHps9DRwtFXahvO6aPdwili6l1TPgQkJF4kORhXqkPlTUWlZns+CuS9dO4W\nORXmXg1r/QKBgQDpW7jbHmk4DrKK8WF7j1wLfWTxQcA+tU4NgXYDK98sRpN3w63h\nSFiwTMcPtlvCcZlb7cKMi3/qm8yz8RAupAP3qZE/jTALdoAXeh6drD+Mv3eXQ3Zg\nYzGlPouPhmLi1ZnEqMGHQC6cWPUVgHCivRPHcY3zoofdnhueS2OdhNUWeQKBgFXW\nSkk6u3lPLth2N5azjjqgVvTQGz2UFKKwa6g3xPou7cqGiZRnURgkQZvZM/vKSWGT\nsNMMYKikVOUd2qZAZRRRdpPu3LcTYNBBCJ4JApWOgu3Bj2PUU27z3nIcuIInhR6S\nGO0QNFOjgdw1y6K6ardELBXmPxxqwBqmx9JexeYFAoGAfFDMEZJ/noMIdkRWK8zO\nJLVi04AFyBgZMecMFncN39ZQSJuEcxpaxK3rl/xbJtCiZ3lSXkFb19LFvL6HajDY\nmhvWDUQT8oo5aS9c4WcLJd4nYjj/Yy8tL77ddh7th1WITjn3jRVU4i/VRxdErUjp\ny/iRJsiAKQKb4M7S0MFfL7Q=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-382011.iam.gserviceaccount.com",
  "client_id": "106180714391179448369",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-382011.iam.gserviceaccount.com"
}

''';
  static final _spreadsheetId = '1WaAFnM-SV-z_BuIfQjWhCi9XgKMOkS0s37P-wH4Ck-k';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _compsheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _compsheet = await _getWorkSheet(spreadsheet, title: 'Complaints');

      final firsstRow = fieldSheet.getFields();
      _compsheet!.values.insertRow(1, firsstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_compsheet == null) return;

    _compsheet!.values.map.appendRows(rowList);
  }
}
