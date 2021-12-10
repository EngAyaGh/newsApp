import 'package:flutter/material.dart';
import 'package:news/VModel/vm_article.dart';
import 'package:news/models/article.dart';
import 'package:provider/provider.dart';
class NewsCard extends StatelessWidget {
  const NewsCard({Key? key,required this.artc}) : super(key: key);
  //final Map<String,dynamic> map;
final Article artc;
  @override
  Widget build(BuildContext context) {
   // Provider.of<ArticlesListViewModel>(context).fetchArticles();

    return Padding(
    padding:const EdgeInsets.all(8.0),
    child:  Card(
        elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image(image: artc.imageUrl!=null?Image.network('${artc.imageUrl}').image: Image.asset("assets/no.jpg").image,) ,
            SizedBox(
              height: 10,
            ),
            Text( artc.title!=null?'${artc.title}' : 'no title',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),),
            SizedBox(
              height: 10,
            ),
            Text(artc.description!=null?'${artc.description}':'no description',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),),
            SizedBox(height: 10,),
            Text('read more by this link: \n ${artc.articleUrl}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),),
          ],
        ),
      ),
    ),
    );
  }
}
