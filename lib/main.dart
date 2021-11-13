import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.bounceOut));
    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.fill,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 2,
                    ),
                    Container(
                      // color: Colors.blue,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: FlutterLogo(
                        size: animation!.value,
                        // style: FlutterLogoStyle.horizontal,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty == true) {
                              return "please enter something !";
                            } else if (value.contains("@") == false) {
                              return "invaild email !";
                            }
                            return null;
                          },
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              labelText: "Email",
                              hintText: "Example@gmail.com",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                              enabled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              ))),
                          keyboardType: TextInputType.emailAddress,
                          enabled: true,
                        )),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "pleae enter some thing";
                          }
                          return null;
                        },
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.password_outlined,
                              color: Colors.white,
                            ),
                            labelText: "Password",
                            hintText: "*********",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                            enabled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            ))),
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        enabled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login SuccessFully"),
                            ),
                          );
                        }
                      },
                      child: Icon(Icons.forward),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
