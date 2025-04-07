import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyde_stylehub/core/models/theme_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<ThemeModel>> _themesFuture;

  @override
  void initState() {
    super.initState();
    _themesFuture = fetchThemes();
  }

  Future<List<ThemeModel>> fetchThemes() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/HyDE-Project/hyde-gallery/master/hyde-themes.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ThemeModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load themes');
    }
  }

  Widget _buildThemeCard(ThemeModel theme) {
    final imageUrlPng =
        'https://raw.githubusercontent.com/HyDE-Project/hyde-gallery/master/${Uri.encodeComponent(theme.name)}/image.png';
    final imageUrlJpg =
        'https://raw.githubusercontent.com/HyDE-Project/hyde-gallery/master/${Uri.encodeComponent(theme.name)}/image.jpg';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with fallback
          FutureBuilder(
            future: http.get(Uri.parse(imageUrlPng)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasData && snapshot.data?.statusCode == 200) {
                return Image.network(imageUrlPng, fit: BoxFit.cover, height: 200, width: double.infinity);
              } else {
                return Image.network(imageUrlJpg, fit: BoxFit.cover, height: 200, width: double.infinity);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(theme.name,
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(theme.description),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: theme.colorScheme
                      .map((color) => CircleAvatar(
                            backgroundColor: Color(_hexToColor(color)),
                            radius: 10,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => _launchURL(theme.link),
                      child: const Text('View Theme'),
                    ),
                    TextButton(
                      onPressed: () => _launchURL(theme.owner),
                      child: const Text('Owner'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int _hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  void _launchURL(String url) async {
    // Use url_launcher
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HyDE Themes Gallery')),
      body: FutureBuilder<List<ThemeModel>>(
        future: _themesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final themes = snapshot.data!;
            return ListView.builder(
              itemCount: themes.length,
              itemBuilder: (context, index) {
                return _buildThemeCard(themes[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}