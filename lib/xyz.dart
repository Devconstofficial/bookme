import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData {
  String name;
  String email;
  String imageUrl;

  UserData({required this.name, required this.email, required this.imageUrl});
}

class UserDataProvider with ChangeNotifier {
  UserData _userData = UserData(name: '', email: '', imageUrl: '');

  UserData get userData => _userData;

  void updateUserData(String name, String email, String imageUrl) {
    _userData = UserData(name: name, email: email, imageUrl: imageUrl);
    notifyListeners();
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final userProvider = Provider.of<UserDataProvider>(context, listen: false);
    final userData = userProvider.userData;
    _emailController.text = userData.email;
    _usernameController.text = userData.name;
    imageUrl = userData.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your UI elements for editing profile
            // ...

            ElevatedButton(
              onPressed: () {
                // Save the updated data
                final name = _usernameController.text;
                final email = _emailController.text;
                final userProvider =
                    Provider.of<UserDataProvider>(context, listen: false);
                userProvider.updateUserData(name, email, imageUrl);
                Navigator.pop(context); // Close the EditProfileScreen
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context).userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your UI elements for displaying user profile
            // ...

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        home: UserProfileScreen(),
      ),
    ),
  );
}
