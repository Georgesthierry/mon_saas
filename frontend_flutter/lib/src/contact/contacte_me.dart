import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  Future<void> sendContact() async {
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.contact}");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text,
        "email": emailController.text,
        "subject": subjectController.text,
        "message": messageController.text,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Erreur envoi message");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                Text(
                  "Contact Me",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "Discutons de votre projet 🚀",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 60),

                context.isDesktop
                    ? _ContactDesktop(context)
                    : _ContactMobile(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// ================= DESKTOP =================
  Widget _ContactDesktop(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// FORM
          Expanded(
            flex: 2,
            child: StyledCard(
              borderEffect: true,
              child: _buildForm(context),
            ),
          ),

          const SizedBox(width: 40),

          /// CONTACT INFO
          Expanded(
            child: StyledCard(
              child: _buildContactInfo(context),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= MOBILE =================
  Widget _ContactMobile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        children: [
          StyledCard(
            borderEffect: true,
            child: _buildForm(context),
          ),
          const SizedBox(height: 30),
          StyledCard(
            child: _buildContactInfo(context),
          ),
        ],
      ),
    );
  }

  /// ================= FORM =================
  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Your Email"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your email";
              }
              if (!isValidEmail(value)) {
                return "Enter valid email";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Your Name"),
            validator: (value) =>
            value!.isEmpty ? "Enter your name" : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: subjectController,
            decoration: const InputDecoration(labelText: "Subject"),
            validator: (value) =>
            value!.isEmpty ? "Enter subject" : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: messageController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: "Message"),
            validator: (value) =>
            value!.isEmpty ? "Enter message" : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await sendContact();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message envoyé ✅")),
                    );

                    nameController.clear();
                    emailController.clear();
                    subjectController.clear();
                    messageController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Erreur : $e")),
                    );
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("Send Message"),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// ================= CONTACT INFO =================
  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informations",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        _contactItem(Icons.email, "contact@yenlei.com"),
        const SizedBox(height: 15),
        _contactItem(Icons.phone, "+22507491638"),
        const SizedBox(height: 15),
        _contactItem(Icons.location_on, "Cote d'ivoire"),
      ],
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}