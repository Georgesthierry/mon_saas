import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/contact_provider.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';
import 'package:yenlei_flutter/src/models/contact_model.dart';

class ContactMe extends ConsumerStatefulWidget {
  const ContactMe({super.key});

  @override
  ConsumerState<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends ConsumerState<ContactMe> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    final contact = Contact(
      name: nameController.text,
      email: emailController.text,
      subject: subjectController.text,
      message: messageController.text,
    );

    try {
      await ref.read(contactProvider(contact).future);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Message envoyé ✅")));

      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erreur : $e")));
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

  Widget _ContactDesktop(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: StyledCard(borderEffect: true, child: _buildForm(context)),
          ),
          const SizedBox(width: 40),
          Expanded(child: StyledCard(child: _buildContactInfo(context))),
        ],
      ),
    );
  }

  Widget _ContactMobile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        children: [
          StyledCard(borderEffect: true, child: _buildForm(context)),
          const SizedBox(height: 30),
          StyledCard(child: _buildContactInfo(context)),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: "Your Email"),
            validator: (v) => v == null || v.isEmpty
                ? "Enter your email"
                : (!isValidEmail(v) ? "Enter valid email" : null),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Your Name"),
            validator: (v) => v!.isEmpty ? "Enter your name" : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: subjectController,
            decoration: const InputDecoration(labelText: "Subject"),
            validator: (v) => v!.isEmpty ? "Enter subject" : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: messageController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: "Message"),
            validator: (v) => v!.isEmpty ? "Enter message" : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _sendMessage,
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
        _contactItem(Icons.location_on, "Côte d'Ivoire"),
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