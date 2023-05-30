import 'package:flutter/material.dart';
import 'package:responsi/model/list_news_model.dart';
import 'package:responsi/service/base_network.dart';
import 'package:responsi/model/detailrepublika.dart';

class Kategori extends StatelessWidget {
  final String? kategory;
  const Kategori({Key? key, required this.kategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String kategori = "$kategory";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 67, 170, 156),
        title: Text(
          'REPUBLIKA ' + kategori.toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: BaseNetwork.get("$kategory"),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                ListNewsModel listNewsModel =
                    ListNewsModel.fromJson(snapshot.data);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0;
                          i < listNewsModel.data!.posts!.length;
                          i++)
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailRepublika(
                                      link: listNewsModel.data!.posts![i].link,
                                      title:
                                          listNewsModel.data!.posts![i].title,
                                      pubDate:
                                          listNewsModel.data!.posts![i].pubDate,
                                      description: listNewsModel
                                          .data!.posts![i].description,
                                      thumbnail: listNewsModel
                                          .data!.posts![i].thumbnail),
                                ));
                          },
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Image.network(
                                        "${listNewsModel.data!.posts![i].thumbnail}")),
                                Flexible(
                                    child: Text(
                                  "${listNewsModel.data!.posts![i].title}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
