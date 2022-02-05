import 'package:intl/intl.dart';

extension DateStringExtension on DateTime {
  String get toDDMMYYYYY {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
