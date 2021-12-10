import 'package:flutter/material.dart';
import 'package:news/VModel/vm_article.dart';
import 'package:news/widget/cardnews.dart';
import 'package:provider/provider.dart';
class newsPage extends StatelessWidget {
  const newsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<ArticlesListViewModel>(context).fetchArticles();
    context.read<ArticlesListViewModel>().fetchArticles();
    return Scaffold(appBar: AppBar(
      actions: [
        IconButton(onPressed: ()async{

           context.read<ArticlesListViewModel>().initialvalues();
          await context.read<ArticlesListViewModel>().fetchArticles();
        }, icon: Icon(Icons.refresh),)
      ],
      title: Text('Last News'),
    ),
body: RefreshIndicator(
  onRefresh: ()async{
    await context.read<ArticlesListViewModel>().fetchArticles();
  },
  child: Center(
    child: Consumer<ArticlesListViewModel>(
      builder: (context,value,child){
        return value.articlesList!.length==0
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: value.articlesList!.length,
            itemBuilder:(context,index){
            return NewsCard(artc: value.articlesList![index],);
            } ,

        );
      },
    ),
  ),
),
    );
  }
}
