import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiData {
  ApiData();

  ValueNotifier<GraphQLClient> graphQlClient = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: HttpLink(
          "https://us-central1-digitaleyes-prod.cloudfunctions.net/go-digitaleyes-backend-gql-test"),
    ),
  );
}
