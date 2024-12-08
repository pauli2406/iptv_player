
import 'package:intl/intl.dart';

class DateFormatter {
  static final _dateFormatter = DateFormat('dd.MM.yyyy');

  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return _dateFormatter.format(date);
  }
}