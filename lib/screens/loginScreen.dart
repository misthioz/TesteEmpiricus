import 'package:empiricus_teste/screens/subscriptionList.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool errorMessageVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Image.network('https://empiricus.com.br/uploads/2022/05/Empiricus-logo-1.jpg',
              width: 90, height: 90,),),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedOpacity(
              opacity: errorMessageVisible ? 1 : 0,
              duration: const Duration(milliseconds: 50),
              child: Container(
                height: 60, width: 280,
                decoration:
                  BoxDecoration(color: const Color.fromRGBO(200, 10, 10, 0.3),
                  border: Border.all(color: const Color.fromRGBO(180, 0, 0, 0.8)), borderRadius: BorderRadius.circular(10)),
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Incorret username or password',
                          style: TextStyle(color: Colors.white, fontSize: 15),),
                      ),
                      IconButton(onPressed: (){
                        setState(() {
                          errorMessageVisible=false;
                        });
                      },
                          icon: const Icon(Icons.close, color: Colors.red,))
                    ],
                  ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Username', style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username',

                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Password', style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password',
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  validateLogin(usernameController.text, passwordController.text);
                },
                child: const Text('Login'),
            ),
          ],
        ),

      )
    );
  }

  void validateLogin(String username, String passwd){
    if(username == 'empiricus' && passwd == 'mypassword'){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SubscriptionList())
      );
    }
    else{
      setState(() {
        errorMessageVisible = true;
      });

    }
  }
}
