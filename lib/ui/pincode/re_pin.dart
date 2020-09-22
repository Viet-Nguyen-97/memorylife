import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../home_page.dart';
import 'dart:async';

class RePinPutTest extends StatelessWidget {
  final String pinn;
  RePinPutTest({Key key, @required this.pinn}) : super(key: key);

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                
                Positioned(
                  top: 250.0,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text("Nhập lại mật khẩu", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                ),

                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(5.0),
                      child: PinPut(
                        fieldsCount: 6,
                        onSubmit: (String pin) => _compare(pinn ,pin, context),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                ),

                Positioned(
                  top: 400,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {

                      },
                      child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  )
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _compare(String pinn, String pin, BuildContext context) async {
    if (pinn.compareTo(pin) == 0) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context)
              .modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext,
              Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height -  80,
                padding: EdgeInsets.all(20),

                alignment: Alignment.center,

                child: Column(
                  children: [
                    Image.asset("assets/done.png"),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  ],
                )
              ),
            );

          });
  }
    if (pinn.compareTo(pin) != 0)
    {
      return AlertDialog(
        title: Text("Alert Dialog"),
        content: Text("Không trùng mật khẩu"),
      );
    }
  }

}