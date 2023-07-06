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

<summary>Request Code</summary>

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
| **communicationChannel**     | It can be BT, MOCK, USB and NONE|   No     |
| **subscriberId - String(20)**| If LoginType is userId, then you need to add a password or subscriberId | Yes (If not adding password)| 
| **password**                 | If LoginType is userId, then you need to add a password or subscriberId. It can be of any length.| Yes (If not adding subscriberId)     |
| **deviceSerial - String(20)**| Serial No. of device, Which you are using(A910. A920 etc)  | No         | 
| **loginType - String**       | It can be userId/Appkey|   No     |
| **prepareDevice - Boolean**  |  | No         | 
| **captureSignature - Boolean**| if you want to capture signature  |   No     |
| **playStoreHosting - Boolean**| | Yes         | 
| **ipAddress - String**        | Custom IP Address|   No     |

</details>

## Payment Transaction API

```Java
EzeAPI.performTransaction(this, REQUEST_CODE, request)
```

Razorpay POS has a universal pay API through which all the payment modes (that is enabled for the merchant) can be invoked through a single API call. With this API there will be no need of calling the individual methods for different payment modes (like Card, Remote Pay, UPI etc).

Preparing Input for the Pay API

<details>
<summary>Java Code</summary>

```Java
GenericPayment request = new GenericPayment();
request.setAmount(12000);
request.setTxnType(TxnType.PAY);
request.setUserName("abcddd");
request.setIssueType("xyz");
request.setIssueInfo("abc");
request.setTags(listOfString);
request.setMerchantPhoneNumber("7000000000");
request.setMerchantEmail("abc@xyz.com");
request.setProductDetails(new ProductDetails());
request.setAdditionalReferences(listOfString);
request.setPayToAccount("");
request.setOptions(new Options());
request.setUpi(new UPIRequest());
request.setGst(new Gst());
request.setPaymentMode(TxnMode.CARD);
request.setWalletAcquirer("abcddd");
request.setAgentName("abcddd");
request.setAgentMob("8000000000");

Options op = new Options();
op.setReferences(new References());
op.setAmountTip(10.1);
op.setCustomer(new Customer());
op.setPaymentBy("");
op.setEmiType(EmiType.NORMAL);
op.setProviderName(Provider.KREDITBEE);
op.setServiceFee(1.0);
op.setAmountCashback(10.0);
op.setAppData(new Hashtable<String, Object>());
op.setAddlData(new Hashtable<String, Object>());
op.setLabels(listOfString);


```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = GenericPayment()
request.amount = 12000
request.txnType = TxnType.PAY
request.userName = "abcddd"
request.issueType = "xyz"
request.issueInfo = "abc"
request.tags = listOfString
request.merchantPhoneNumber = "7000000000"
request.merchantEmail = "abc@xyz.com"
request.productDetails = ProductDetails()
request.additionalReferences = listOfString()
request.setPayToAccount = ""
request.options = Options()
request.upi = UPIRequest()
request.gst Gst()
request.paymentMode = TxnMode.CARD
request.walletAcquirer = "abcddd"
request.agentName ="abcddd"
request.agentMob = "8000000000"

val op = Options()
op.references = References()
op.amountTip = 10.1
op.customer = Customer()
op.paymentBy = ""
op.emiType = EmiType.NORMAL
op.providerName = Provider.KREDITBEE
op.serviceFee = 1.0
op.amountCashback = 10.0
op.appData = Hashtable<String, Any>()
op.addlData = Hashtable<String, Any>()
op.labels = listOfString

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
| **additionalReferences**  | In few cases you might want put more context to the payment like items part of the order, store location, type of item etc. This secondary information can go in additional References array. | No        | 

Note: You would like to associate some context for the payment like order number, invoice number, receipt number etc. This information can go in as reference1, reference2 of the references object. We support a total of seven primary references that can be associated to the payment (reference1-7). 

</details>


## Prepare Device API

```Java
EzeAPI.prepareDevice(this, REQUEST_CODE)
```
Prepare Device is used to initialize the device (card reader) with the updated encryption keys from the corresponding bank

This API doesn't need any request parameters

## Get Card Info API

```Java
EzeAPI.getCardInfo(this, REQUEST_CODE, request)
```

