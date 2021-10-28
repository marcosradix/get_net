import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:get_net/src/get_net.dart';
import 'config/constants.dart';
import 'config/custom_dio_getnet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GetnetRepository _getnetRepository;

  @override
  void initState() {
    _getnetRepository = GetnetRepositoryImpl(
        CustomDioGetnet().dio,
        GetnetParams(
            authorizationBasic: myAuthorizationBasic,
            clientId: myClientId,
            clientSecret: myClientSecret,
            sellerId: mySellerId,
            urlGetnetApi: myUrlGetnetApi));
    super.initState();
  }

  String _accessToken = "";

  void _incrementCounter() {
    //Ex.
    //SaveCardRequest request = SaveCardRequest();
    //request.copyWith(cardholderName: "Marcos S Monroll");
    //_getnetRepository.saveCreditCard(request);
    //5155901222280001

    //Get getnet access token
    // _getnetRepository.loginGetNet().then((response) =>
    //     setState(() => _accessToken = response.data['access_token'] as String));

//Tokenize card
    // _getnetRepository
    //     .tokenizeCreditCard(TokenizeCardRequest(
    //         cardNumber: '5155901222280001', customerId: "test_customer"))
    //     .then((response) => () => print(response.data));

    _getnetRepository
        .getAllCardsByCustomerId("test_customer")
        .then((response) => () => print(response.data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is your access token store it for future requests:',
            ),
            Text(
              _accessToken,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
