import 'dart:async';
import 'dart:typed_data';

import 'package:bs58/bs58.dart';
import 'package:de_marketplace/core/network_helper/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:pinenacl/api.dart';
import 'package:pinenacl/tweetnacl.dart';
// import 'package:pinenacl/ed25519.dart';
import 'package:provider/provider.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';
// import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth extends ChangeNotifier {
  final NetworkHelper _helper = NetworkHelper();

  PrivateKey? privateKey;
  PublicKey? publicKey;

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
    print('hi');
    try {
      // setLoading(true);
      // notifyListeners();
      //
      // final phantomConnectInstance = PhantomConnect(
      //   appUrl: "https://digitaleyes.market",
      //   deepLink: "https://mgogolowicz.page.link",
      //   // appUrl: "https://solgallery.vercel.app",
      //   // deepLink: "dapp://phantomconnect.io",
      //   // deepLink: "dapp://digitaleyes.market",
      // );

      // Uri launchUri = phantomConnectInstance.generateConnectUri(
      //   cluster: 'mainnet-beta',
      //   redirect: '/connected',
      //   // cluster: 'devnet',
      // );
      // print('launchUri: $launchUri');
      // var name = await launchUrl(
      //   launchUri,
      //   mode: LaunchMode.externalApplication,
      // );
      //
      // print('launchUri: $name');
      // await getTokenAccounts();

      // print('loading: $_loading');

      print('hi');

      var path = "/ul/v1/connect";
      // var path = "ul/v1/connect";
      // print('urlll: $path');
      //
      // print('hye');
      // final keyPair = await Wallet.random();
      // final keyPair = PineNaClUtils.randombytes(24);

      // privateKey = PrivateKey.generate();
      // privateKey =  PrivateKey.decode('c7p6720xzpfxm4xz76vchcmj0c94uffekp8yg67vgr3z7t0w4qfq');
      privateKey = PrivateKey([
        164,
        118,
        245,
        189,
        163,
        6,
        61,
        98,
        88,
        194,
        123,
        228,
        222,
        36,
        194,
        117,
        33,
        11,
        208,
        106,
        150,
        15,
        144,
        111,
        41,
        160,
        16,
        143,
        152,
        237,
        216,
        217
      ].toUint8List());
      publicKey = privateKey?.publicKey;

      print('privateKey: $privateKey');

      //
      // print(
      //     'publicKey: ${base58.encode(Uint8List.fromList(publicKey.publicKey.bytes))}');
      //
      Map<String, dynamic> queryParameters = {
        // "dapp_encryption_public_key":
        //     base58.encode(Uint8List.fromList(publicKey.publicKey.bytes)),
        "dapp_encryption_public_key":
            base58.encode(publicKey!.publicKey.toUint8List()),
        // "cluster": "mainnet-beta",
        "cluster": "devnet",
        "app_url": "https://digitaleyes.market",
        "redirect_link": "https://mgogolowicz.page.link/connecte",
        // "pk": pk,
      };
      //
      final url = Uri(
        scheme: "https",
        host: "phantom.app",
        path: path,
        queryParameters: queryParameters,
      );
      //
      launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
      // await getTokenAccounts();

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

  Future<List<ProgramAccount>> getTokenAccounts() async {
    print('hi');
    // setLoading(true);
    // var response;
    // try {
    //   response = await _helper.getRequest(
    //       'us-central1-digitaleyes-prod.cloudfunctions.net',
    //       'go-quicknode-auth',
    //       null);
    //   print('response: $response');
    //   setLoading(false);
    // } catch (ex) {
    //   setLoading(false);
    //
    //   print('ex: $ex');
    // }
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

    // print('privarteKey: ${base58.encode(privateKey!.toUint8List())}');
    print(
        'privarteKey: ${Base32Encoder.instance.encode(privateKey!.toUint8List())}');
    print('publicKey: ${publicKey.toString()}');
    String pukKey = 'AvZBEmzyQeCtWerzo5zX3sp4aYFHPAMsFx64jbAiyKqz';
    String pukData =
        'P1aw3zoTU7Nwc7nr2VAQggVDpoNcu5n4z7R1SntRw9PjdPMhcfZeQGfKKte25dfuDLd4DnQDuEpWV6Bkw8zrKzbqkpBUb963fXWT6gkKNriGF25o9xvDdmCqBSvCFmQut7DipVAerx4QVRCE6kYrM3PskQcT3DZ83A6cyeZW53FxXmpijLuWvViX4xnbdPgMr2pnA2zPwg3Xy78y78jk7vr6tnJxG117vAQ2kY8gxrs2Gqxt6ocMDUAHJf9PABDG7X1zCZGyhWyYisKxW8Cyyg7tF6v3T8cYBv5i5WsSPPGEA14Ld4XE8su9TrWY78v8MjTPZxsJWYr4svwiivZKuEo3RTScz4utqQrv1vJgY6WkwN8vLmv4yD455Mfo4De163G4F2usbKF5ZLG2RT6odyWsL8bR6hTqw7XR5DnzQvVvhnrm2';
    String puknonce = '64Zk4VyERLByVnQVUrGV4JZKUWtbUFwtQ';

    //
    // Uint8List sharedSecret = TweetNaCl.crypto_box_beforenm(
    //     base58.decode(pukKey),
    //     PineNaClUtils.randombytes(24),
    //     PineNaClUtils.randombytes(24));
    //
    // TweetNaCl.crypto_box_afternm(
    //     base58.decode(pukData), base58.decode(puknonce), sharedSecret, PineNaClUtils.randombytes(24), PineNaClUtils.randombytes(24));

    Uint8List m = base58.decode(pukData);

    final decoded = TweetNaCl.crypto_box_open(
        m,
        base58.decode(pukData),
        base58.decode(pukData).length,
        base58.decode(puknonce),
        base58.decode(pukKey),
        privateKey!.toUint8List());

    print('decoded: $decoded');

    List<ProgramDataFilter> fil = [
      ProgramDataFilter.dataSize(165),
      ProgramDataFilter.memcmpBase58(
          offset: 32, bytes: '3aJwoUPin3BmSDA47KDXhwS4wvP7XBUTEYTwWMoHShRT')
    ];

    // print('fil: ${fil.map((e) => e)}');
//     JsonRpcClient jsonRpcClient = JsonRpcClient(
//         'https://divine-black-tree.solana-mainnet.quiknode.pro/8f1e61d781177e4bafe7fc6801d5b8e5db6a264b/',
//         response['access_token']);
//
// jsonRpcClient.request(method)
//     https://api.mainnet-beta.solana.com/
    RpcClient rpc = RpcClient(
        // 'https://divine-black-tree.solana-mainnet.quiknode.pro/8f1e61d781177e4bafe7fc6801d5b8e5db6a264b/'
        // 'https://api.mainnet-beta.solana.com/'
        'https://us-central1-digitaleyes-prod.cloudfunctions.net/go-qn-proxy');

    final prKey = await rpc.getProgramAccounts(TokenProgram.programId,
        encoding: Encoding.base64, filters: fil);

    print('prKey: $prKey');

    return prKey;
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
