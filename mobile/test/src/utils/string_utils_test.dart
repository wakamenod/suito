import 'package:flutter_test/flutter_test.dart';
import 'package:suito/src/utils/string_utils.dart';

void main() {
  group('String.orNull', () {
    test('turns the "no selection" empty string into SQL NULL', () {
      expect(''.orNull, isNull);
    });

    test('leaves a real id alone', () {
      expect('c1'.orNull, 'c1');
    });

    test('keeps whitespace, which is not the same as no selection', () {
      expect(' '.orNull, ' ');
    });
  });
}
