import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Add your navigation logic here to navigate to the home screen
            },
            color: Colors.black,
            iconSize: 30,
          ),
          IconButton(
            icon: Icon(Icons.video_collection), // reel icon
            onPressed: () {
              // handle reel button press
            },
          ),
          IconButton(
            icon: Icon(Icons.people), // friends icon
            onPressed: () {}, // add your onPressed function here
          ),
          IconButton(
            icon: Icon(Icons.menu), // menu icon
            onPressed: () {}, // add your onPressed function here
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    TextFormField(
                      controller: _postController,
                      decoration: InputDecoration(
                        labelText: 'What you want to share...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              // Add camera button press logic here
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add_box),
                            onPressed: () {
                              // Add image button press logic here
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Post Section
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post Header
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://picsum.photos/50/50'),
                        ),
                        SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ahmed Ghosen',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('19 hr'),
                          ],
                        ),
                      ],
                    ),

                    // Post Content
                    SizedBox(height: 16.0),
                    Text(
                      'our post: ',
                      style: TextStyle(fontSize: 16.0),
                    ),

                    // Post Image
                    SizedBox(height: 16.0),
                    Image.network(
                      'https://picsum.photos/600/300',
                      fit: BoxFit.cover,
                    ),

                    // Post Actions
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Post Comments
                    SizedBox(height: 16.0),
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://picsum.photos/50/50'),
                          ),
                          title: Text('Comment ${index + 1}'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
