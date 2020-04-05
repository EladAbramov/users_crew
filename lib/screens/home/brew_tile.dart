import 'package:users_gang/models/brew.dart';
import 'package:flutter/material.dart';

class GangTile extends StatelessWidget {

  final Gang gang;
  GangTile({ this.gang });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green[gang.strength],
            backgroundImage: AssetImage('assets/firearm.png'),
          ),
          title: Text(gang.name),
          subtitle: Text('Takes ${gang.gangs} gangster(s)'),
        ),
      ),
    );
  }
}