Get Card Info API is used to get the card information with the type of card, card number etc.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
CardInfoRequest request = new CardInfoRequest();
request.setcardType("your card type");
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = CardInfoRequest()
request.cardType = "your card type"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **cardType** | The type of card you are using  | Yes         | 

</details>

## Send Receipt API

```Java
EzeAPI.sendReceipt(this, REQUEST_CODE, request)
```
Ezetap provides a way to send e-receipts to customers. You can pass mobile, email respectively as part of object.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
SendReceiptRequest request = new SendReceiptRequest();
request.setTxnId("orderxyz");
request.setMobileNo("7000000000");
request.setEmail("abc@xyz.com");
```
</details>
<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = SendReceiptRequest()
request.txnId = "orderxyz"
request.mobileNo ="7000000000"
request.email = "abc@xyz.com"
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

## Service Request API

```Java
EzeAPI.serviceRequest(this, REQUEST_CODE, request)
```
Razorpay provides a way to send service on request to customers. You can pass merchnat mobile number, email , issue type, issue info respectively as part of object.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
ServiceRequest request = new ServiceRequest();
request.setMerchantPhoneNumber("7000000000");
request.setMerchantEmail("abc@xyz.com");
request.setIssueType("");
request.setIssueInfo("");
request.tags(listofString());
```
</details>

<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = ServiceRequest()
request.merchantPhoneNumber ="7000000000"
request.merchantEmail = "abc@xyz.com"
request.issueType = ""
request.issueInfo = ""
request.tags = listofString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **merchantPhoneNumber** | Phone number of the merchat | Yes         | 
| **merchantEmail** | Email id of the merchant |   Yes     |
| **issueType**  | Type of the issue fro the request  | No        | 
| **issueInfo**  | Information about the issue  | No        | 
| **tags**  | Tags related to the issue  | No        | 

</details>

## Send Receipt API

```Java
EzeAPI.sendReceipt(this, REQUEST_CODE, request)
```
You can use below API to send Razorpay PoS's payment receipt or charge-slip

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
SendReceiptRequest request = new SendReceiptRequest();
request.setTxnId("orderxyz");
request.setMobileNo("7000000000");
request.setEmail("abc@xyz.com");
```
</details>
<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = SendReceiptRequest()
request.txnId = "orderxyz"
request.mobileNo = "7000000000"
request.email = "abc@xyz.com"
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

```Java
EzeAPI.attachSignature(this, REQUEST_CODE, request)
```
This API allow you to attach an e-signature from the customer for payments.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
AttachSignatureRequest request = new AttachSignatureRequest();
request.setTipAmount(100.0);
request.setImageData("your image data");
request.setImageType("format of image e.g JPEG, PNG etc");
request.setImageHeight("height of the image");
request.setImageWeight("weight of the image");
request.setTxnId("order123");
request.setEmiId("abcxyz");
```
</details>

<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = AttachSignatureRequest()
request.tipAmount = 100.0
request.imageData = "your image data"
request.imageType = "format of image e.g JPEG, PNG etc"
request.imageHeight = "height of the image"
request.imageWeight = "weight of the image"
request.txnId = "order123"
request.emiId = "abcxyz"
```
</details>
<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **tipAmount** | Tip amout for the transaction | No         | 
| **imageData** | Image data for signature |   No     |
| **imageType**  |Type of image - .png or .jpg  | No        | 
| **imageHeight**  | Height of the image  | No        | 
| **imageWeight**  | Width of the image  | No        | 
| **txnId**  | The transaction Id of the transaction| Yes        | 
| **emiId**  | Email id  of the user  | No        | 

</details>

## Display Transaction History API

```Java
EzeAPI.displayTransactionHistory(this, REQUEST_CODE, request)
```
This API is used to get the transaction history. You need to pass agent name for this API.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
DisplayTransactionListRequest request = new DisplayTransactionListRequest();
request.setAgentName("abc");
```
</details>

<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = DisplayTransactionListRequest()
request.agentName = "abc"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **agentName** | Name of the agent | Yes         | 

</details>

## Get Transaction API

