import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final db = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  bool subscriber = false;

  TextEditingController newNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Post"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: nameController,
              maxLength: 4,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              await db.collection('user').add({'name': nameController.text, 'subscribe': subscriber});
              setState(() {
                subscriber = !subscriber;
              });
            },
            child: subscriber == false ? Text("Subscribe") : Text("Post"),
          ),

          StreamBuilder(
            stream: db.collection('user').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                      return ListTile(
                        title: Text(documentSnapshot['name']),
                        trailing: IconButton(
                          onPressed: () {
                            db.collection('user').doc(documentSnapshot.id).delete();
                          },
                          icon: Icon(Icons.delete),
                        ),
                        leading: ElevatedButton(
                          onPressed: () {
                            editPost(documentSnapshot);
                          },
                          child: Icon(Icons.edit),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void editPost(DocumentSnapshot document) {
    newNameController.text = document['name'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: TextFormField(
            controller: newNameController,
            decoration: InputDecoration(border: OutlineInputBorder()),
            maxLength: 4,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                db.collection('user').doc(document.id).update({'name': newNameController.text});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
