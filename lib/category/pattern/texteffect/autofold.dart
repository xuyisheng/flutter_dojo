import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AutoFoldWidget extends StatefulWidget {
  @override
  _AutoFoldWidgetState createState() => _AutoFoldWidgetState();
}

class _AutoFoldWidgetState extends State<AutoFoldWidget> {
  final String desc = 'The first is one which allocates resources in '
      '[State.initState] and disposes of them in [State.dispose], '
      'but which does not depend on [InheritedWidget]s or call [State.setState]. '
      'Such widgets are commonly used at the root of an application or page, '
      'and communicate with subwidgets via [ChangeNotifier]s, [Stream]s, or other such objects.';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          MainTitleWidget('通过AnimatedCrossFade实现可伸缩Text展示'),
          Padding(
            padding: EdgeInsets.all(8),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              secondChild: Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                setState(() => isExpanded = !isExpanded);
              },
              child: Text(
                isExpanded ? "less" : "more..",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          MainTitleWidget('通过TextPainter计算后组合Text'),
          ReadMoreText(
            desc,
            trimLines: 2,
            colorClickableText: Colors.blueAccent,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...More',
            trimExpandedText: '...Less',
          ),
        ],
      ),
    );
  }
}

enum TrimMode {
  Length,
  Line,
}

class ReadMoreText extends StatefulWidget {
  const ReadMoreText(
    this.data, {
    Key key,
    this.trimExpandedText = ' read less',
    this.trimCollapsedText = ' ...read more',
    this.colorClickableText,
    this.trimLength = 240,
    this.trimLines = 2,
    this.trimMode = TrimMode.Length,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.textScaleFactor,
    this.semanticsLabel,
  })  : assert(data != null),
        super(key: key);

  final String data;
  final String trimExpandedText;
  final String trimCollapsedText;
  final Color colorClickableText;
  final int trimLength;
  final int trimLines;
  final TrimMode trimMode;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final double textScaleFactor;
  final String semanticsLabel;

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

const String _kEllipsis = '\u2026';
const String _kLineSeparator = '\u2028';

class ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle effectiveTextStyle = widget.style;
    if (widget.style == null || widget.style.inherit) {
      effectiveTextStyle = defaultTextStyle.style.merge(widget.style);
    }

    final textAlign = widget.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;
    final textDirection = widget.textDirection ?? Directionality.of(context);
    final textScaleFactor = widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context);
    final overflow = defaultTextStyle.overflow;
    final locale = widget.locale ?? Localizations.localeOf(context, nullOk: true);

    final colorClickableText = widget.colorClickableText ?? Theme.of(context).accentColor;

    TextSpan link = TextSpan(
      text: _readMore ? widget.trimCollapsedText : widget.trimExpandedText,
      style: effectiveTextStyle.copyWith(
        color: colorClickableText,
      ),
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(
          style: effectiveTextStyle,
          text: widget.data,
        );
        TextPainter textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: widget.trimLines,
          ellipsis: overflow == TextOverflow.ellipsis ? _kEllipsis : null,
          locale: locale,
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        bool linkLongerThanLine = false;
        int endIndex;
        if (linkSize.width < maxWidth) {
          final pos = textPainter.getPositionForOffset(Offset(
            textSize.width - linkSize.width,
            textSize.height,
          ));
          endIndex = textPainter.getOffsetBefore(pos.offset);
        } else {
          var pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
          linkLongerThanLine = true;
        }
        var textSpan;
        switch (widget.trimMode) {
          case TrimMode.Length:
            if (widget.trimLength < widget.data.length) {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: _readMore ? widget.data.substring(0, widget.trimLength) : widget.data,
                children: <TextSpan>[link],
              );
            } else {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: widget.data,
              );
            }
            break;
          case TrimMode.Line:
            if (textPainter.didExceedMaxLines) {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: _readMore
                    ? widget.data.substring(0, endIndex) + (linkLongerThanLine ? _kLineSeparator : '')
                    : widget.data,
                children: <TextSpan>[link],
              );
            } else {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: widget.data,
              );
            }
            break;
          default:
            throw Exception('TrimMode type: ${widget.trimMode} is not supported');
        }
        return RichText(
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: true,
          overflow: TextOverflow.clip,
          textScaleFactor: textScaleFactor,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
