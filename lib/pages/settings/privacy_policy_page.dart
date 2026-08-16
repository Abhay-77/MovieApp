import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Effective Date: August 16, 2026',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          Text(
            'Your privacy matters to us. This policy explains what data we collect, how we use it, and the choices you have.',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          SizedBox(height: 20),
          _SectionTitle('1. Information We Collect'),
          _Paragraph(
            'We may collect account details (name and email), app usage data, device information, and preferences such as language and notification settings.',
          ),
          _SectionTitle('2. How We Use Information'),
          _Paragraph(
            'We use data to provide app features, personalize recommendations, improve performance, and communicate important updates.',
          ),
          _SectionTitle('3. Data Sharing'),
          _Paragraph(
            'We do not sell your personal information. We may share limited data with trusted service providers that help us operate the app, subject to strict confidentiality obligations.',
          ),
          _SectionTitle('4. Security'),
          _Paragraph(
            'We apply technical and organizational safeguards to protect your data. No method of transmission or storage is 100% secure, but we continuously improve our protections.',
          ),
          _SectionTitle('5. Your Choices'),
          _Paragraph(
            'You can update your profile information, manage notification preferences, and request account deletion by contacting support.',
          ),
          _SectionTitle('6. Contact Us'),
          _Paragraph(
            'If you have privacy questions, contact us at privacy@movieapp.example.',
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;

  const _Paragraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, height: 1.5),
    );
  }
}
