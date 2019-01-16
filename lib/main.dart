import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  title: 'Login Page',
  home: new LoginPage(),
)
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState()
  {
    super.initState();
    _iconAnimationController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 500),);
    _iconAnimation=new CurvedAnimation(parent: _iconAnimationController, curve:Curves.linear );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/never.jpg"),fit: BoxFit.cover,color: Colors.teal,colorBlendMode: BlendMode.darken,),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value*100,
                colors: Colors.yellow,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(brightness: Brightness.dark,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                            color: Colors.cyanAccent,fontSize: 17.0
                          ))),

                  child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(hintText: "Enter G-mail",labelText: "G-mail",fillColor: Colors.red),
                          keyboardType: TextInputType.emailAddress,
                          //keyboardType: ,

                        ),

                        new TextFormField(
                          decoration: new InputDecoration(hintText: "Enter Password",labelText: "Password",fillColor: Colors.green),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          //keyboardType: ,

                        ),

                      ],
                    ),
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 20.0)),
              new MaterialButton(onPressed: ()=>{},child: new Text("Login",textScaleFactor: 1.2,),
                color: Colors.yellow,
                splashColor: Colors.orange,
                height: 50,minWidth: 100,),
            ],
          )
        ],
      ),
    );
  }
}

