import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:login2/home/add_friends_page.dart';
import 'package:login2/home/contacts_page.dart';
import 'package:login2/home/notification_page.dart';
import 'package:login2/menu/menu_page.dart';
import 'package:login2/services/SecureService.dart';
import 'package:login2/home/full_screen_image_page.dart';
import 'package:login2/home/comment_page.dart';
import 'package:login2/services/post_service.dart'; // Import your service
import 'package:login2/models/post_model.dart'; // Import your model

class Story {
  final String imageUrl;
  final String userImageUrl;
  final String userName;

  Story({
    required this.imageUrl,
    required this.userImageUrl,
    required this.userName,
  });
}

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

  final SecureService _secureService = SecureService();
  String _secureData = "Loading...";
  List<Post> _posts = [];
  List<Story> _stories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    _fetchStories();
  }

  Future<void> _fetchPosts() async {
    try {
      List<Post> posts =
          await PostService.fetchPosts(); // Call the static method
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      // Handle the error appropriately
      print('Failed to load posts: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchStories() async {
    setState(() {
      _stories = [
        Story(
          imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FF0000/FFFFFF',
          userName: 'Ahmad Ghosen',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/00FF00/FFFFFF',
          userName: 'Aatik Tasneem',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/0000FF/FFFFFF',
          userName: 'Aiony Haust',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FFFF00/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FFFF00/FFFFFF',
          userName: 'Averie Woodard',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FF00FF/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FF00FF/FFFFFF',
          userName: 'John Doe',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/00FFFF/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/00FFFF/FFFFFF',
          userName: 'Jane Smith',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/000000/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/000000/FFFFFF',
          userName: 'Alice Johnson',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FFFFFF/000000',
          userImageUrl: 'https://via.placeholder.com/50/FFFFFF/000000',
          userName: 'Bob Brown',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/808080/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/808080/FFFFFF',
          userName: 'Charlie Davis',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/800000/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/800000/FFFFFF',
          userName: 'Diana Evans',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/008000/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/008000/FFFFFF',
          userName: 'Ethan Harris',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/000080/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/000080/FFFFFF',
          userName: 'Fiona Green',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/808000/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/808000/FFFFFF',
          userName: 'George White',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/800080/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/800080/FFFFFF',
          userName: 'Hannah Black',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/008080/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/008080/FFFFFF',
          userName: 'Ian Clark',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FFA500/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FFA500/FFFFFF',
          userName: 'Jack Lewis',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FFC0CB/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FFC0CB/FFFFFF',
          userName: 'Karen Walker',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/FFD700/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/FFD700/FFFFFF',
          userName: 'Liam Scott',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/00FA9A/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/00FA9A/FFFFFF',
          userName: 'Mia Turner',
        ),
        Story(
          imageUrl: 'https://via.placeholder.com/150/00FF7F/FFFFFF',
          userImageUrl: 'https://via.placeholder.com/50/00FF7F/FFFFFF',
          userName: 'Noah Young',
        ),
      ];
    });
  }

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    SizedBox(width: 48.0),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.person_add, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFriendsPage()),
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
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactsPage()),
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
      height: 220,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          final story = _stories[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 160,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: story.imageUrl,
                          width: 110,
                          height: 160,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 110,
                              height: 160,
                              color: Colors.grey[300],
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(story.userImageUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  story.userName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSkeletonStoriesSection() {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 110,
                height: 160,
                color: Colors.grey[300],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPostInputSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.orange),
              onPressed: () {
                // Handle camera action
              },
            ),
            Expanded(
              child: TextFormField(
                controller: _postController,
                decoration: InputDecoration(
                  hintText: 'What do you want to share...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.orange),
              onPressed: () {
                // Handle edit action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkeletonShareSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }

  Widget buildSkeletonPostSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSkeletonPost(),
          SizedBox(height: 16.0),
          buildSkeletonPostWithCaption(),
          SizedBox(height: 16.0),
          buildSkeletonCaptionOnlyPost(),
        ],
      ),
    );
  }

  Widget buildSkeletonPost() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.grey[300]),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.comment, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.share, color: Colors.grey[300]),
              Spacer(),
              Icon(Icons.bookmark, color: Colors.grey[300]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSkeletonPostWithCaption() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.grey[300]),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.comment, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.share, color: Colors.grey[300]),
              Spacer(),
              Icon(Icons.bookmark, color: Colors.grey[300]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSkeletonCaptionOnlyPost() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 10,
                    color: Colors.grey[300],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.grey[300]),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.comment, color: Colors.grey[300]),
              SizedBox(width: 16.0),
              Icon(Icons.share, color: Colors.grey[300]),
              Spacer(),
              Icon(Icons.bookmark, color: Colors.grey[300]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPost(Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.profilePic),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.fullName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    timeago.format(post.createdAt),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
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
            post.caption ?? '',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          if (post.mediaUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context)
                      .size
                      .width, // Ensure the image does not exceed screen width
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    post.mediaUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
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
              Text('${post.likeCount}'),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.comment, color: Colors.orange),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommentPage(postId: post.postId)),
                  );
                  setState(() {
                    commentCount++;
                  });
                },
              ),
              Text('${post.commentCount}'),
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
            Divider(
              thickness: 2,
              color: Colors.grey[300],
              height: 1,
            ),
            _isLoading ? buildSkeletonStoriesSection() : buildStoriesSection(),
            Divider(thickness: 1, color: Colors.grey[300]), // Separator
            buildPostInputSection(),
            Divider(thickness: 1, color: Colors.grey[300]), // Removed extra line
            _isLoading
                ? buildSkeletonPostSection()
                : Column(
                    children: _posts.map((post) => buildPost(post)).toList(),
                  ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
