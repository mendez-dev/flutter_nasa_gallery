import 'package:intl/intl.dart';


/// Funcion para dar formato a la fecha
String formatDate(String dateString) {
  final date = DateTime.parse(dateString);
  final formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}
