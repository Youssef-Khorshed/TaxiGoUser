int convertToMinutes(String timeString) {
  RegExp regExp = RegExp(r'(?:(\d+)\s*hours?\s*)?(?:(\d+)\s*mins?)?');
  var match = regExp.firstMatch(timeString);
  int hours = match?.group(1) != null ? int.parse(match!.group(1)!) : 0;
  int minutes = match?.group(2) != null ? int.parse(match!.group(2)!) : 0;
  return hours * 60 + minutes;
}

int convertMilesToKilometers(double miles) {
  return (miles * 1.60934).round();
}
