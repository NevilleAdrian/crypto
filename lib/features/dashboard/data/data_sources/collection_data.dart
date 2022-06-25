import 'package:de_marketplace/core/error/app_exceptions.dart'
    as app_exceptions;
import 'package:de_marketplace/features/dashboard/data/models/collection.dart';
import 'package:de_marketplace/features/dashboard/data/repository_contracts/collection_contract.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'collection_mutation.dart';
import 'http_client_data.dart';

class CollectionDataImpl implements CollectionData {
  late final ApiData apiData;

  CollectionDataImpl({required this.apiData});

  @override
  Future<List<Collection>> fetchLatest() async {
    final response = await apiData.graphQlClient.value.mutate(MutationOptions(
      document: gql(CollectionMutations.latest),
    ));
    if (response.data == null) {
      throw app_exceptions.ServerException("Unknown Error");
    } else if (response.data!.containsKey("errors")) {
      throw app_exceptions.ServerException("An error occurred");
    } else {
      return (response.data!["data"]["collections"]["nodes"] as List)
          .map((e) => Collection.fromJson(e))
          .toList();
    }
  }

  @override
  Future<List<Collection>> fetchTopverified() async {
    final response = await apiData.graphQlClient.value.mutate(MutationOptions(
      document: gql(CollectionMutations.topVerified),
    ));
    if (response.data == null) {
      throw app_exceptions.ServerException("Unknown Error");
    } else if (response.data!.containsKey("errors")) {
      throw app_exceptions.ServerException("An error occurred");
    } else {
      return (response.data!["data"]["collections"]["nodes"] as List)
          .map((e) => Collection.fromJson(e))
          .toList();
    }
  }

  @override
  Future<List<Collection>> fetchTrending() async {
    final response = await apiData.graphQlClient.value.mutate(MutationOptions(
      document: gql(CollectionMutations.trending),
    ));
    if (response.data == null) {
      throw app_exceptions.ServerException("Unknown Error");
    } else if (response.data!.containsKey("errors")) {
      throw app_exceptions.ServerException("An error occurred");
    } else {
      return (response.data!["data"]["collections"]["nodes"] as List)
          .map((e) => Collection.fromJson(e))
          .toList();
    }
  }
}
