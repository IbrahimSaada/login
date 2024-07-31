import 'package:flutter/material.dart';
import 'package:login2/home/add_friends_page.dart';
import 'package:login2/home/contacts_page.dart';
import 'package:login2/home/notification_page.dart';
import 'package:login2/menu/menu_page.dart';
import 'package:login2/services/SecureService.dart';
import 'comment_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  int likeCount = 0;
  int commentCount = 0;

  final SecureService _secureService = SecureService();
  String _secureData = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadSecureData();
  }

  void _loadSecureData() async {
    try {
      var data = await _secureService.getSecureData();
      setState(() {
        _secureData = data;
      });
    } catch (e) {
      setState(() {
        _secureData = "Failed to load secure data: ${e.toString()}";
      });
      print('Error: $e');
    }
  }

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

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjusted padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                    ),
                    Text(
                      'Project',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 48.0), // Placeholder for alignment
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjusted padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.person_add, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddFriendsPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.videocam, color: Colors.orange),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotificationPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactsPage()),
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

  Widget buildStoriesSection() {
    return Container(
      height: 190,
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
    );
  }

  Widget buildShareSection() {
    return Form(
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
                    labelText: 'What do you want to share...',
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
                        icon: Icon(Icons.camera_alt, color: Colors.orange),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.photo, color: Colors.orange),
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
    );
  }

  Widget buildPostSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/50/50'),
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
              Spacer(),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Hide this post'),
                  ),
                  PopupMenuItem(
                    child: Text('Report'),
                  ),
                  PopupMenuItem(
                    child: Text('Block'),
                  ),
                ],
                child: Icon(Icons.more_vert, color: Colors.orange),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Our post:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            child: Image.network(
              'https://picsum.photos/600/300',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    likeCount++;
                  });
                },
              ),
              Text('$likeCount'),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.comment, color: Colors.orange),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentPage()),
                  );
                  setState(() {
                    commentCount++;
                  });
                },
              ),
              Text('$commentCount'),
              IconButton(
                icon: Icon(Icons.share, color: Colors.orange),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.bookmark, color: Colors.orange),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 2, color: Colors.grey[300]),
            buildStoriesSection(),
            Divider(thickness: 2, color: Colors.grey[300]), // Separator
            buildShareSection(),
            Divider(thickness: 2, color: Colors.grey[300]), // Separator
            buildPostSection(),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                _secureData,
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
