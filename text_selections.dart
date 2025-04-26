import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for Clipboard functionality

// 1. Basic Selectable Text
class BasicSelectableText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      'This text is selectable. Long-press and drag to select it.',
      style: TextStyle(fontSize: 20.0),
    );
  }
}

// 2. Full Scaffold with SelectionArea
class ScaffoldWithSelectableText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Selectable Text App'),
        ),
        body: Center(
          child: Text('This text is selectable. Long-press and drag to select it.'),
        ),
      ),
    );
  }
}

// 3. Selectable Rich Text
class SelectableRichTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: 'This is a selectable rich text. ',
        style: TextStyle(fontSize: 20.0),
        children: [
          TextSpan(
            text: 'You can select individual spans of text.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// 4. Selectable Text with Copy Action (Fixed version)
class SelectableTextWithCopyAction extends StatefulWidget {
  @override
  _SelectableTextWithCopyActionState createState() => _SelectableTextWithCopyActionState();
}

class _SelectableTextWithCopyActionState extends State<SelectableTextWithCopyAction> {
  final String _text = 'This text is selectable. Long-press and drag to select it.';

  void _showCopyMenu(BuildContext context) async {
    final selectedAction = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem<String>(
          value: 'copy',
          child: Row(
            children: [
              Icon(Icons.copy),
              SizedBox(width: 8),
              Text('Copy'),
            ],
          ),
        ),
      ],
    );

    if (selectedAction == 'copy') {
      await Clipboard.setData(ClipboardData(text: _text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Text copied to clipboard!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Text with Copy Action'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () => _showCopyMenu(context),
          child: SelectableText(
            _text,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
