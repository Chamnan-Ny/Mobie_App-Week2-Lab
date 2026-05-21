class CustomDuration {
  final int _milliseconds;

  CustomDuration._internal(int ms) : _milliseconds = ms < 0 ? 0 : ms;

  factory CustomDuration.fromHours(int hours) {
    return CustomDuration._internal(hours * 3600 * 1000);
  }

  factory CustomDuration.fromMinutes(int minutes) {
    return CustomDuration._internal(minutes * 60 * 1000);
  }

  factory CustomDuration.fromSeconds(int seconds) {
    return CustomDuration._internal(seconds * 1000);
  }

  int get inMilliseconds => _milliseconds;
  int get inSeconds => _milliseconds ~/ 1000;
  int get inMinutes => _milliseconds ~/ (60 * 1000);
  int get inHours => _milliseconds ~/ (3600 * 1000);

  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._internal(_milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    return CustomDuration._internal(_milliseconds - other._milliseconds);
  }

  @override
  String toString() {
    return '${inHours}h ${inMinutes % 60}m ${inSeconds % 60}s';
  }
}

void main() {
  var d1 = CustomDuration.fromHours(2);
  var d2 = CustomDuration.fromMinutes(90);
  var d3 = CustomDuration.fromSeconds(3600);

  print(d1); 
  print(d2); 
  print(d3); 

  print(d1 > d2); 
  print(d2 > d3); 

  var added = d2 + d3;
  print(added); 

  var minus = d1 - d3;
  print(minus); 

  var zero = d3 - d1;
  print(zero); 
}
