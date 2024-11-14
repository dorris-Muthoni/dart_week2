void stringManipulation(String input) {
  // Concatenation
  String greeting = 'Hello, ' + input + '!';

  // Interpolation
  String interpolatedString = 'Hello, $input!';

  // Substring Extraction
  String substring = input.substring(0, 3); // First 3 characters

  // Case Conversion
  String upperCase = input.toUpperCase();
  String lowerCase = input.toLowerCase();

  // Reverse String
  String reversed = input.split('').reversed.join();

  // Length of String
  int length = input.length;

  print('Greeting: $greeting');
  print('Interpolated String: $interpolatedString');
  print('Substring (first 3 chars): $substring');
  print('Uppercase: $upperCase');
  print('Lowercase: $lowerCase');
  print('Reversed String: $reversed');
  print('Length: $length');
}

void main() {
  stringManipulation("Doris");
}

