import 'package:flutter/material.dart';
import 'package:app/PickUpTimePage.dart';
import 'package:app/StyleScheme.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: orderPage(),
    );
  }
}
class orderPage extends StatefulWidget {
  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text("Sélectionnez vos vêtements", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryWidget("man", "Hommes", true),
                categoryWidget("girl", "Femmes", false),
                categoryWidget("child", "Enfants", false),
                categoryWidget("oldman", "Autres", false),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    clothWidget("cloth1", "Pantalon", "15"),
                    clothWidget("cloth2", "Jeans", "10"),
                    clothWidget("cloth3", "Vestes", "15"),
                    clothWidget("cloth4", "Chemise", "5"),
                    clothWidget("cloth5", "T-Shirt", "7"),
                    clothWidget("cloth6", "Veston", "50"),
                    clothWidget("cloth7", "Manteaux", "40"),
                    clothWidget("cloth8", "Gillet", "15"),
                    clothWidget("cloth9", "Pull-over", "17")
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Votre panier", style: headingStyle,),
                    Text("7 articles ajoutés", style: contentStyle,)
                  ],
                ),
                Text("\F15000", style: headingStyle,)
              ],
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUpTimePage()));
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: gradientStyle,
                  ),
                  child: Center(
                    child: Text("SÉLECTIONNER LA DATE ET L'HEURE", style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                    ),),
                  )
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
  Container clothWidget(String img, String name, String price)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/$img.png')
                      )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$name", style: headingStyle,),
                    Text("\$$price", style: headingStyle.copyWith(color: Colors.grey),),
                    Text("Ajouter un commentaire", style: contentStyle.copyWith(color: Colors.orange),)

                  ],
                ),
                Text("\F45", style: headingStyle,),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          gradient: gradientStyle,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Text("-", style: headingStyle.copyWith(
                            color: Colors.white
                        ),),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,

                      child: Center(
                        child: Text("1", style: headingStyle.copyWith(
                            fontSize: 30
                        )),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          gradient: gradientStyle,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Text("+", style: headingStyle.copyWith(
                            color: Colors.white
                        ),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.75,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
  Column categoryWidget(String img, String name, bool isActive)
  {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: (isActive) ? null : Colors.grey.withOpacity(0.3),
            gradient: (isActive) ? gradientStyle : null,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/$img.png'),
                      fit: BoxFit.contain
                  )
              ),
            ),
          ),
        ),
        Text(name, style: headingStyle)
      ],
    );
  }
}
