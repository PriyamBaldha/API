import 'package:api/Helper/Product_Api.dart';
import 'package:api/Model/Product.dart';
import 'package:flutter/material.dart';

import 'detailPage.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: ProductApi.productApi
            .fetchMultiplePostData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Product>? data = snapshot.data;

            return ListView.builder(

              itemCount: data!.length,
              itemBuilder: (context, i) {
                return Card(
                  color: Colors.teal,
                  elevation: 9,
                  margin: const EdgeInsets.all(8),
                  shadowColor: Colors.red,

                  child: ListTile(
                    isThreeLine: true,
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailScreen(product: data[i],)));
                    },
                    // onTap: (){
                    //   Navigator.of(context)
                    //       .pushNamed('DetailScreenPage', arguments: );
                    // },
                    // selectedTileColor: Colors.redAccent,
                    // onTap: Navigator.of(context).pushNamed('DetailPage',arguments: e),
                    // leading: Text(
                    //   "${data[i].id}",
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                    // leading: CircleAvatar(
                    //   // radius: 180,
                    //   backgroundImage: NetworkImage("${data[i].image}")
                    // ),
                    leading: Container(

                      // height: 280,
                      // width: 300,
                      child: CircleAvatar(
                        radius: 100,
                          // minRadius: 180,
                          // maxRadius: 180,
                          backgroundImage: NetworkImage("${data[i].image}",),
                      ),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.rectangle,
                      //     // color: Colors.black,
                      //   image: DecorationImage(
                      //     image: NetworkImage("${data[i].image}"),
                      //   )
                      // ),
                    ),
                    title: Text(
                      "${data[i].title}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      "${data[i].description}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      "${data[i].price} ",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