```Java
EzeAPI.getTransaction(this, REQUEST_CODE, request)
```
This API is used to get the transaction details with reference.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
TxnWithReferenceRequest request = new TxnWithReferenceRequest();
request.setFetchAllTransaction(true);
request.setDoStopPayment(false);
request.setReferences(listOfString());
```
</details>
<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = new TxnWithReferenceRequest();
request.fetchAllTransaction = true
request.doStopPayment = false
request.references = listOfString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **fetchAllTransaction** | Boolean value to get the transactions| No         | 
| **doStopPayment** | Boolean value to stop payment |   No     |
| **references**  | Transaction reference  | No        | 

</details>

## Check For Incomplete Transaction API

```Java
EzeAPI.checkForIncompleteTransaction(this, REQUEST_CODE)
```

In case of incomplete transaction for a user, the user is intimated about the status of the previous transaction. The App will prompt the user to check the status of the previous transaction before attempting a new transaction. The API will return details of the transaction (Status) as well.

This request does not required any parameters

## Void Transaction API

```Java
EzeAPI.voidTransaction(this, REQUEST_CODE,transactionID)
```
If the customer choose to return the service and you wish refund the money on the same day, in this case you can do void of a payment. Voiding a payment means that you cancel the payment before the settlement of money is made. If settlement is initiated then void won't work, this API is helpful if same day refund needs to be done.

Below is the request code for API with parameters
<details>

<summary>Java Code</summary>

```Java
String transactionID = "order123"
```
</details>

<details>

<summary>Kotlin Code</summary>

```Kotlin
val transactionID = "order123"
```
</details>
<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **trasactionId** | Transaction id of the void transaction| Yes         | 


</details>

## Check for updates API

```Java
EzeAPI.checkForUpdates(this, REQUEST_CODE)
```
This API is used to Check for service application updates

This API doesn't need any request parameters

## Print Receipt API

```Java
EzeAPI.printReceipt(this, REQUEST_CODE,transactionID)
```
You can use below API to print Razorpay PoS's payment receipt or charge-slip

Below is the request code for API with parameters
<details>

<summary>Java Code</summary>

```Java
String transactionID = "order123"
```
</details>

<details>

<summary>Kotlin Code</summary>

```Kotlin
val transactionID = "order123"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **trasactionId** | Transaction id of the transaction to be printed| Yes         | 


</details>

## Print Bitmap API

```Java
EzeAPI.printBitmap(this, REQUEST_CODE, request)
```
You can use this API to print custom receipt or invoice images you would like to.

Below is the request code for API with parameters

<details>

<summary>Java Code</summary>

```Java
PrintBitmapRequest request = new PrintBitmapRequest();
request.setImageData("your image data");
request.setImageType("format of image e.g JPEG, PNG etc");
```
</details>
<details>

<summary>Kotlin Code</summary>

```Kotlin
val request = PrintBitmapRequest();
request.imageData = "your image data"
request.imageType = "format of image e.g JPEG, PNG etc"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **imageData** | Image data to print bitmap| No         | 
| **imageType** | Type of image i.e. .png or .jpg | No         | 


</details>

## Scan Barcode API

```Java
EzeAPI.scanBarcode(this, REQUEST_CODE, null)
```
You can use this API to scan barcode 

We need to pass null as parameter in this API

## Load Balance API

```Java
EzeAPI.loadBalance(this, REQUEST_CODE, request)
```
This API is used to load/add balance in the wallet (NCMC section).

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
LoadBalanceRequest request = new LoadBalanceRequest();
request.setAmount(100.0);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = LoadBalanceRequest();
request.amount = 100.0
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **amount** | Amount to be load | Yes         |

</details>

## Update Balance API

```Java
EzeAPI.updateBalance(this, REQUEST_CODE, null)
```
This API is used to check updates and Sync the wallet (NCMC section).

## Request Balance API

```Java
EzeAPI.requestBalance(this, REQUEST_CODE, null)
```
This API is used to check the balance (NCMC section).

## Close/Logout API

```Java
EzeAPI.close(this, REQUEST_CODE)
```

The close API is invoked to exit from the client API, this method closes the connection between the Ezetap server and ends the session with the device and exits from the API
The close method is invoked to exit from the SDK. This nullifies the configuration set by the initialize method. This is the last operation that should be invoked on the SDK. This a inverse of the initialize API. 

Recommendation: This method can be called before user logs out the of your application or before exit. It is not mandatory to call this method. If you call this method you need to call initialize method again to set the configuration.


## Reset Password API

```Java
EzeAPI.resetPWD(this, REQUEST_CODE, request)
```
This API can be used to reset your password with a new one.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
ResetPasswordRequest request = new ResetPasswordRequest();
request.setOldPassword("abcd1234");
request.setNewPassword("abcd4321");
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = ResetPasswordRequest()
request.oldPassword = "abcd1234"
request.newPassword = "abcd4321"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **oldPassword** | Old password of the user | Yes         |
| **newPassword** | New password, which you want to keep  | Yes         |

</details>

## Pre Auth API

```Java
EzeAPI.preAuth(this, REQUEST_CODE, request)
```
This API can be used to initiate the Pre auth transaction.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
PreAuthRequest request = new PreAuthRequest();
request.setCustomerMobileNo("7000000000");
request.setCustomerEmail("abc@xyz");
request.setCustomerName("abc");
request.setReference1("1234");
request.setReference2("");
request.setReference3("");
request.setReference4("");
request.setReference5("");
request.setReference6("");
request.setReference7("");
request.setPayToAccount("");
request.setPaymentBy("");
request.setAmount(100.0);
request.setAmountTip(10.0);
request.setAppData(new Hashtable<String, Object>);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = PreAuthRequest()
request.customerMobileNo = "7000000000"
request.customerEmail = "abc@xyz"
request.customerName = "abc"
request.reference1 = "1234"
request.reference2 = ""
request.reference3 = ""
request.reference4 = ""
request.reference5 = ""
request.reference6 = ""
request.reference7 = ""
request.payToAccount = ""
request.paymentBy = ""
request.amount = 100.0
request.amountTip = 10.0
request.appData =  Hashtable<String, Any>
```
</details>

