import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool pushAlerts = true;
  bool newReleases = true;
  bool watchlistReminders = true;
  bool productUpdates = false;
  bool emailDigest = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 0,
            color: Colors.amber.shade50,
            child: const ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text('Stay in the loop'),
              subtitle: Text(
                'Choose what you want to hear about. You can change these anytime.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Push Alerts'),
            subtitle: const Text('Receive alerts on your device'),
            value: pushAlerts,
            onChanged: (value) => setState(() => pushAlerts = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('New Releases'),
            subtitle: const Text('Get notified when trending titles launch'),
            value: newReleases,
            onChanged: (value) => setState(() => newReleases = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Watchlist Reminders'),
            subtitle: const Text('Remind me about movies in my watchlist'),
            value: watchlistReminders,
            onChanged: (value) => setState(() => watchlistReminders = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Product Updates'),
            subtitle: const Text('Tips and feature announcements'),
            value: productUpdates,
            onChanged: (value) => setState(() => productUpdates = value),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Weekly Email Digest'),
            subtitle: const Text('Top picks and recap every Friday'),
            value: emailDigest,
            onChanged: (value) => setState(() => emailDigest = value),
          ),
          const Divider(height: 24),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.nights_stay_outlined),
            title: Text('Quiet Hours'),
            subtitle: Text('10:00 PM - 7:00 AM'),
          ),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.language_outlined),
            title: Text('Notification Language'),
            subtitle: Text('English (US)'),
          ),
        ],
      ),
    );
  }
}
