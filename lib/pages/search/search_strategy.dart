import 'search_utils.dart';

///默认的搜索策略
///默认的最大编辑距离是字符串长度整除4,起码允许打错1个字符
///结果用Set返回，去除了重复数据
class DefaultSearchStrategy extends SearchStrategy {
  @override
  Set<String> searchInStrategy(SearchUtils utils, List<String> words) {
    Set<String> result = new Set();
    if (words == null || words.length == 0) {
      result.addAll(utils.getDictionary());
      return result;
    }
    for (var word in words) {
      int defaultDistance = word.length ~/ 4;
      if (defaultDistance < 1) {
        defaultDistance = 1;
      }
      result.addAll(utils.searchSimilarWords(word, defaultDistance));
      result.addAll(utils.searchWordsInTrie(word));
    }

    return result;
  }
}

///任意位置的前缀匹配+默认的编辑距离匹配
///默认的最大编辑距离是字符串长度整除4,起码允许打错1个字符
class MultiPositionSearchStrategy extends SearchStrategy {
  @override
  Set<String> searchInStrategy(SearchUtils utils, List<String> words) {
    Set<String> result = Set();
    for (String word in words) {
      if (result.length == 0 || word != null && word.length > 0) {
        result.addAll(utils.enhancedTriesSearch(word));
        int defaultDistance = word.length ~/ 4;
        if (defaultDistance < 1) {
          defaultDistance = 1;
        }
        result.addAll(utils.searchSimilarWords(word, defaultDistance));
      }
    }
    return result;
  }
}

///用KMP算法匹配字典
class KmpSearchStrategy extends SearchStrategy {
  @override
  Set<String> searchInStrategy(SearchUtils utils, List<String> words) {
    Set<String> result = Set();
    if (words == null || words.length == 0) {
      return utils.getDictionary();
    }
    for (String word in words) {
      for (String s in utils.getDictionary()) {
        if (utils.kmpMatch(s.toLowerCase(), word.toLowerCase())) {
          result.add(s);
        }
      }
    }
    return result;
  }
}

///用暴力匹配的方式匹配字典
class NoAlgorithmSearchStrategy extends SearchStrategy {
  @override
  Set<String> searchInStrategy(SearchUtils utils, List<String> words) {
    Set<String> result = Set();
    if (words == null || words.length == 0) {
      return utils.getDictionary();
    }
    for (String word in words) {
      for (String s in utils.getDictionary()) {
        if (s.toLowerCase().contains(word.toLowerCase())) {
          result.add(s);
        }
      }
    }
    return result;
  }
}