<details>
<summary>Keys Information</summary>
	
| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **amount** | Amount of the transaction | Yes         |
| **customerMobileNo** | Mobile number of the customer | No         |
| **customerEmail** | Email of the customer | No         |
| **customerName** | Name of the customer | No         |
| **reference1** | It refers to the order number of the transaction | No         |

</details>

## Confirm Pre Auth API

```Java
EzeAPI.confirmPreAuth(this, REQUEST_CODE, request)
```

This API can be used to confirm the Pre auth transaction.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
AuthRequest request = new AuthRequest();
request.setTxnId("order1234");
request.setAmount(100.0);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = AuthRequest()
request.txnId = "order1234"
request.amount = 100.0
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnId** | Transaction Id of the pre auth order | Yes         |
| **amount** | Amount of the pre auth order | Yes         |

</details>

## Release Pre Auth API

```Java
EzeAPI.releasePreAuth(this, REQUEST_CODE, request)
```
To release the Pre auth transaction, this API can be used.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
AuthRequest request = new AuthRequest();
request.setTxnId("order1234");
request.setAmount(100.0);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = AuthRequest()
request.txnId = "order1234"
request.amount = 100.0
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnId** | Transaction Id of the pre auth order | Yes         |
| **amount** | Amount of the pre auth order | Yes         |

</details>

## Stop Payment API

```Java
EzeAPI.stopPayment(this, REQUEST_CODE, request)
```
This API can be used to stop the payment for the list of transactions. You need to pass a list of transaction ids in this API.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
StopPaymentRequest request = new StopPaymentRequest();
request.setTxnIds(ListofString);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = StopPaymentRequest()
request.txnIds = listofString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **txnIds** | A list of string ids for which payment needs to be stopped. | Yes         |

</details>

## Update Setting API

```Java
EzeAPI.updateSetting(this, REQUEST_CODE, request)
```
This API can be used to update the setting.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
UpdateSettingRequest request = new UpdateSettingRequest();
request.setUserAppOptions("");
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = UpdateSettingRequest()
request.userAppOptions = ""
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **userAppOptions** | Settings which needs to be updated | Yes         |

</details>

## Get Login Response API

```Java
EzeAPI.getLoginResponse(this, REQUEST_CODE)
```
To fetch the login response, this API can be used. It will return the login response for the current user.


## Get Device Info API

