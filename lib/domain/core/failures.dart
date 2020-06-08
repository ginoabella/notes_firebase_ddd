import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T fieldValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T fieldValue,
  }) = Empty<T>;
  const factory ValueFailure.multiLine({
    @required T fieldValue,
  }) = MultiLine<T>;
  const factory ValueFailure.listTooLong({
    @required T fieldValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory ValueFailure.invalidEmail({
    @required T fieldValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T fieldValue,
  }) = ShortPassword<T>;
}
