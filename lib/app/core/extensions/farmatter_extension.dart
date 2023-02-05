import 'package:intl/intl.dart';

extension FarmatterExtension on double {
  String get correncyPTBR {
    final correncyFormat = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: r'R$',
    );
    return correncyFormat.format(this);
  }
}
