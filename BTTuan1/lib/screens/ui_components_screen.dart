import 'package:flutter/material.dart';
import 'text_detail_screen.dart';
import 'images_screen.dart';
import 'textfield_screen.dart';
import 'row_layout_screen.dart';
import 'password_field_screen.dart';
import 'column_layout_screen.dart';
import 'box_layout_screen.dart';
import 'switch_screen.dart';
import 'selection_screen.dart';


class UiComponentsScreen extends StatelessWidget {
  const UiComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Display'),
          _item(
            context,
            title: 'Text',
            subtitle: 'Displays text',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TextDetailScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'Image',
            subtitle: 'Displays an image',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ImagesScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 16),
          _sectionTitle('Input'),
          _item(
            context,
            title: 'TextField',
            subtitle: 'Input field for text',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TextFieldScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'PasswordField',
            subtitle: 'Input field for password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PasswordFieldScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'Switch',
            subtitle: 'On / Off toggle',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SwitchScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'Selection',
            subtitle: 'Checkbox & Radio',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SelectionScreen(),
                ),
              );
            },
          ),



          const SizedBox(height: 16),
          _sectionTitle('Layout'),
          _item(
            context,
            title: 'Column',
            subtitle: 'Arranges elements vertically',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ColumnLayoutScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'Row',
            subtitle: 'Arranges elements horizontally',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RowLayoutScreen(),
                ),
              );
            },
          ),
          _item(
            context,
            title: 'Box',
            subtitle: 'Overlapping elements',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BoxLayoutScreen(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _item(
      BuildContext context, {
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return Card(
      color: Colors.blue.shade100,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
