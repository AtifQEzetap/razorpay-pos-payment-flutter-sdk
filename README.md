# razorpay-pos-payment-flutter-sdk

[//]: # ([![pub package]&#40;https://img.shields.io/pub/v/ezetap_sdk.svg&#41;]&#40;https://pub.dev/packages/ezetap_sdk&#41;)

[//]: # ([![pub points]&#40;https://img.shields.io/pub/points/ezetap_sdk?color=2E8B57&label=pub%20points&#41;]&#40;https://pub.dev/packages/ezetap_sdk/score&#41;)

[//]: # ()
Welcome to Ezetap Payments Flutter SDK integration! You can easily collect payments from your
existing android applications by integrating the SDK.

## How integration works

1. Include the SDK in your mobile application to collect payments.
2. SDK interfaces with a Service App, this App will be installed during run-time.
3. Service App interfaces with the Card Device and Ezetap Servers to finish payment processing and
   notifies the status to SDK.

## Prerequisites

Supported on Android API version 16(JellyBean) or above.

## Use this package as a library

This will add a line like this to your package's pubspec.yaml (and run an
implicit ```flutter pub get```)

```
dependencies:
  ezetap_sdk: ^0.0.1
```

## Import it

Now in your Dart code, you can use:

```import 'package:ezetap_sdk/ezetap_sdk.dart';```

## How to use

It's very simple and easy to call all the APIs available in our SDK  :

## Initialization API

```Dart
String? result = await EzetapSdk.initialize(request);
```

The first API that needs to be integrated with is the “Initialize” API, this API performs the following 3 key activities:-
 * Initializes the SDK with global configuration settings
 * Connects to the appropriate Razorpay server based on Application mode (AppMode) = DEMO/ PROD
 * Connects to the appropriate merchant account, this depends on the app key entered

Below is the request code for API with parameters

<details>

<summary>Code Snippet</summary>

```Dart
InitializeRequest request = InitializeRequest(
prodAppKey: "",
demoAppKey: "",
merchantName: "",
userName: "",
currencyCode: "INR",
appMode: "DEMO",
captureSignature: true,
prepareDevice: false,
captureReceipt: true);
```
</details>

<details>
<summary>Keys Information</summary>


| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
|       **appMode**           | Add Demo/Prod appmode | Yes         | 
| **merchantName - String(80)** | Merchant name provided to every merchant by Razorpay PoS is part of your account credentials|   Yes     |
| **demoAppKey - String(50)**  | Demo app key provided by Razorpay PoS Team | Yes (In case of demo integration)         | 
| **prodAppKey - String(50)**  | Prod app key provided by Razorpay PoS Team|   Yes (In case of prod integration)     |
| **userName - String(20)**    | Username provided by Razorpay PoS Team| Yes         | 
| **password**                 | If LoginType is userId, then you need to add a password or subscriberId. It can be of any length.| Yes (If not adding subscriberId)     |
| **prepareDevice - Boolean**  |  | No         | 
| **captureSignature - Boolean**| if you want to capture signature  |   No     |

</details>

## Payment Transaction API

```Dart
String? result = await EzetapSdk.pay(request);
```

Razorpay POS has a universal pay API through which all the payment modes (that is enabled for the merchant) can be invoked through a single API call. With this API there will be no need of calling the individual methods for different payment modes (like Card, Remote Pay, UPI etc).

Preparing Input for the Pay API

<details>
<summary>Code Snippet</summary>

```Java
PaymentRequest request = PaymentRequest(
        amount: "10",
        options: Options(
            serviceFee: -1,
            customer: Customer(email: "tt@tt.com", mobileNo: "", name: ""),
            emiType: "NORMAL",
            paymentBy: "ANY",
            paymentMode: "CARD",
            references: References(
                additionalReferences: List.empty(),
                reference1: "1234",
                reference2: "",
                reference3: ""),
            providerName: "EMI",
            appData: AppData(walletAcquirer: "")));

```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **amount** | The amount to be paid by the customer | Yes         | 
| **txnType** | Type of the transaction i.e. PAY, CARD, UPI etc. |   Yes     |
| **username**  | Unique identifier of the user. Recommended to set this as the user mobile number | Yes        | 
| **reference1**  | The reference1 will be the primary reference ID, please make sure this is unique for each context of payment | No        | 
| **options**  | All the optional params will go under the options object in the input. | No        | 
| **additionalReferences**  | In few cases you might want put more context to the payment like items part of the order, store location, type of item etc. This secondary information can go in additional References list. | No        | 

Note: You would like to associate some context for the payment like order number, invoice number, receipt number etc. This information can go in as reference1, reference2 of the references object. We support a total of seven primary references that can be associated to the payment (reference1-7). 

</details>


## Prepare Device API

```Dart
String? result = await EzetapSdk.prepareDevice();
```
Prepare Device is used to initialize the device (card reader) with the updated encryption keys from the corresponding bank

This API doesn't need any request parameters

## Get Card Info API

```Dart
String? result = await EzetapSdk.getCardInfo(request);
```

Get Card Info API is used to get the card information with the type of card, card number etc.

Below is the request code for API with parameters

<details>
<summary>Code Snippet</summary>

```Dart
CardInfoRequest request = CardInfoRequest(cardType: "your card type");
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **cardType** | The type of card you are using  | Yes         | 

</details>

## Service Request API

```Dart
String? result = await EzetapSdk.serviceRequest(request);
```
Razorpay provides a way to send service on request to customers. You can pass merchnat mobile number, email , issue type, issue info respectively as part of object.

Below is the request code for API with parameters

<details>

<summary>Code Snippet</summary>

```Dart
ServiceRequest request =
        ServiceRequest(issueInfo: "", issueType: "", tags: List.empty());
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **issueType**  | Type of the issue fro the request  | No        | 
| **issueInfo**  | Information about the issue  | No        | 
| **tags**  | Tags related to the issue  | No        | 

</details>

## Send Receipt API

```Java
String? result = await EzetapSdk.sendReceipt(request);
```
You can use below API to send Razorpay PoS's payment receipt or charge-slip

Below is the request code for API with parameters

<details>

<summary>Code Snippet</summary>

```Dart
SendReceiptRequest request = SendReceiptRequest(
        customerName: "", mobileNo: "", email: "", txnId: "");
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnId** | The transaction Id of the transaction | Yes         | 
| **mobileNo** | Mobile number of the user |   Yes     |
| **email**  | Email id  of the user  | Yes        | 

</details>

## Attach Signature API

```Dart
String? result = await EzetapSdk.attachSignature(request);
```
This API allow you to attach an e-signature from the customer for payments.

Below is the request code for API with parameters

<details>

<summary>Code Snippet</summary>

```Dart
AttachSignRequest request = AttachSignRequest(txnId: "");
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnId**  | The transaction Id of the transaction| Yes        | 

</details>


## Get Transaction API

```Dart
String? result = await EzetapSdk.getTransaction(request);
```
This API is used to get the transaction details with reference.

Below is the request code for API with parameters

<details>

<summary>Code Snippet</summary>

```Dart
FetchTxnDetailsRequest request = FetchTxnDetailsRequest(
        options: Options(
            appData: AppData(app1: "", app2: "", app3: ""),
            references: References(
                reference1: "", additionalReferences: List.empty())));
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **additionalReferences**  | In few cases you might want put more context to the payment like items part of the order, store location, type of item etc. This secondary information can go in additional References list. | No        | 
| **references**  | Transaction reference  | No        | 

</details>

## Check For Incomplete Transaction API

```Dart
String? result = await EzetapSdk.checkForIncompleteTransaction();
```

In case of an incomplete transaction for a user, the user is intimated about the status of the previous transaction. The App will prompt the user to check the status of the previous transaction before attempting a new transaction. The API will return details of the transaction (Status) as well.

This request does not required any parameters

## Void Transaction API

```Dart
String? result = await EzetapSdk.voidTransaction(transactionID);
```
If the customer choose to return the service and you wish refund the money on the same day, in this case you can do void of a payment. Voiding a payment means that you cancel the payment before the settlement of money is made. If settlement is initiated then void won't work, this API is helpful if same day refund needs to be done.

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **trasactionId** | Transaction id of the void transaction| Yes         | 


</details>

## Check for updates API

```Dart
String? result = await EzetapSdk.checkForUpdates();
```
This API is used to Check for service application updates

This API doesn't need any request parameters

## Print Receipt API

```Dart
String? result = await EzetapSdk.printReceipt(transactionID);
```
You can use API to print Razorpay PoS's payment receipt or charge-slip

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **trasactionId** | Transaction id of the transaction to be printed| Yes         | 


</details>

## Print Bitmap API

```Dart
String? result = await EzetapSdk.printBitmap(base64ImageString);
```
You can use this API to print custom receipts or invoice images you would like to.

## Scan Barcode API

```Dart
String? result = await EzetapSdk.scanBarcode();
```
You can use this API to scan the barcode.


## Close/Logout API

```Dart
String? result = await EzetapSdk.logout();
```

The close API is invoked to exit from the client API, this method closes the connection between the Ezetap server and ends the session with the device and exits from the API
The close method is invoked to exit from the SDK. This nullifies the configuration set by the initialize method. This is the last operation that should be invoked on the SDK. This a inverse of the initialize API. 

Recommendation: This method can be called before user logs out the of your application or before exit. It is not mandatory to call this method. If you call this method you need to call initialize method again to set the configuration.



## Stop Payment API

```Java
String? result = await EzetapSdk.stopPayment(request);
```
This API can be used to stop the payment for the list of transactions. You need to pass a list of transaction ids in this API.

Below is the request code for API with parameters

<details>
<summary>Code Snippet</summary>

```Dart
StopPaymentRequest request = StopPaymentRequest(
txnIds : listofString());
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnIds** | A list of string ids for which payment needs to be stopped. | Yes         |

</details>

## Refund Transaction API

```Dart
String? result = await EzetapSdk.refundTransaction(request);
```
To initiate the refund for the transaction this API can be used. You have to fill in the required details of the transaction and call the API to initiate a refund.

Below is the request code for API with parameters

<details>
<summary>Code Snippet</summary>

```Dart
RefundRequest request = RefundRequest(amount: "", txnId: "");
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **amount** | Amount of the transaction | Yes         |
| **txnId** | Transaction Id of the transaction | Yes         |

</details>
