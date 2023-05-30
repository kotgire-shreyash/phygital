import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class Product {
  String name;
  int uniqueId;
  String metadata;
  bool isSold;
  Product(
      {required this.name,
      required this.uniqueId,
      required this.metadata,
      required this.isSold});
}

class ProductFactoryModel extends ChangeNotifier {
  List<Product> productList = [];

  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";

  // This Private key will be used to sign the transactions - that is for calling events in blockchain.
  final String _privateKey =
      "a1ca03033d27d16ec09651db73308d6ca2c52295df7c2f9868d2f3de25f16a20";
  //"41cd4be30b9d653ca923e21f48b3fb21c6c6d609ac3199b0e1e6726426efa0a6";

  late Web3Client _client;
  late String _abiCode;

  late Credentials _credentials;
  late EthereumAddress _contractAddress;
  late EthereumAddress _ownAddress;
  late DeployedContract _contract;

  late ContractFunction _addProduct;
  late ContractFunction _sellProduct;
  late ContractFunction _verifyProduct;
  late ContractEvent newProductEvent;
  late ContractFunction _productsFunction;

  ProductFactoryModel() {
    init();
  }

  void init() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle
        .loadString("smartcontract/build/contracts/ProductFactory.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    _contractAddress =
        // EthereumAddress.fromHex('0xB4628F4d02dfA49ad62514a199c58FAE0Ae3b4FF');
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
    //  _ownAddress = await _credentials.extractAddress();
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "ProductFactory"), _contractAddress);
    _addProduct = _contract.function("addProduct");
    _sellProduct = _contract.function("sellProduct");
    _verifyProduct = _contract.function("verifyProduct");
    newProductEvent = _contract.event('NewProduct');
    _productsFunction = _contract.function('products');
  }

  addProduct(String name, String metadata) async {
    var result;

    await _client
        .events(
            FilterOptions.events(contract: _contract, event: newProductEvent))
        .listen((event) {
      result = newProductEvent.decodeResults(
          event.topics!.toList(), event.data.toString());
    });

    var hash = await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: _addProduct,
        parameters: [name, metadata],
      ),
    );
    print(hash);

    print(result);
    return result;
  }

  sellProduct(BigInt id) async {
    var result = await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: _sellProduct,
        parameters: [id],
      ),
    );
    return result;
  }

  verifyProduct(BigInt id) async {
    var result = await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: _verifyProduct,
        parameters: [id],
      ),
    );
    return result;
  }

  getdetailsbyhash(BigInt id) async {
    // BigInt id = BigInt.parse('146331536');

    var result = await _client
        .call(contract: _contract, function: _verifyProduct, params: [id]);

    print("result from call  " + result.toString());

    return result;
  }
}
