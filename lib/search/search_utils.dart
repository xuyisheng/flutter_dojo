import 'dart:collection';
import 'dart:math';

class SearchUtils {
  TreeNode _dictionaryTree, _copy;
  List<String> _dictionaryList;
  List<String> _prefixSearchResult;
  List<String> _similaritySearchResult;

  ///用这个方法搜索字典，在search_strategy里可以自定义搜索策略
  Set<String> searchInStrategy(SearchStrategy strategy, List<String> words) {
    return strategy.searchInStrategy(this, words);
  }

  Set<String> getDictionary() {
    return Set.from(_dictionaryList);
  }

  ///从字典中搜索和input相似的单词，编辑距离小等于distance
  List<String> searchSimilarWords(String inputWord, int distance) {
    _similaritySearchResult = List();
    if (inputWord == null || inputWord == '') {
      _similaritySearchResult.clear();
      _similaritySearchResult.addAll(_dictionaryList);
      return _similaritySearchResult;
    }

    for (String wordInDictionary in _dictionaryList) {
      if ((wordInDictionary.length - inputWord.length).abs() > distance) {
        continue;
      }
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
    if (prefix == null || prefix == '') {
      return _dictionaryList;
    }
    _copy = _dictionaryTree;
    _prefixSearchResult = new List();
    String matchedPrefix = "";
    for (int i = 0; i < prefix.length; i++) {
      if (!_matchLetter(prefix[i])) {
        return new List<String>();
      } else {
        matchedPrefix = matchedPrefix + _copy.val;
      }
    }
    _searchAllWords(_copy);
    return _prefixSearchResult;
  }

  ///从字典单词的任意位置开始匹配前缀
  List<TreeNode> matchedList;

  Set<String> enhancedTriesSearch(String prefix) {
    if (_dictionaryTree == null) {
      return Set<String>();
    }
    if (prefix == null || prefix == '') {
      return Set.from(_dictionaryList);
    }
    _copy = _dictionaryTree;

    matchedList = List();
    Queue<TreeNode> queue = Queue(); //广度优先搜索队列
    queue.add(_copy);
    _matchFirstLetter(queue, prefix);

    _prefixSearchResult = new List();
    for (TreeNode node in matchedList) {
      _searchAllWords(node);
    }

    return Set.from(_prefixSearchResult);
  }

  ///找到字典树中所有出现过首字母的地方，并以这些地方开始向下搜索(层次遍历)
  void _matchFirstLetter(Queue<TreeNode> nodeQueue, String target) {
    Queue<TreeNode> nextQueue = Queue();
    if (nodeQueue.length == 0) {
      return;
    }
    while (nodeQueue.length > 0) {
      TreeNode tempNode = nodeQueue.removeLast();
      if (tempNode.val.toLowerCase() == target[0].toLowerCase()) {
        TreeNode backupNode = tempNode;
        _matchRestLetter(backupNode, target);
      }
      tempNode.children.forEach((childNode) => nextQueue.add(childNode));
    }

    _matchFirstLetter(nextQueue, target);
  }

  ///匹配首字母以外的其他字母
  void _matchRestLetter(TreeNode node, String target) {
    if (target.length == 1) {
      matchedList.add(node);
    } else {
      for (int i = 1; i < target.length; i++) {
        bool isMatched = false;
        for (TreeNode child in node.children) {
          if (child.val.toLowerCase() == target[i].toLowerCase()) {
            node = child;
            isMatched = true;
            break;
          }
        }
        if (!isMatched) {
          return;
        }
      }
      if (!matchedList.contains(node)) {
        matchedList.add(node);
      }
    }
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

  void _searchAllWords(TreeNode copy) {
    _prefixSearchResult.addAll(copy.intactWord);
//    if (copy.endFlag) {
//      _prefixSearchResult.add(result);
//    }
//    for (TreeNode child in copy.children) {
//      _searchAllWords(result + child.val, child);
//    }
  }

  ///KMP
  bool kmpMatch(String s, String t) {
    List<int> next = getNextArray(t);
    int i = 0, j = 0;
    while (i < s.length && j < t.length) {
      if (j == -1 || s[i] == t[j]) {
        i++;
        j++;
      } else
        j = next[j];
    }
    if (j == t.length)
//      return i - j;
      return true;
    else
//      return -1;
      return false;
  }

  List<int> getNextArray(String t) {
    List<int> next = new List(t.length);
    next[0] = -1;
    next[1] = 0;
    int k;
    for (int j = 2; j < t.length; j++) {
      k = next[j - 1];
      while (k != -1) {
        if (t[j - 1] == t[k]) {
          next[j] = k + 1;
          break;
        } else {
          k = next[k];
        }
        next[j] = 0; //当k==-1而跳出循环时，next[j] = 0，否则next[j]会在break之前被赋值
      }
    }
    return next;
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
      _addWordInTrie(word[i], word, i == word.length - 1);
    }
  }

  ///把单词添加到字典树
  _addWordInTrie(String c, String intactWord, bool endFlag) {
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

    _copy.intactWord.add(intactWord);
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

abstract class SearchStrategy {
  Set<String> searchInStrategy(SearchUtils utils, List<String> words);
}

class TreeNode {
  List<TreeNode> children = new List();
  List<String> intactWord = new List();
  String val;
  bool endFlag;

  TreeNode(this.val);
}
