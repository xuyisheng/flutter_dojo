import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/markdown/syntax_highlighter.dart';

class CodePage extends StatefulWidget {
  final demoFilePath;

  CodePage(this.demoFilePath);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  String _markdownCodeString;
  var style = SyntaxHighlighterStyle.darkThemeStyle();

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
    try {
      DartSyntaxHighlighter(style).format(_markdownCodeString);
      mdCode = Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 12.0),
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
      backgroundColor: style.codeBackground,
      appBar: AppBar(
        title: Text('Demo code'),
        actions: [
          IconButton(
              icon: Icon(Icons.wb_sunny),
              onPressed: () {
                setState(() {
                  style = SyntaxHighlighterStyle.lightThemeStyle();
                });
              }),
        ],
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
