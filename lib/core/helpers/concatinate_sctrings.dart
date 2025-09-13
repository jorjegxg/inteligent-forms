String concatinateStringsComma(List<String> strings) {
  String result = '';
  for (int i = 0; i < strings.length; i++) {
    result += strings[i];
    if (i != strings.length - 1) {
      result += ', ';
    }
  }
  return result;
}

String concatinateStrings(List<String> strings) {
  String result = '';
  for (int i = 0; i < strings.length; i++) {
    result += strings[i];
  }
  return result;
}
