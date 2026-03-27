
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/background.dart';
class Login extends StatelessWidget{
  const Login({super.key});
  @override
  Widget build(BuildContext context){
  /*  final TextEditingController passController=TextEditingController();
    final TextEditingController emailController=TextEditingController();
    bool loading=false;
    void showSnackBar(String message){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text(message),
        ),
        );
    }
    Future<Void>onLoginPressed()async{
final email=emailController.text.trim();
final password=passController.text.trim();
if(email.isEmpty|| password.isEmpty)
{
  showSnackBar('Please fill all fields');
  return;
}
    }
    setState(()=>loading=true);
try{
  final cred=await auth.signInWithEmailAndPassword(
    email:email,
    password:password,
  );
  final uid=cred.user!.uid;
  
}*/

    return Scaffold(
      body: Stack(
        children: [
 const Background(),
 Center(
  
   child: Column(
       mainAxisSize: MainAxisSize.min,

      children: [
       Image.asset('assets/images/chat image.png',
        width:300,
        height: 300, ),
        
OutlinedButton(onPressed: (){},style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255,250, 233, 190), 
                    foregroundColor: const Color.fromARGB(255, 72, 39, 14),    
                    side: const BorderSide(
                      color: Color.fromARGB(255, 72, 39, 14),                  
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10), ),child:
const Text(
  'Login As User',
  style: TextStyle(
  color:  Color.fromARGB(255, 72, 39, 14),
  fontSize:20,
),
),
),

const SizedBox(height: 20,),
OutlinedButton(
  onPressed: (){},  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255,250, 233, 190), 
                    foregroundColor: const Color.fromARGB(255, 72, 39, 14),    
                    side: const BorderSide(
                      color: Color.fromARGB(255, 72, 39, 14),                  
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
                  ),child:
const Text(
  'Login As Chef',
  style: TextStyle(
  color:  Color.fromARGB(255, 72, 39, 14),
  fontSize: 20,
),
),
),
      
 
        ],
      ),
      ),
        ],
    ),
    );
    
    
        
      
     
  }
}