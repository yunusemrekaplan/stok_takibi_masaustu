import 'package:stok_takibi_masaustu/model/enum/currency.dart';

extension StringExtension on Currency {
  String get name {
    switch (this) {
      case Currency.TRY:
        return 'TRY';
      case Currency.USD:
        return 'USD';
      case Currency.EUR:
        return 'EUR';
      case Currency.GBP:
        return 'GBP';
      case Currency.JPY:
        return 'JPY';
      case Currency.RUB:
        return 'RUB';
      default:
        return '';
    }
  }

  String get symbol {
    switch (this) {
      case Currency.TRY:
        return '₺';
      case Currency.USD:
        return '\$';
      case Currency.EUR:
        return '€';
      case Currency.GBP:
        return '£';
      case Currency.JPY:
        return '¥';
      case Currency.RUB:
        return '₽';
      default:
        return '';
    }
  }

  String get flag {
    switch (this) {
      case Currency.TRY:
        return '🇹🇷';
      case Currency.USD:
        return '🇺🇸';
      case Currency.EUR:
        return '🇪🇺';
      case Currency.GBP:
        return '🇬🇧';
      case Currency.JPY:
        return '🇯🇵';
      case Currency.RUB:
        return '🇷🇺';
      default:
        return '';
    }
  }

  String get nameWithFlag => '$flag $name';
}

extension CurrenyExtension on String {
  Currency? get currency {
    switch (this) {
      case 'TRY':
        return Currency.TRY;
      case 'USD':
        return Currency.USD;
      case 'EUR':
        return Currency.EUR;
      case 'GBP':
        return Currency.GBP;
      case 'JPY':
        return Currency.JPY;
      case 'RUB':
        return Currency.RUB;
      default:
        return null;
    }
  }
}
