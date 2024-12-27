import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletFormFieldValidator {
  static String? numbers(String? value, context) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return AppLocalizations.of(context)!.field_required;
        ;
      }
      final number = int.tryParse(value);
      if (number == null || number < 1001) {
        return AppLocalizations.of(context)!.amount_must_be_at_least_1001_IQD;
      }
    } else {
      return AppLocalizations.of(context)!.field_required;
    }
    return null;
  }
}
