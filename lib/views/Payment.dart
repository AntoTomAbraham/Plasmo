import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String name;
  String aadharno;
  String email;
  String amount;
  String number;
  final _formKey = GlobalKey<FormState>();
  Razorpay razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_CL50FTNcFT9THf',
      'amount': amount,
      'name': 'TakeCare',
      'description': 'payment for PMs Covid relief fund',
      'prefill': {'contact': number, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess() {
    print("Payment success");
  }

  void _handleExternalWallet() {
    print("Payment External wallet");
  }

  void _handlePaymentError() {
    print("Payment Error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppbar(),
      body: ListView(
        children: [
          SubAppbar(),
          textHead(),
          formField(),
          payButton(),
        ],
      ),
    );
  }

  Widget payButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        hoverColor: Color(0xff4649b8),
        disabledColor: Color(0xff6a71b8),
        focusColor: Color(0xff4a4da1),
        onPressed: () {
          openCheckout();
        },
        splashColor: Color(0xff4c4e91),
        highlightColor: Color(0xff4a4da1),
        color: Color(0xff4a4da1),
        shape: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 28.0, top: 8.0, right: 28.0, bottom: 8.0),
          child: Text(
            "Donate now",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget textHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Donate to PMs Covid Relief Fund",
        style: GoogleFonts.poppins(fontSize: 30),
      ),
    );
  }

  Widget formField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "What is your Name?",
                labelText: "Name",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  aadharno = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "What is your Aadhar No?",
                labelText: "Aadharno",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Enter your email id",
                labelText: "Email",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  number = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Enter your number",
                labelText: "Phone Number",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  amount = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "How much amount you are willing to pay",
                labelText: "Amount",
                fillColor: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
