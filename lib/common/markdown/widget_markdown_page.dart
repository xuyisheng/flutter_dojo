import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/markdown/syntax_highlighter.dart';

class MarkdownPage extends StatefulWidget {
  final demoFilePath;

  MarkdownPage(this.demoFilePath);

  @override
  _MarkdownPageState createState() => _MarkdownPageState();
}

class _MarkdownPageState extends State<MarkdownPage> {
  String _markdownCodeString;

  @override
  void didChangeDependencies() {
    getExampleCode(context, '${widget.demoFilePath}', DefaultAssetBundle.of(context)).then<void>((String code) {
      if (mounted) {
        setState(() {
          _markdownCodeString = code ?? 'Example code not found';
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget mdCode;
    var style = SyntaxHighlighterStyle.lightThemeStyle();

    try {
      DartSyntaxHighlighter(style).format(_markdownCodeString);
      mdCode = Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
            children: <TextSpan>[
              DartSyntaxHighlighter(style).format(_markdownCodeString),
            ],
          ),
        ),
      );
    } catch (err) {
      mdCode = Text(_markdownCodeString ??= '');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo code'),
      ),
      body: _markdownCodeString == null
          ? Center(
              child: Text('Not found'),
            )
          : SingleChildScrollView(
              child: mdCode,
            ),
    );
  }
}

Map<String, String> _exampleCode;
String _code;

Future<String> getExampleCode(context, String filePath, AssetBundle bundle) async {
  if (_exampleCode == null) await _parseExampleCode(context, filePath, bundle);
  return _code;
}

Future<void> _parseExampleCode(context, String filePath, AssetBundle bundle) async {
  String code;
  try {
    code = await bundle.loadString(filePath);
  } catch (err) {
    Navigator.of(context).pop();
  }
  _code = code;
}
