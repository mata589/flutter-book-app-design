import 'package:flutter/material.dart';
import 'data.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // appbar
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
        ),
        onPressed: () {},
      ),
      title: Text('Design Books'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
      ],
    );

    createTile(Book book) {
      return Hero(
        tag: book.title,
        child: Material(
          elevation: 15,
          shadowColor: Colors.yellow.shade900,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'detail/${book.title}');
            },
            child: Image(
              image: AssetImage(book.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    // create grid

    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: books.map((book) => createTile(book)).toList(),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
    );
  }
}