```Java
EzeAPI.getDeviceInfo(this, REQUEST_CODE, request)
```
This API can be used to fetch the info about your device. It will return information about the device i.e. Battery, Device Name, Model etc.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
DeviceInfoRequest request = new DeviceInfoRequest();
request.setUserAppOptions("");
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = DeviceInfoRequest()
request.userAppOptions = ""
```
</details>

## Refund Transaction API

```Java
EzeAPI.refundTransaction(this, REQUEST_CODE, request)
```
To initiate the refund for the transaction this API can be used. You have to fill in the required details of the transaction and call the API to initiate a refund.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
RefundTransactionRequest request = new RefundTransactionRequest();
request.setCustomerMobileNo("7000000000");
request.setCustomerEmail("abc@xyz");
request.setCustomerName("abc");
request.setReference1("1234");
request.setReference2("");
request.setReference3("");
request.setReference4("");
request.setReference5("");
request.setReference6("");
request.setReference7("");
request.setPayToAccount("");
request.setPaymentBy("");
request.setAmount(100.0);
request.setTxnId("abc1234");
request.setAppData(new Hashtable<String, Object>);
request.setAddlData(new Hashtable<String, Object>);
request.setLabels(ListofString);
request.setAdditionalReferences(ListofString);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = RefundTransactionRequest()
request.customerMobileNo = "7000000000"
request.customerEmail = "abc@xyz"
request.customerName = "abc"
request.reference1 = "1234"
request.reference2 = ""
request.reference3 = ""
request.reference4 = ""
request.reference5 = ""
request.reference6 = ""
request.reference7 = ""
request.payToAccount = ""
request.paymentBy = ""
request.amount = 100.0
request.txnId = "abc1234"
request.appData = Hashtable<String, Any>
request.addlData = Hashtable<String, Any>
request.labels = listofString()
request.additionalReferences = listofString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **amount** | Amount of the transaction | Yes         |
| **txnId** | Transaction Id of the transaction | Yes         |
| **customerMobileNo** | Mobile number of the customer | No         |
| **customerEmail** | Email of the customer | No         |
| **customerName** | Name of the customer | No         |
| **reference1** | It refers to the order number of the transaction | No         |
| **additionalReferences** | If want to send some additional references | No         |

</details>

## Subscribe Topics API

```Java
EzeAPI.subscribeToTopics(this, REQUEST_CODE, request)
```
To subscribe to any topic, this API can be used. This API accepts a list of string topics.  

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
TopicsRequest request = new TopicsRequest();
request.setTopics(ListofString);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = TopicsRequest()
request.topics = listofString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **topics** | A list of string topics needs to subscribe | Yes         |

</details>

## UnSubscribe Topics API

```Java
EzeAPI.unSubscribeToTopics(this, REQUEST_CODE, request)
```
To unsubscribe to any topic, this API can be used. This API accepts a list of string topics.  

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
TopicsRequest request = new TopicsRequest();
request.setTopics(ListofString);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = TopicsRequest()
request.topics = listofString()
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **topics** | A list of string topics needs to unsubscribe | Yes         |

</details>

## Acknowledge Notification API

```Java
EzeAPI.acknowledgeToNotification(this, REQUEST_CODE, request)
```
To acknowledge a notification, this API can be used. This API accepts a string topic.  

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
AcknowledgeRequest request = new AcknowledgeRequest();
request.setAcknowledgeNotification("abc_update");
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val request = AcknowledgeRequest()
request.acknowledgeNotification = "abc_update"
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **acknowledgeNotification** | String name which need to be acknowledge | Yes         |

</details>

## Install APK API

```Java
EzeAPI.installApk(this, REQUEST_CODE, request)
```
To install apk from a specific location, this API can be used.

Below is the request code for API with parameters

<details>
<summary>Java Code</summary>

```Java
String directoryPath = "/folder/test";
EzeAPI.installApk(this, REQUEST_CODE, directoryPath);
```
</details>

<details>
<summary>Kotlin Code</summary>

```Kotlin
val directoryPath = "/folder/test"
EzeAPI.installApk(this, REQUEST_CODE, directoryPath)
```
</details>

<details>
<summary>Keys Information</summary>

| **ATTRIBUTES**               | **DESCRIPTION**           | **MANDATORY**   | 
| -----------              | -----------           | ----------- |      
| **directoryPath** | Path of the directory from where apk need to install | Yes         | 

</details>



```dart
Future<void> onPaymentClicked(request) async {
  String? result = await EzetapSdk.pay(request);
  if (!mounted) return;
  setState(() {
    _result = result;
  });
}
```

```dart
Future<void> onBarcodePressed() async {
  String? result = await EzetapSdk.scanBarcode();
  if (!mounted) return;
  setState(() {
    _result = result;
  });
}
```

## What you need

1. Flutter development environment
2. Android phone that can connect to internet
3. This documentation
4. Ezetap app key or login credentials to Ezetap service
5. Ezetap device to test card payments

