import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:login2/home/add_friends_page.dart';
import 'package:login2/home/contacts_page.dart';
import 'package:login2/home/notification_page.dart';
import 'package:login2/menu/menu_page.dart';
import 'package:login2/services/SecureService.dart';
import 'package:login2/home/full_screen_image_page.dart';
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
    // Simulate data loading
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _secureData = "Secure data loaded";
      });
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

  Widget buildSkeletonStoriesSection() {
    return Container(
      height: 190,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
          );
        },
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

  @override
  Widget build(BuildContext context) {
    bool isLoading = _secureData == "Loading...";
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
            isLoading
                ? buildSkeletonStoriesSection()
                : buildSkeletonStoriesSection(),
            Divider(thickness: 1, color: Colors.grey[300]), // Separator
            isLoading
                ? buildSkeletonShareSection()
                : buildSkeletonShareSection(),
            Divider(thickness: 1, color: Colors.grey[300]), // Separator
            isLoading ? buildSkeletonPostSection() : buildSkeletonPostSection(),
            SizedBox(height: 16.0),
            if (!isLoading)
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
