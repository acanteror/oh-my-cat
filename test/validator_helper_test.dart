import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_cat/features/login/domain/helper/validator_helper.dart';

void main() {
  test(
    'valid pattern',
    () {
      const input = '{[]{}}[(())]{}';

      final _result = evaluateParenthesis(input);

      expect(_result, true);
    },
  );

  test(
    'wrong patter',
    () {
      const input = '{}[()]{)';

      final _result = evaluateParenthesis(input);

      expect(_result, false);
    },
  );

  test(
    'valid pattern with non-parenthesis character',
    () {
      const input = '{[]{}}[((a))]';

      final _result = evaluateParenthesis(input);

      expect(_result, false);
    },
  );
}
