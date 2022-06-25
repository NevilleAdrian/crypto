import '../models/collection.dart';

abstract class CollectionData {
  Future<List<Collection>> fetchLatest();
  Future<List<Collection>> fetchTrending();
  Future<List<Collection>> fetchTopverified();
}
