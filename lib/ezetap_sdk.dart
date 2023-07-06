import 'dart:async';

import 'package:ezetap_sdk/model/CardInfoRequest.dart';
import 'package:ezetap_sdk/model/FetchTxnDetailsRequest.dart';
import 'package:ezetap_sdk/model/InitializeRequest.dart';
import 'package:ezetap_sdk/model/PaymentRequest.dart';
import 'package:ezetap_sdk/model/RefundRequest.dart';
import 'package:ezetap_sdk/model/SearchTxnRequest.dart';
import 'package:ezetap_sdk/model/SendReceiptRequest.dart';
import 'package:ezetap_sdk/model/ServiceRequest.dart';
import 'package:ezetap_sdk/model/StopPaymentRequest.dart';
import 'package:flutter/services.dart';

import 'model/AttachSignRequest.dart';

class EzetapSdk {
  static const MethodChannel _channel = MethodChannel('eze_sdk_flutter');

  static Future<String> initialize(InitializeRequest request) async {
    final String result = await _channel.invokeMethod('initialize', initializeRequestToJson(request));
    return result;
  }

  static Future<String> prepareDevice() async {
    final String result = await _channel.invokeMethod('prepareDevice');
    return result;
  }

  static Future<String> sendReceipt(SendReceiptRequest request) async {
    final String result = await _channel.invokeMethod('sendReceipt', sendReceiptRequestToJson(request));
    return result;
  }

  static Future<String> serviceRequest(ServiceRequest request) async {
    final String result = await _channel.invokeMethod('serviceRequest', serviceRequestToJson(request));
    return result;
  }

  static Future<String> searchTransaction(SearchTxnRequest request) async {
    final String result =
        await _channel.invokeMethod('searchTransaction', searchTxnRequestToJson(request));
    return result;
  }

  static Future<String> getTransaction(FetchTxnDetailsRequest request) async {
    final String result = await _channel.invokeMethod('getTransaction', fetchTxnDetailsRequestToJson(request));
    return result;
  }

  static Future<String> checkForIncompleteTransaction() async {
    final String result =
        await _channel.invokeMethod('checkForIncompleteTransaction');
    return result;
  }

  static Future<String> voidTransaction(String transactionID) async {
    final String result =
        await _channel.invokeMethod('voidTransaction', transactionID);
    return result;
  }

  static Future<String> attachSignature(AttachSignRequest request) async {
    final String result = await _channel.invokeMethod('attachSignature', attachSignRequestToJson(request));
    return result;
  }

  static Future<String> pay(PaymentRequest request) async {
    final String result = await _channel.invokeMethod('pay', paymentRequestToJson(request));
    return result;
  }


  static Future<String> printReceipt(String transactionID) async {
    final String result =
        await _channel.invokeMethod('printReceipt', transactionID);
    return result;
  }

  static Future<String> printBitmap(String? base64Image) async {
    final String result =
        await _channel.invokeMethod('printBitmap', base64Image);
    return result;
  }

  static Future<String> logout() async {
    final String result = await _channel.invokeMethod('logout');
    return result;
  }


  static Future<String> stopPayment(StopPaymentRequest request) async {
    final String result = await _channel.invokeMethod('stopPayment', stopPaymentRequestToJson(request));
    return result;
  }

  static Future<String> scanBarcode() async {
    final String result = await _channel.invokeMethod('scanBarcode');
    return result;
  }

  static Future<String> getCardInfo(CardInfoRequest request) async {
    final String result = await _channel.invokeMethod('getCardInfo',cardInfoRequestToJson(request));
    return result;
  }

  static Future<String> refundTransaction(RefundRequest request) async {
    final String result =
        await _channel.invokeMethod('refundTransaction', refundRequestToJson(request));
    return result;
  }

  static Future<String> checkForUpdates() async {
    final String result = await _channel.invokeMethod('checkUpdates');
    return result;
  }
}
