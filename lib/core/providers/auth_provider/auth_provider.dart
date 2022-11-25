import 'dart:async';
import 'dart:typed_data';

import 'package:bs58/bs58.dart';
import 'package:de_marketplace/core/network_helper/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';
// import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth extends ChangeNotifier {
  final NetworkHelper _helper = NetworkHelper();

  bool _loading = false;
  dynamic _latestOffset = 10;
  dynamic _trendingOffset = 0;
  dynamic _verifiedOffset = 0;
  dynamic _latestCollections;
  late dynamic _trendingCollections;
  late dynamic _topVerifiedCollections;
  late dynamic _collectionDetails;
  late dynamic _listingTotal;
  late dynamic _offerings;
  late dynamic _transactions;
  late dynamic _allCollections = [];
  late StreamSubscription _sub;

  bool get loading => _loading;
  dynamic get latestOffset => _latestOffset;
  dynamic get trendingOffset => _trendingOffset;
  dynamic get verifiedOffset => _verifiedOffset;
  dynamic get latestCollections => _latestCollections;
  dynamic get trendingCollections => _trendingCollections;
  dynamic get topVerifiedCollections => _topVerifiedCollections;
  dynamic get collectionDetails => _collectionDetails;
  dynamic get listingTotal => _listingTotal;
  dynamic get offerings => _offerings;
  dynamic get transactions => _transactions;
  dynamic get allCollections => _allCollections;

  static BuildContext? _context;

  setLoading(bool loading) => _loading = loading;
  setLatestOffset(dynamic latestOffset) async {
    _latestOffset = latestOffset;
    notifyListeners();
    dynamic data = await getTopCollections();
    List<dynamic> newList = List.from(latestCollections)..addAll(data);
    setLatestCollection(newList);
    notifyListeners();
  }

  setTrendingOffset(dynamic trendingOffset) async {
    _trendingOffset = trendingOffset;
    notifyListeners();
    dynamic data = await getTrendingCollections();
    List<dynamic> newList = List.from(trendingCollections)..addAll(data);
    print('newList: ${newList.length}');
    setTrendingCollections(newList);
    notifyListeners();
  }

  setVerifiedOffset(dynamic verifiedOffset) async {
    _verifiedOffset = verifiedOffset;
    notifyListeners();
    dynamic data = await getTopVerifiedCollections();
    List<dynamic> newList = List.from(topVerifiedCollections)..addAll(data);
    setTopVerifiedCollections(newList);
    notifyListeners();
  }

  setLatestCollection(dynamic latestCollections) {
    _latestCollections = latestCollections;
    notifyListeners();
  }

  setTrendingCollections(dynamic trendingCollections) =>
      _trendingCollections = trendingCollections;
  setTopVerifiedCollections(dynamic topVerifiedCollections) =>
      _topVerifiedCollections = topVerifiedCollections;
  setCollectionDetails(dynamic collectionDetails) =>
      _collectionDetails = collectionDetails;
  setListingTotal(dynamic listingTotal) => _listingTotal = listingTotal;
  setOfferings(dynamic offerings) => _offerings = offerings;
  setTransactions(dynamic transactions) => _transactions = transactions;
  setAllCollections(dynamic allCollections) => _allCollections = allCollections;
