import 'package:users_gang/models/brew.dart';
import 'package:users_gang/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference gangCollection = Firestore.instance.collection('gangsters');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await gangCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Gang> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Gang(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        gangs: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      gangs: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
  }

  // get brews stream
  Stream<List<Gang>> get brews {
    return gangCollection.snapshots()
      .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return gangCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}