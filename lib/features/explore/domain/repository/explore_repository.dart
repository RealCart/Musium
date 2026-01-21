import 'package:musium/core/utils/either/either.dart';

abstract interface class ExploreRepository {
  Future<Either<Failure, List<String>>> suggestQuery(String query);
}