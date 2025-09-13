class DateTimeFunctions {
  static String getFormattedDate(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  static String getFormattedTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}";
  }

  List<String> makeListFromString(String string, String separator) {
    List<String> list = [];
    if (string.contains(separator)) {
      list = string.split(separator);
    } else {
      list.add(string);
    }
    return list;
  }

//function to get the second date from "09.03.11-25.09.2021" string
  String getSecondDateFromString(String date) {
    if (date.contains('-')) {
      return date.split('-')[1];
    } else {
      return date;
    }
  }

//function to replace . with - in string 25.09.2021
  String replaceDotsWithDashes(String date) {
    if (date.contains('.')) {
      return date.replaceAll('.', '-');
    } else {
      return date;
    }
  }

//parse date from string to DateTime
  DateTime parseDateFromString(String date) {
    final List<String> dateList = date.split('-');
    final List<int> dateIntList = [];
    for (final datePart in dateList) {
      dateIntList.add(int.parse(datePart));
    }
    return DateTime(dateIntList[2], dateIntList[1], dateIntList[0]);
  }

//combine last 3 functions
  DateTime parseDateFromApiString(String date) {
    return parseDateFromString(
      replaceDotsWithDashes(
        getSecondDateFromString(date),
      ),
    );
  }
}
