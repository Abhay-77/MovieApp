import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms of Service')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Effective Date: August 16, 2026',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          Text(
            'By using Movie App, you agree to the following terms and conditions.',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          SizedBox(height: 20),
          _SectionTitle('1. Use of Service'),
          _Paragraph(
            'You agree to use the app lawfully and in a manner that does not harm the app, other users, or third parties.',
          ),
          _SectionTitle('2. Account Responsibility'),
          _Paragraph(
            'You are responsible for maintaining the confidentiality of your account credentials and for activities under your account.',
          ),
          _SectionTitle('3. Content and Availability'),
          _Paragraph(
            'Movie metadata and availability may change at any time. We strive for accuracy but cannot guarantee all details are complete or current.',
          ),
          _SectionTitle('4. Acceptable Conduct'),
          _Paragraph(
            'You may not attempt to reverse engineer, disrupt, scrape excessively, or misuse app services in ways that violate applicable laws.',
          ),
          _SectionTitle('5. Limitation of Liability'),
          _Paragraph(
            'The app is provided on an as-is basis. To the extent permitted by law, we are not liable for indirect or consequential damages.',
          ),
          _SectionTitle('6. Changes to Terms'),
          _Paragraph(
            'We may update these terms from time to time. Continued use of the app after updates means you accept the revised terms.',
          ),
          _SectionTitle('7. Contact'),
          _Paragraph(
            'Questions about these terms can be sent to legal@movieapp.example.',
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
