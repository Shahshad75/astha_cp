import 'package:astha_cp/utils/app_exception.dart';
import 'package:either_dart/either.dart';

typedef EitherResponse<T> = Future<Either<AppException, T>>;

