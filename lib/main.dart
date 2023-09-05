import 'package:flutter/material.dart';

void main(){
  runApp(
    const MyApp()
    );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

      @override
      Widget build(BuildContext context){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
      );
    }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement(){
    setState(() {
       count--;
    });
    print(count);
  }

  void increment(){
    setState(() {
     count++; 
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/back_image.jpg'),
          fit: BoxFit.cover,
          ),
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          isFull ? 'Estabelecimento Lotado' : 'Pode Entrar', 
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.w500, 
            color: isFull ? Colors.red : Colors.white),
            ),

            Padding(
            padding: const EdgeInsets.all(40),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w400
          ),
          ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 

              TextButton(onPressed: isEmpty ? null : decrement, 
                style: TextButton.styleFrom(backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white, fixedSize: const Size(100, 100), primary: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                    child: const Text('Saiu', 
                      style: TextStyle(color: Colors.black, fontSize: 16),),),

              const SizedBox(width: 32),

              TextButton(onPressed: isFull ? null : increment, 
                style: TextButton.styleFrom(backgroundColor: isFull ? Colors.white.withOpacity(0.5) : Colors.white, fixedSize: const Size(100, 100), primary: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                    child: const Text('Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 16),),)

            ],
          ),
        ],
      ),
      ),
    );
  }
}


