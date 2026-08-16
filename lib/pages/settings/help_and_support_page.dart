import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: Colors.green.shade50,
            child: const ListTile(
              leading: Icon(Icons.support_agent_outlined),
              title: Text('How can we help?'),
              subtitle: Text(
                'Find quick answers below or contact the support team directly.',
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text('How do I search for a movie?'),
            childrenPadding: EdgeInsets.only(bottom: 12),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Go to the Movies tab and use the search field at the top. Results update automatically as you type.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text('Why is a movie poster missing?'),
            childrenPadding: EdgeInsets.only(bottom: 12),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Some titles may not have poster artwork available from the movie data source.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text('How do I update my profile?'),
            childrenPadding: EdgeInsets.only(bottom: 12),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Open Profile, then tap Edit Profile to update your details.',
                ),
              ),
            ],
          ),
          const Divider(height: 28),
          const Text(
            'Contact Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.email_outlined),
            title: const Text('Email'),
            subtitle: const Text('support@movieapp.example'),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Live Chat'),
            subtitle: const Text('Mon - Fri, 9:00 AM - 6:00 PM'),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text('Report a Problem'),
            subtitle: const Text('Tell us what happened and we will investigate'),
            onTap: () {},
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.description_outlined),
            label: const Text('View App Version and Diagnostics'),
          ),
        ],
      ),
    );
  }
}
