import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime, DateFormat dateFormat) {
    return dateFormat.format(dateTime);
  }

  static DateTime? convertFromDateString({required String dateString, required DateFormat dateFormat}) {
    DateTime? date;
    try {
      date = dateFormat.parse(dateString);
    } catch (e) {
      date = null;
    }
    return date;
  }
}

int maxScaleTime = 2 * 365;

DateTime minDate = DateTime.now().subtract(Duration(days: maxScaleTime));
DateTime maxDate = DateTime.now().add(Duration(days: maxScaleTime));

DateFormat both = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
DateFormat date = DateFormat('dd-MM-yyyy');
DateFormat timeAndDate = DateFormat('HH:mm dd/MM/yyyy');
DateFormat dateSlash = DateFormat('dd/MM/yyyy');
DateFormat time = DateFormat("HH:mm");
DateFormat dateOnly = DateFormat('dd');
DateFormat monthOnly = DateFormat('MM');
DateFormat yearOnly = DateFormat('yyyy');

DateFormat timeAppointment = DateFormat('dd/MM/yyyy HH:mm:ss');
