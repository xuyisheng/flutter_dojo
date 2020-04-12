import 'dart:math';

class SearchUtils {
  static TreeNode _dictionaryTree, _copy;
  static List<String> _dictionaryList;
  List<String> _prefixSearchResult;
  List<String> _similaritySearchResult;

  ///默认的搜索策略
  ///默认的最大编辑距离是字符串长度整除4,起码允许打错1个字符
  ///结果用Set返回，去除了重复数据
  Set<String> defaultSearchStrategy(String word) {
    Set<String> result = new Set();

    int defaultDistance = word.length ~/ 4;
    if (defaultDistance < 1) {
      defaultDistance = 1;
    }
    result.addAll(searchSimilarWords(word, defaultDistance));
    result.addAll(searchWordsInTrie(word));
    return result;
  }

  ///从字典中搜索和input相似的单词，编辑距离小等于distance
  List<String> searchSimilarWords(String inputWord, int distance) {
    if (_similaritySearchResult == null) {
      _similaritySearchResult = List();
    }
    for (String wordInDictionary in _dictionaryList) {
      if (_matchSimilarWords(wordInDictionary, inputWord, distance)) {
        _similaritySearchResult.add(wordInDictionary);
      }
    }
    return _similaritySearchResult;
  }

  bool _matchSimilarWords(String word1, String word2, int distance) {
    List<List<int>> dp = new List();
    int len1 = word1.length;
    int len2 = word2.length;
    for (int i = 0; i < len1; i++) {
      dp.add(new List(len2));
    }
    dp[0][0] = word1[0].toLowerCase() == word2[0].toLowerCase() ? 0 : 1;

    for (int i = 1; i < len1; i++) {
      if (word1[i] == word2[0] && dp[i - 1][0] + 1 > i) {
        dp[i][0] = i;
      } else {
        dp[i][0] = dp[i - 1][0] + 1;
      }
    }
    for (int j = 1; j < len2; j++) {
      if (word2[j] == word1[0] && dp[0][j - 1] + 1 > j) {
        dp[0][j] = j;
      } else {
        dp[0][j] = dp[0][j - 1] + 1;
      }
    }
    for (int i = 1; i < len1; i++) {
      for (int j = 1; j < len2; j++) {
        dp[i][j] = min(dp[i - 1][j] + 1, dp[i][j - 1] + 1);
        int convert = word1[i].toLowerCase() == word2[j].toLowerCase() ? 0 : 1;
        dp[i][j] = min(dp[i][j], dp[i - 1][j - 1] + convert);
      }
    }
    return dp[len1 - 1][len2 - 1] <= distance;
  }

  ///通过前缀在字典树中查找所有单词
  List<String> searchWordsInTrie(String prefix) {
    if (_dictionaryTree == null) {
      return new List<String>();
    }
    _copy = _dictionaryTree;
    _prefixSearchResult = new List<String>();
    String matchedPrefix = "";
    for (int i = 0; i < prefix.length; i++) {
      if (!_matchLetter(prefix[i])) {
        return new List<String>();
      } else {
        matchedPrefix = matchedPrefix + _copy.val;
      }
    }
    _searchAllWords(matchedPrefix, _copy);
    return _prefixSearchResult;
  }

  bool _matchLetter(String letter) {
    for (TreeNode child in _copy.children) {
      if (letter.toLowerCase() == child.val.toLowerCase()) {
        _copy = child;
        return true;
      }
    }
    return false;
  }

  void _searchAllWords(String result, TreeNode copy) {
    if (copy.endFlag) {
      _prefixSearchResult.add(result);
    }
    for (TreeNode child in copy.children) {
      _searchAllWords(result + child.val, child);
    }
  }

  ///更新单词组
  updateWords(List<String> words) {
    clearDictionary();
    for (String word in words) {
      addWord(word);
    }
  }

  ///添加单个的单词
  addWord(String word) {
    if (_dictionaryList == null) {
      _dictionaryList = new List<String>();
    }
    _dictionaryList.add(word);

    if (_dictionaryTree == null) {
      _dictionaryTree = new TreeNode("");
    }
    _copy = _dictionaryTree;
    for (int i = 0; i < word.length; i++) {
      _addWordInTrie(word[i], i == word.length - 1);
    }
  }

  _addWordInTrie(String c, bool endFlag) {
    bool containFlag = false;
    for (TreeNode child in _copy.children) {
      if (child.val.toLowerCase() == c.toLowerCase()) {
        containFlag = true;
        _copy = child;
        break;
      }
    }
    if (!containFlag) {
      TreeNode childNode = new TreeNode(c);
      _copy.children.add(childNode);
      _copy = childNode;
    }
    if (_copy.endFlag == null || !_copy.endFlag) {
      _copy.endFlag = endFlag;
    }
  }

  ///清空整个字典
  void clearDictionary() {
    _dictionaryList = null;
    _dictionaryTree = null;
    _copy = null;
    _prefixSearchResult = null;
  }

  ///清除查找结果
  void clearSearchResult() {
    _prefixSearchResult = null;
    _similaritySearchResult = null;
  }
}

class TreeNode {
  List<TreeNode> children = new List();
  String val;
  bool endFlag;

  TreeNode(this.val);
}
