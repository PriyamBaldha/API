// import 'package:flutter/material.dart';
//
// class DetailPage extends StatefulWidget {
//   const DetailPage({Key? key}) : super(key: key);
//
//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     dynamic res = ModalRoute.of(context)!.settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product"),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }



import 'package:api/Model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.product});

  // Declare a field that holds the Todo.
  final Product product;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 190,
                backgroundImage: NetworkImage(product.image),
              ),
              SizedBox(height: 20,),
              Text(product.description),
              SizedBox(height: 120,),
              // Text(product.rate as String),
              // Text("Price:{'product.price'}"),
              // Text(product.price as String),
              // Text(product.price as String),
            ],
          )

        ),
      ),
    );
  }
}