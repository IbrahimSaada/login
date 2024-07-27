import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:login2/home/contacts_page.dart'; // Import the contacts_page

class ChatPage extends StatefulWidget {
  final Contact contact;

  ChatPage({required this.contact});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> messages = [];
  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    await _recorder!.openAudioSession();
    if (await Permission.microphone.request().isGranted) {
      print("Microphone permission granted");
    }
  }

  @override
  void dispose() {
    _recorder!.closeAudioSession();
    super.dispose();
  }

  Future<void> _pickMedia({required bool isVideo}) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? media = await (isVideo ? _picker.pickVideo(source: ImageSource.gallery) : _picker.pickImage(source: ImageSource.gallery));

    if (media != null) {
      setState(() {
        messages.add({
          'text': null,
          'image': isVideo ? null : media.path,
          'video': isVideo ? media.path : null,
          'date': DateTime.now(),
          'isSentByMe': true,
        });
      });
    }
  }

  Future<void> _recordVoice() async {
    if (_isRecording) {
      setState(() {
        _isRecording = false;
      });
      String? filePath = await _recorder!.stopRecorder();
      setState(() {
        messages.add({
          'text': null,
          'audio': filePath,
          'date': DateTime.now(),
          'isSentByMe': true,
        });
      });
    } else {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        // Handle the case when the user declines the microphone permission
        return;
      }
      setState(() {
        _isRecording = true;
      });
      await _recorder!.startRecorder(toFile: 'audio_record.aac');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.contact.imageUrl),
              radius: 20.0,
            ),
            SizedBox(width: 10),
            Text(widget.contact.name),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Column(
                  children: [
                    if (index == 0 ||
                        !isSameDay(messages[index - 1]['date'], message['date']))
                      Text(
                        DateFormat('yyyy-MM-dd').format(message['date']),
                        style: TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
                      ),
                    ChatMessage(
                      text: message['text'],
                      image: message['image'],
                      video: message['video'],
                      audio: message['audio'],
                      isSentByMe: message['isSentByMe'],
                    ),
                  ],
                );
              },
            ),
          ),
          MessageComposer(
            onSendMessage: (text) {
              setState(() {
                messages.add({
                  'text': text,
                  'image': null,
                  'video': null,
                  'audio': null,
                  'date': DateTime.now(),
                  'isSentByMe': true,
                });
              });
            },
            onPickImage: () => _pickMedia(isVideo: false),
            onPickVideo: () => _pickMedia(isVideo: true),
            onRecordVoice: _recordVoice,
            isRecording: _isRecording,
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

class ChatMessage extends StatelessWidget {
  final String? text;
  final String? image;
  final String? video;
  final String? audio;
  final bool isSentByMe;

  ChatMessage({this.text, this.image, this.video, this.audio, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    Widget messageContent;

    if (text != null) {
      messageContent = Text(
        text!,
        style: TextStyle(
          color: isSentByMe ? Colors.white : Colors.black87,
        ),
      );
    } else if (image != null) {
      messageContent = Image.network(image!);
    } else if (video != null) {
      messageContent = VideoPlayerWidget(videoUrl: video!);
    } else if (audio != null) {
      messageContent = Icon(Icons.audiotrack, color: isSentByMe ? Colors.white : Colors.black87);
      // Add audio playback functionality here
    } else {
      messageContent = SizedBox.shrink();
    }

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: messageContent,
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }
}

class MessageComposer extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function onPickImage;
  final Function onPickVideo;
  final Function onRecordVoice;
  final bool isRecording;

  MessageComposer({
    required this.onSendMessage,
    required this.onPickImage,
    required this.onPickVideo,
    required this.onRecordVoice,
    required this.isRecording,
  });

  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo, color: Colors.orange),
            onPressed: widget.onPickImage as void Function()?,
          ),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.orange),
            onPressed: widget.onPickVideo as void Function()?,
          ),
          IconButton(
            icon: Icon(widget.isRecording ? Icons.stop : Icons.mic, color: Colors.orange),
            onPressed: widget.onRecordVoice as void Function()?,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send, color: Colors.orange),
            onPressed: () {
              widget.onSendMessage(_controller.text);
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
