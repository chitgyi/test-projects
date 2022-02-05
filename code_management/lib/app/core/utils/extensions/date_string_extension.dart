import 'package:intl/intl.dart';

extension DateStringExtension on DateTime {
  String get toDDMMYYYY {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get toDDMYYYY {
    return DateFormat('dd/M/yyyy').format(this);
  }
}

extension StringDate on String {
  String get toDDMYYYY {
    return DateFormat('dd MMMM, yyyy').format(DateTime.parse(this));
  }
}
