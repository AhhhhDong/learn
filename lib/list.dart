import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListApp extends StatelessWidget {
  final RandomWords _list = RandomWords();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '这是一个list的demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('这是一个list的demo'),
        ),
        body: Container(
          child: _list,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _list.state.addRandomWord(),
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  final RandomWordsState _state = RandomWordsState();

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

  RandomWordsState get state => _state;
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordList = List();
  final Set<WordPair> _favoriteSet = Set();

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildItem(WordPair wordPair) {
    bool isFavorite = _favoriteSet.contains(wordPair);
    return ListTile(
      title: Text(wordPair.asPascalCase),
      trailing: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onTap: _addFavorite(wordPair, isFavorite),
    );
  }

  Widget _buildContent(BuildContext context, int i) {
    //奇数行添加divider
    if (i.isOdd) return Divider();
    // ~/2 是除以2，然后向下取整
    final int index = i ~/ 2;
    return _buildItem(_wordList[index]);
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: _buildContent,
      itemCount: _wordList.length * 2,
    );
  }

  void addRandomWord() => setState(() {
        _wordList.add(WordPair.random());
      });

  _addFavorite(WordPair wordPair, bool isFavorite) => setState(() {
        if (isFavorite) {
          _favoriteSet.remove(wordPair);
        } else {
          _favoriteSet.add(wordPair);
        }
      });
}
