import 'package:flutter/material.dart';
import 'package:name_api/api.dart';
import 'package:name_api/model/album.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api callings'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Album>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text('${data[index].name}'),
                          subtitle: Text('${data[index].city}'),
                        ));
                      });
                } else {
                  return Text('Unable to fetch data');
                }
              })
        ],
      ),
    );
  }
}
