import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/Utils/constants.dart';



class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(top: 16,left: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded),
            ),
          ),
          backgroundColor: Colors.black,
          expandedHeight: 500,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie['title'],
            style: GoogleFonts.belleza(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
            ),
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                '${Constants.imagePath}${movie['poster_path']}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,

              ),
            ),
          ),
        ),
           SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text("Overview",
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text(movie['overview'],
                  style: GoogleFonts.roadRage(
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                  ),
                  ),

                ],
              ),
            ),
          ),


        ],

      )
    );
  }
}
