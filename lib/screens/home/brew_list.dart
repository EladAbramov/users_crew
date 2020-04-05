import 'package:users_gang/models/brew.dart';
import 'package:users_gang/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GangList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<GangList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Gang>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return GangTile(gang: brews[index]);
      },
    );
  }
}