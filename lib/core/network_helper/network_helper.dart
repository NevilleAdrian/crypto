import 'dart:convert';

import 'package:de_marketplace/core/error/app_exceptions.dart';
import 'package:de_marketplace/core/utils/constants.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> fetchTopCollections(dynamic offset) async {
    HttpLink link = HttpLink(url);
    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));

    QueryResult queryResult = await qlClient
        .query(QueryOptions(document: gql(""" query LatestCollections {
                            collections(limit: 10, offset:$offset, verifeyed: true) {
                            totalCount
                              nodes {
                                name
                                verifeyed
                                thumbnail
                                isNsfw
                              }
                            }
                          }""")));

    return queryResult.data!['collections']['nodes'];
  }

  String filterOptions(String type) {
    print('typess: $type');
    if (type == 'search') {
      return "name";
    } else if (type == 'total') {
      return "-volumeTotal";
    } else if (type == 'vol24h') {
      return "-volumePast24h";
    } else if (type == 'epoch') {
      return "publishedEpoch";
    } else if (type == 'vol7D') {
      return "-volumePast7days";
    } else if (type == 'floorPriceH') {
      return "floorPrice";
    } else {
      return '-floorPrice';
    }
  }

  Future<dynamic> fetchMintCalendar(dynamic offset) async {
    print('queryResult: $url');
    // print('filterOptions: ${filterOptions(type)}');

    HttpLink link = HttpLink(url);
    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));

    QueryOptions options;

    try {
      options = QueryOptions(document: gql(""" query MintCalendar {
                            mintCalendar(offset: 0 limit: 200 )
                            {
                            totalCount
                              nodes {
                                discord
                                description
                                price
                                name
                                twitter
                                website
                                logo_url
                                thumbnail
                                launch_date
                                
                              }
                            }
                          }"""));

      print('properties : ${options.asRequest}');
      QueryResult queryResult = await qlClient.query(options);

      print('queryResult; ${queryResult.data}');
      print('queryResult');

      return queryResult.data!['mintCalendar']['nodes'];
    } catch (ex) {
      print('ex: $ex');
    }
  }

  Future<dynamic> fetchAllCollections(dynamic offset, String type,
      [String? name]) async {
    print('queryResult: $url');
    print('filterOptions: ${filterOptions(type)}');

    HttpLink link = HttpLink(url);
    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));

    QueryOptions options;

    print('name: $name');
    print('type: $type');
    try {
      if (name == null && type != 'search') {
        options = QueryOptions(document: gql(""" query ExploreAllCollections {
                            collections(offset: $offset, limit: 10,  orderBy: "${filterOptions(type)}")
                            {
                            totalCount
                              nodes {
                                name
                                verifeyed
                                description
                                thumbnail
                                isNsfw
                                floorPrice
                                volumePast24h
                                volumeTotal
                                
                              }
                            }
                          }"""));
      } else {
        options = QueryOptions(document: gql(""" query ExploreAllCollections {
                            collections(offset: $offset, limit: 10, orderBy: "name", name: ">=$name")
                            {
                            totalCount
                              nodes {
                                name
                                verifeyed
                                thumbnail
                                isNsfw
                                floorPrice
                                volumePast24h
                                volumeTotal
                              }
                            }
                          }"""));
      }

      print('properties : ${options.asRequest}');
      QueryResult queryResult = await qlClient.query(options);

      print('queryResult; ${queryResult.data}');
      print('queryResult');

      return queryResult.data!['collections']['nodes'];
    } catch (ex) {
      print('ex: $ex');
    }
  }

  Future<dynamic> fetchTrendingCollections(dynamic offset) async {
    HttpLink link = HttpLink(url);
    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));

    QueryResult queryResult = await qlClient
        .query(QueryOptions(document: gql(""" query TrendingCollections {
                                collections(limit: 10, offset:$offset, orderBy: "-volumePast24h") {
                                totalCount
                                  nodes {
                                    name
                                    verifeyed
                                    thumbnail
                                    isNsfw
                                  }
                                }
                              }""")));

    return queryResult.data!['collections']['nodes'];
  }

  Future<dynamic> fetchTopVerifiedCollections(dynamic offset) async {
    HttpLink link = HttpLink(url);
    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));

    QueryResult queryResult = await qlClient
        .query(QueryOptions(document: gql(""" query TopVerifeyedCollections {
                                        collections(limit: 15, offset:$offset, isCurated: true) {
                                            totalCount
                                            nodes {
                                              name
                                              verifeyed
                                              thumbnail
                                              isNsfw
                                            }
                                          }
                                        }""")));

    return queryResult.data!['collections']['nodes'];
  }

  Future<dynamic> fetchCollectionDetails(String name) async {
    HttpLink link = HttpLink(url);

    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
    QueryResult queryResult;
    try {
      queryResult = await qlClient
          .query(QueryOptions(document: gql("""query CollectionQuery {
                                      collections(name: "$name") {
                                        nodes {
                                          bannerUrl
                                          twitter
                                          name
                                          isDerivative
                                          discord
                                          collectionId
                                          floorPrice
                                          description
                                          volumeTotal
                                          verifeyed
                                        }
                                      }
                                      }
                                      """)));

      print('resultt: ${queryResult.data}');
      return queryResult.data!['collections']['nodes'];
    } catch (ex) {
      // debugPrint('queryResult: ${queryResult.data}');
      print('exceptin:$ex');
    }
  }

  Future<dynamic> fetchTotalOffers(String name) async {
    HttpLink link = HttpLink(url);

    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
    QueryResult queryResult;
    try {
      queryResult = await qlClient
          .query(QueryOptions(document: gql("""query GqlTotalOffersQuery {
                                     offers(collection: "$name") {
                                        totalCount
                                      }  
                                      }
                                      """)));

      print('resultt: ${queryResult.data}');
      return queryResult.data!['offers']['totalCount'];
    } catch (ex) {
      // debugPrint('queryResult: ${queryResult.data}');
      print('exceptin:$ex');
    }
  }

  Future<dynamic> fetchOfferings(String name, String orderBy) async {
    HttpLink link = HttpLink(url);

    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
    QueryResult queryResult;
    try {
      QueryOptions options =
          QueryOptions(document: gql("""query GqlTotalOffersQuery {
                                     offers(limit: 10, collection: "$name", orderBy: "$orderBy") {
                                        nodes {
                                            collection
                                            offerName
                                            mint
                                            price
                                            metadata
                                            pubkey
                                            contract
                                            addEpoch
                                            marketplace
                                            creators
                                            flagCount
                                            tags
                                            uri
                                            owner
                                            isNsfw
                                            is_nft
                                            verifeyed
                                            id
                                          }
                                      }  
                                      }
                                      """));
      print('propertiess : ${options.asRequest}');
      queryResult = await qlClient.query(options);

      print('resultt: ${queryResult.data}');
      return queryResult.data!['offers']['nodes'];
    } catch (ex) {
      // debugPrint('queryResult: ${queryResult.data}');
      print('exceptin:$ex');
    }
  }

  Future<dynamic> fetchActivities(String name) async {
    HttpLink link = HttpLink(url);

    GraphQLClient qlClient =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
    QueryResult queryResult;
    try {
      queryResult = await qlClient
          .query(QueryOptions(document: gql("""query GqlTotalOffersQuery {
                                     transactions(limit: 10,  collection: "$name", orderBy: "-epoch", type: "SALE") {
                                        nodes {
                                             buyer
                                             seller
                                             tags
                                             type
                                             mint
                                             price
                                             epoch
                                          }
                                        }  
                                      }
                                      """)));

      print('resultt: ${queryResult.data}');
      return queryResult.data!['transactions']['nodes'];
    } catch (ex) {
      // debugPrint('queryResult: ${queryResult.data}');
      print('exceptin:$ex');
    }
  }

  Future<dynamic> getRequest(String BaseUrl, String url,
      [String? token]) async {
    print('urll: ${uriConverter(BaseUrl, url)}');
    var response =
        await http.get(uriConverter(BaseUrl, url), headers: kHeaders(token));
    print(response);
    if (response.statusCode.toString().startsWith('2')) {
      var decoded = jsonDecode(response.body);
      print('decoded: $decoded');
      return decoded;
    } else {
      print(response);
      throw AuthException(response.reasonPhrase ?? 'Unknown error');
    }
  }
}
