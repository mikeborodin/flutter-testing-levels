import 'package:flutter_test/flutter_test.dart';

void main() {
  group('My Group', () {
    test('2+2 should be 4', () async {
      //Arrange
      final array = [2, 2];

      //Act
      final actualSum = array.reduce((value, element) => value + element);

      //Assert
      expect(actualSum, 4);
    });
  });
}
