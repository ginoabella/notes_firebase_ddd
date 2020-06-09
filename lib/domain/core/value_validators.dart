import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'package:notes_firebase/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLenght,
) {
  if (input.length <= maxLenght) {
    return right(input);
  } else {
    return left(
        ValueFailure.exceedingLength(fieldValue: input, max: maxLenght));
  }
}

Either<ValueFailure<String>, String> validdateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(fieldValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains('\n')) {
    return right(input);
  } else {
    return left(ValueFailure.multiLine(fieldValue: input));
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLenght<T>(
  KtList<T> input,
  int maxLenght,
) {
  if (input.size <= maxLenght) {
    return right(input);
  } else {
    return left(ValueFailure.listTooLong(fieldValue: input, max: maxLenght));
  }
}

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
