import 'package:flutter/material.dart';
import 'settings/account_page.dart';
import 'settings/privacy_policy_page.dart';
import 'settings/terms_of_service_page.dart';
import 'settings/help_and_support_page.dart';
import 'settings/notifications_page.dart';

class ProfilePage extends StatelessWidget {
  final List settings = [
    {'title': 'Account', 'icon': Icons.settings, 'page': AccountPage()},
    {
      'title': 'Notifications',
      'icon': Icons.notifications,
      'page': NotificationsPage(),
    },
    {
      'title': 'Privacy Policy',
      'icon': Icons.privacy_tip,
      'page': PrivacyPolicyPage(),
    },
    {
      'title': 'Terms of Service',
      'icon': Icons.description,
      'page': TermsOfServicePage(),
    },
    {
      'title': 'Help & Support',
      'icon': Icons.help,
      'page': HelpAndSupportPage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://picsum.photos/id/1005/200/200',
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'john.doe@example.com',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Edit Profile')),
        SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: settings.length,
            itemBuilder: (context, index) {
              final setting = settings[index];
              return ListTile(
                leading: Icon(setting['icon']),
                title: Text(setting['title']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => setting['page']),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
