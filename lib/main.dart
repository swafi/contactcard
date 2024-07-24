import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact_Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactCardPage(),
    );
  }
}

class ContactCardPage extends StatelessWidget {
  const ContactCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lets Connect'),
      ),
      body: Container(
        child: Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/len.jpg'), // Use backgroundImage for asset images
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'David Swafi Kombo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text('Social Impact Innovator'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _launchLinkedIn('Davidswafi'),
                    icon: const Icon(Icons.link),
                    label: const Text('Connect on LinkedIn'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _launchPhone('1234567890'), // Replace with your phone number
                    icon: const Icon(Icons.phone),
                    label: const Text('Call'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _launchMessage('Hello, I would like to connect!'),
                    icon: const Icon(Icons.message),
                    label: const Text('Message'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchLinkedIn(String username) async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/david_swafi_kombo');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchMessage(String message) async {
    final Uri url = Uri.parse('sms:?body=Hello, I would like to connect!');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
