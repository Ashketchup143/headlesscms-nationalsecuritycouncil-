import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nscheadlesscms/components/Pagename.dart';
import 'package:nscheadlesscms/components/footercontent.dart';
import 'package:nscheadlesscms/components/homebody.dart';
import 'package:nscheadlesscms/components/logoheading.dart';
import 'package:nscheadlesscms/components/topbarcontents.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        title: Expanded(flex: 1, child: topBarContents()),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              LogoHead(),
              PageHead(),
              HomeBody(),
              // Display the list of posts as cards
              Expanded(
                child: Container(
                  width: 1000, // Set the desired width here
                  child: FutureBuilder(
                    future: fetchPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Map<String, dynamic>> posts =
                            snapshot.data as List<Map<String, dynamic>>;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];

                            // Remove HTML tags
                            String cleanExcerpt = post['content']['rendered']
                                .replaceAll(
                                    RegExp(r'<[^>]*>'), '') // Remove HTML tags
                                .replaceAll(
                                    '[&hellip;]', '') // Remove specific content
                                .trim();

                            // Limit the number of lines
                            final int maxLines =
                                8; // Set the desired number of lines
                            String limitedContent =
                                _limitLines(cleanExcerpt, maxLines);

                            return Card(
                              elevation: 5.0,
                              child: ListTile(
                                title: Text(
                                  post['title']['rendered'],
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(limitedContent),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  child: Text('Read More'),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://www.addu.edu.ph/wp-json/wp/v2/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return List<Map<String, dynamic>>.from(responseData);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Function to limit the number of lines in a string
  String _limitLines(String text, int maxLines) {
    List<String> lines = LineSplitter.split(text).take(maxLines).toList();
    return lines.join('\n');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
