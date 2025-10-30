import 'package:flutter_test/flutter_test.dart';
import 'package:medpal/core/utils/result_utils.dart';

void main() {
  group('success', () {
    test('should call success callback with the success value when the result is a success', () {
      var successValue = 0;
      const success = Success(5);
      success.when((error) {}, (value) => successValue = value);
      expect(successValue, 5);
    });

    test('isError of a success response should be false', () {
      const success = Success(5);
      expect(success.isError, false);
    });

    test('whenSuccess should be called with the success value in a success response', () {
      const success = Success(5);
      success.whenSuccess((successValue) {
        expect(successValue, 5);
      });
    });

    test('whenError of a success response should be null', () {
      const success = Success(5);
      expect(success.whenError((_) {}), isNull);
    });

    test('getError of a success response should return null', () {
      const success = Success(5);
      expect(success.getError(), isNull);
    });
  });

  group('error', () {
    test('should call error callback with the error value when the result is an error', () {
      var errorValue = 0;
      const error = Error(5);
      error.when((error) => errorValue = 5, (value) {});
      expect(errorValue, 5);
    });

    test('isSuccess of an error response should be false', () {
      const error = Error(5);
      expect(error.isSuccess, false);
    });

    test('whenError should be called with the error value in an error response', () {
      const error = Error(5);
      error.whenError((errorValue) {
        expect(errorValue, 5);
      });
    });

    test('whenSuccess of an error response should be null', () {
      const error = Error(5);
      expect(error.whenSuccess((_) {}), isNull);
    });

    test('getSuccess of an error response should return null', () {
      const error = Error(5);
      expect(error.getSuccess(), isNull);
    });
  });
}
