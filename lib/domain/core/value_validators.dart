import 'package:dartz/dartz.dart';

import 'package:notes_firebase/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return Right(input);
  } else {
    return Left(ValueFailure.invalidEmail(fieldValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  if (input.length >= 6) {
    return Right(input);
  } else {
    return Left(ValueFailure.shortPassword(fieldValue: input));
  }
}