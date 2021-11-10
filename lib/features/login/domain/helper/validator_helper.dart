bool evaluateParenthesis(String input) {
  final stack = <String>[];
  for (var i = 0; i < input.length; i++) {
    final c = input[i];
    if (!isParenthesis(c)) {
      return false;
    }
    if (c == '[' || c == '(' || c == '{') {
      stack.add(c);
      continue;
    }
    if (stack.isEmpty) return false;
    if (c == ')' && stack.last != '(') {
      return false;
    } else if (c == ')' && stack.last == '(') {
      stack.removeLast();
    }
    if (c == ']' && stack.last != '[') {
      return false;
    } else if (c == ']' && stack.last == '[') {
      stack.removeLast();
    }
    if (c == '}' && stack.last != '{') {
      return false;
    } else if (c == '}' && stack.last == '{') {
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

const List<String> parenthesisCollection = ['(', ')', '[', ']', '{', '}'];
bool isParenthesis(String input) {
  return parenthesisCollection.contains(input);
}
