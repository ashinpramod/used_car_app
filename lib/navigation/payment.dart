import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home: Payment()));
// }

class Payment extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 700,width: 350,
              decoration: BoxDecoration(
                color: Colors.white,

              ),
              child: Column(children: [
                Text("book here",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,),),
                SizedBox(height:40),
                Padding(
                  padding: const EdgeInsets.only(right: 180.0),
                  child: Text("Suggested for you",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

                ),
                ListTile(style: ListTileStyle.list,title: Text("Google pay"),leading: Icon(Icons.payment),),
                ListTile(title: Text("Phone pay"),leading: Icon(Icons.payments_sharp),),
                ListTile(title: Text("Paytm"),leading: Icon(Icons.payment_outlined),),
                SizedBox(height: 200),
                MaterialButton(onPressed: (){},child: Text("Confirm"),color: Colors.blue,minWidth: 300)
              ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
