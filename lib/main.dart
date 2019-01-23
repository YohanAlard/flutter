import 'package:flutter/material.dart';
import 'package:tydoc/DocumentScreen.dart';
import 'package:tydoc/ForgetPasswordScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 250, 250, 1),
      body: ListView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        children: <Widget>[Image.asset('images/tydoc.png'), LoginWidget()],
      ),
      bottomNavigationBar: FlatButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
            );
          },
          child: Text('Mot de passe oublié'),
          shape: Border.all()),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginWidget extends StatelessWidget {
  void login(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('Renseignez votre identifiant et mot de passe pour accéder à vos documents'),
            TextFormField(
              autofocus: true,
              key: Key("login"),
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: "Email",
                  fillColor: Color.fromRGBO(154, 195, 49, 0.2),
                  filled: true,
                  prefixIcon: Icon(Icons.account_box)),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              autofocus: true,
              key: Key("password"),
              obscureText: true,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  fillColor: Color.fromRGBO(154, 195, 49, 0.2),
                  filled: true,
                  hintText: "Mot de passe",
                  prefixIcon: Icon(Icons.lock)),
            ),
            SizedBox(height: 20.0),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentScreen()),
                );
              },

                child: Text('Connexion'),
              color: Color.fromRGBO(154, 195, 49, 1),
              textColor: Color.fromRGBO(255, 255, 255, 1),
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(100, 5, 100, 5),
            )
          ],
        )
    );
    return
      textSection;
  }
}