//
//   Future<void> initUniLinks() async {
//     // ... check initialLink
//
// // Attach a listener to the stream
//     _sub = linkStream.listen((String? link) {
//       // Parse the link and warn the user, if it is not correct
//     }, onError: (err) {
//       // Handle exception by warning the user their action did not succeed
//     });
//
//     print('subbb: $_sub');
//
// // NOTE: Don't forget to call _sub.cancel() in dispose()
//   }

  // getPublicKey()async{
  //   await Wallet.
  // }

  connectToMyWallet(
    BuildContext context,
  ) async {
    try {
      // setLoading(true);
      // notifyListeners();
      await getTokenAccounts();

      final phantomConnectInstance = PhantomConnect(
        appUrl: "https://digitaleyes.market",
        deepLink: "https://mgogolowicz.page.link",
        // appUrl: "https://solgallery.vercel.app",
        // deepLink: "dapp://phantomconnect.io",
      );

      Uri launchUri = phantomConnectInstance.generateConnectUri(
        cluster: 'mainnet-beta',
        redirect: '/start',
        // cluster: 'devnet',
      );
      print('launchUri: $launchUri');
      var name = await launchUrl(
        launchUri,
        mode: LaunchMode.externalApplication,
      );

      print('launchUri: $name');

      // print('loading: $_loading');

      // var path = "/ul/browse/https://www.digitaleyes.market/wallet";
      // var path = "ul/v1/connect";
      // print('urlll: $path');
      //
      // print('hye');
      // final publicKey = await Wallet.random();
      //
      // print(
      //     'publicKey: ${base58.encode(Uint8List.fromList(publicKey.publicKey.bytes))}');
      //
      // Map<String, dynamic> queryParameters = {
      //   "dapp_encryption_public_key":
      //       base58.encode(Uint8List.fromList(publicKey.publicKey.bytes)),
      //   "cluster": "mainnet-beta",
      //   "app_url": "https://google.com",
      //   "redirect_link": "https://mgogolowicz.page.link",
      //   // "pk": pk,
      // };
      //
      // final url = Uri(
      //   scheme: "https",
      //   host: "phantom.app",
      //   path: path,
      //   queryParameters: queryParameters,
      // );
      //
      // launchUrl(
      //   url,
      //   mode: LaunchMode.externalNonBrowserApplication,
      // );
      //
      // setLoading(false);
      // notifyListeners();
      //
      // initUniLinks();
    } catch (ex) {
      setLoading(false);
      notifyListeners();
      print('exception: ${ex.toString()}');
    }
  }

  getTokenAccounts() async {
    print('hi');
    setLoading(true);
    var response;
    try {
      response = await _helper.getRequest(
          'us-central1-digitaleyes-prod.cloudfunctions.net',
          'go-quicknode-auth',
          null);
      print('response: $response');
      setLoading(false);
    } catch (ex) {
      setLoading(false);

      print('ex: $ex');
    }
    // List<dynamic> filters = [
    //   {
    //     "dataSize": 165, //size of account (bytes)
    //   },
    //   {
    //     "memcmp": {
    //       "offset": 32,
    //       //location of our query in the account (bytes)
    //       "bytes": '6SdJCPRyY6rm4xmeYhy9KFSucMJUBPqKD3aV2AqSSg43',
    //       //our search criteria, a base58 encoded string
    //     }
    //   }
    // ];
    List<ProgramDataFilter> fil = [
      ProgramDataFilter.dataSize(165),
      ProgramDataFilter.memcmpBase58(
          offset: 32, bytes: '6SdJCPRyY6rm4xmeYhy9KFSucMJUBPqKD3aV2AqSSg43')
    ];

    // print('fil: ${fil.map((e) => e)}');

    RpcClient rpc = RpcClient(
        'https://divine-black-tree.solana-mainnet.quiknode.pro/8f1e61d781177e4bafe7fc6801d5b8e5db6a264b/');

    final prKey = await rpc.getProgramAccounts(TokenProgram.programId,
        encoding: Encoding.base64, filters: fil);

    print('pr: $prKey');
  }

  connectWallet(
      BuildContext context, String? name, String mintId, String pk) async {
    try {
      // setLoading(true);
      // notifyListeners();
      //
      // print('loading: $_loading');

      var path =
          "/ul/browse/https://www.digitaleyes.market/item/${name?.replaceAll('%', '~').replaceAll('_', '__').replaceAll('-', '_').replaceAll(' ', '-')}/$mintId?pk=$pk";
      print('urlll: $path');

      print('hye');
      final publicKey = await Wallet.random();

      print(
          'publicKey: ${base58.encode(Uint8List.fromList(publicKey.publicKey.bytes))}');

      Map<String, dynamic> queryParameters = {
        "dapp_encryption_public_key":
            base58.encode(Uint8List.fromList(publicKey.publicKey.bytes)),
        "cluster": "mainnet-beta",
        "app_url": "https://google.com",
        "redirect_link": "https://mgogolowicz.page.link/start",
        "pk": pk,
      };

      final url = Uri(
        scheme: "https",
        host: "phantom.app",
        path: path,
        queryParameters: queryParameters,
      );

      launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );

      // setLoading(false);
      // notifyListeners();
      //
      // initUniLinks();
    } catch (ex) {
      setLoading(false);
      notifyListeners();
      print('exception: ${ex.toString()}');
    }
  }

  Future<dynamic> getTopCollections() async {
    _loading = true;
    var data = await _helper.fetchTopCollections(latestOffset);
    _loading = false;

    notifyListeners();
    return data;
  }

  Future<dynamic> getAllCollections() async {
    _loading = true;
    var data = await _helper.fetchAllCollections();
    _loading = false;

    notifyListeners();
    return data;
  }

  Future<dynamic> getTrendingCollections() async {
    _loading = true;
    var data = await _helper.fetchTrendingCollections(trendingOffset);
    print('fetchTrendingCollections: $data');
    _loading = false;

    // setTrendingCollections(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> getTopVerifiedCollections() async {
    _loading = true;
    var data = await _helper.fetchTopVerifiedCollections(verifiedOffset);
    print('fetchTopVerifiedCollections: $data');
    _loading = false;

    // setTopVerifiedCollections(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> getCollectionDetails(String name) async {
    _loading = true;
    var data = await _helper.fetchCollectionDetails(name);
    print('getCollectionDetails: $data');
    _loading = false;

    setCollectionDetails(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> getListingTotal(String name) async {
    _loading = true;
    var data = await _helper.fetchTotalOffers(name);
    print('getListingTotal: $data');
    _loading = false;

    setListingTotal(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> getOfferings(String name) async {
    _loading = true;
    var data = await _helper.fetchOfferings(name);
    print('getOfferings: $data');
    _loading = false;

    // var newData = data[0];
    //
    // print('metadata: ${jsonDecode(newData['metadata'].replaceAll('\\', ''))}');
    setOfferings(data);
    notifyListeners();
    return data;
  }

  Future<dynamic> getActivities(String name) async {
    _loading = true;
    var data = await _helper.fetchActivities(name);
    print('getActivities: $data');
    _loading = false;

    // print('metadata: ${jsonDecode(data[0]['tags'].replaceAll('\\', ''))}');
    setTransactions(data);
    notifyListeners();
    return data;
  }

  static Auth authProvider(BuildContext context, {bool listen = false}) {
    _context = context;
    return Provider.of<Auth>(context, listen: listen);
  }
}
