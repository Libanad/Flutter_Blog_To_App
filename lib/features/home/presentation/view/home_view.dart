import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _blogs = List.generate(
    10,
    (index) => {
      'title': 'Blog Post ${index + 1}',
      'content': 'This is a brief description of blog post ${index + 1}.',
      'image': 'https://via.placeholder.com/50?text=${index + 1}', // Placeholder image URL
    },
  );

  static final List<Widget> _widgetOptions = <Widget>[
    BlogListView(blogs: []),
    const Center(child: Text('Search')),
    const Center(child: Text('Notification')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWritePostPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreatePostView(onSubmit: _addNewBlog)),
    );
  }

  void _addNewBlog(Map<String, String> newBlog) {
    setState(() {
      _blogs.insert(0, newBlog); // Add new blog at the beginning of the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.create),
              onPressed: _onWritePostPressed,
            ),
          ],
        ),
        body: _selectedIndex == 0
            ? BlogListView(blogs: _blogs)
            : _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.purple),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class BlogListView extends StatelessWidget {
  final List<Map<String, String>> blogs;

  const BlogListView({super.key, required this.blogs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.network(
              blog['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              blog['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(blog['content']!),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Clicked on ${blog['title']}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CreatePostView extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const CreatePostView({super.key, required this.onSubmit});

  @override
  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    });
  }

  void _onSubmit() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final categories = _categoriesController.text;

    if (title.isEmpty || description.isEmpty || categories.isEmpty || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields and select an image')),
      );
      return;
    }

    final newBlog = {
      'title': title,
      'content': description,
      'image': _image!.path, // Use the path of the picked image
    };

    widget.onSubmit(newBlog);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post created successfully!')),
    );

    Navigator.pop(context);

    // Clear the form
    _titleController.clear();
    _descriptionController.clear();
    _categoriesController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _categoriesController,
              decoration: InputDecoration(
                labelText: 'Categories',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            _image == null
                ? const Text('No image selected')
                : Image.file(_image!, height: 150),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
