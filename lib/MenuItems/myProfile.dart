import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget{
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{

  String firstname = 'John';
  String lastname = 'Doe';
  String email = '';
  String gender = '';
  String dob = '10-03-2002';
  String profileUrl = "empty";

  SizedBox buildContainer(title, info){
    return SizedBox(
      height: 68,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$title',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Text('$info',style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                const SizedBox(width: 10,),
                const Icon(Icons.edit,color: Colors.grey,)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: const Color.fromARGB(255, 55, 14, 201),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipperPath(),
            child: Container(
              color: const Color.fromARGB(255, 55, 14, 201),
              height: 165,
              width: double.infinity,
            ),
          ),
          Transform.translate(
            offset: const Offset(0,-70),
            child: Column(
              children: [
                GestureDetector(onTap: (){
                  print("Change Profile Picture");
                },
                  child: CircleAvatar(
                    radius: 68,
                    backgroundColor: Colors.grey[300],
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: FutureBuilder(future: futureFunction(),
                        builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator());
                        }else if(snapshot.data == "empty"){
                          return const Icon(Icons.add_a_photo,color: Colors.grey,);
                        }else{
                          return CachedNetworkImage(
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            imageUrl: profileUrl,
                            fit: BoxFit.cover,
                          );
                        }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('First Name',style: TextStyle(fontSize: 20,letterSpacing: 0.5,color: Colors.black,fontWeight: FontWeight.bold),),

            ],
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                boxShadow: const [BoxShadow(
                  color: Color.fromARGB(103, 104, 103, 103),
                  blurRadius: 5,
                  spreadRadius: 2.5,
                  offset: Offset(2,1)
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0,
                  spreadRadius: 0,
                  offset: Offset(0, 0)
                )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildContainer('DOB', "$dob"),
                  const Divider(color: Colors.grey,thickness: 1,),
                  buildContainer('Gender', "$gender"),
                  const Divider(color: Colors.grey,thickness: 1,),
                  buildContainer('Email', email),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> futureFunction() async{
  String url = "empty";
  return url;
}

class CustomClipperPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w*0.5, h, w, h-70);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}