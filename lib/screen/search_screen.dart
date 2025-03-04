import 'package:filmalya2/models/movie.dart';
import 'package:filmalya2/services/api_service.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchSreen> {
  ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchMovie);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _searchMovie() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search movie . . .',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _searchController.text.isNotEmpty,
                    child: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchResult.clear();
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, index) {
                        final Movie movie = _searchResult[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                            minTileHeight: 50,
                            minLeadingWidth: 50,
                            fit: BoxFit.cover,
                          ),
                          tittle: Text(movie.title),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
