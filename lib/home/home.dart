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

  Widget makeStory({
    required String storyImage,
    required String userImage,
    required String userName,
  }) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(storyImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(userImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 25,
            child: Text(
              userName,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

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
            icon: Icon(Icons.chat), // chat icon
            onPressed: () {}, // add your onPressed function here
          ),
          IconButton(
            icon: Icon(Icons.menu), // menu icon
            onPressed: () {}, // add your onPressed function here
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  makeStory(
                      storyImage: 'assets/images/story/story-1.jpg',
                      userImage: 'assets/images/aatik-tasneem.jpg',
                      userName: 'Aatik Tasneem'),
                  SizedBox(width: 10), // Add space between stories
                  makeStory(
                      storyImage: 'assets/images/story/story-3.jpg',
                      userImage: 'assets/images/aiony-haust.jpg',
                      userName: 'Aiony Haust'),
                  SizedBox(width: 10), // Add space between stories
                  makeStory(
                      storyImage: 'assets/images/story/story-4.jpg',
                      userImage: 'assets/images/averie-woodard.jpg',
                      userName: 'Averie Woodard'),
                  SizedBox(width: 10), // Add space between stories
                  makeStory(
                      storyImage: 'assets/images/story/story-5.jpg',
                      userImage: 'assets/images/azamat-zhanisov.jpg',
                      userName: 'Azamat Zhanisov'),
                ],
              ),
            ),
            SizedBox(height: 10), // Reduce the space between sections
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        TextFormField(
                          controller: _postController,
                          decoration: InputDecoration(
                            labelText: 'What you want to share...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30.0),
                                right: Radius.circular(30.0),
                              ),
                            ),
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
                  ],
                ),
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
    );
  }
}
