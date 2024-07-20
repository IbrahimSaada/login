import 'package:flutter/material.dart';
import 'package:login2/home/add_friends_page.dart';
import 'package:login2/home/contacts_page.dart';
import 'package:login2/menu/menu_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  int likeCount = 0;
  int commentCount = 0;

  Widget makeStory({
    required String storyImage,
    required String userImage,
    required String userName,
  }) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(storyImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 2),
                image: DecorationImage(
                  image: AssetImage(userImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
            icon: Container(
              width: 30,
              height: 30,
              child: Image.asset('assets/icons/video.png'),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              width: 30,
              height: 30,
              child: Image.asset('assets/icons/add-friend.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFriendsPage()),
              );
            },
          ),
          IconButton(
            icon: Container(
              width: 30,
              height: 30,
              child: Image.asset('assets/icons/speech-bubble.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsPage()),
              );
            },
          ),
          IconButton(
            icon: Container(
              width: 30,
              height: 30,
              child: Image.asset('assets/icons/menu.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  makeStory(
                      storyImage: 'assets/food.jpg',
                      userImage: 'assets/chef.jpg',
                      userName: 'Ahmad Ghosen'),
                  makeStory(
                      storyImage: 'assets/1.png',
                      userImage: 'assets/1.png',
                      userName: 'Aatik Tasneem'),
                  makeStory(
                      storyImage: 'assets/2.jpg',
                      userImage: 'assets/2.jpg',
                      userName: 'Aiony Haust'),
                  makeStory(
                      storyImage: 'assets/3.jpg',
                      userImage: 'assets/3.jpg',
                      userName: 'Averie Woodard'),
                  makeStory(
                      storyImage: 'assets/4.jpg',
                      userImage: 'assets/4.jpg',
                      userName: 'Azamat Zhanisov'),
                ],
              ),
            ),
            SizedBox(height: 10),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                      'assets/icons/photo-camera.png'),
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Container(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset('assets/icons/gallery.png'),
                                ),
                                onPressed: () {},
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 16.0),
                  Text(
                    'Our post:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Image.network(
                    'https://picsum.photos/600/300',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset('assets/icons/favorite.png'),
                        ),
                        onPressed: () {
                          setState(() {
                            likeCount++;
                          });
                        },
                      ),
                      Text('$likeCount'),
                      SizedBox(width: 16.0),
                      IconButton(
                        icon: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset('assets/icons/comments.png'),
                        ),
                        onPressed: () {
                          setState(() {
                            commentCount++;
                          });
                        },
                      ),
                      Text('$commentCount'),
                      IconButton(
                        icon: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset('assets/icons/share-arrow.png'),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
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
