class Validation {
  String? validateFirstName(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Lütfen adınızı giriniz!';
    } else if (!value
        .contains(RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"))) {
      return 'Lütfen isminizi girerken doğru karakterler kullaniniz!';
    }
    return null;
  }

  String? validateLastName(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Lütfen soyadınızı giriniz!';
    } else if (!value
        .contains(RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"))) {
      return 'Lütfen soyadınızı girerken doğru karakterler kullaniniz!';
    }
    return null;
  }

  String? validateEmail(String value) {
    value = value.trim();

    if (value.isEmpty) {
      return 'Lütfen e-mail adresinizi giriniz!';
    } else if (!value.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      return 'Lütfen email adresinizi kontrol ediniz!';
    }

    return null;
  }

  String? validatePassword(String value) {
    value = value.trim();

    if (value.isEmpty) {
      return 'Lütfen şifrenizi giriniz!';
    } else if (value.length <= 6) {
      return 'Şifreniz en az 6 karakterden oluşmalıdır! ';
    }

    return null;
  }

  String? validatePhone(String value) {
    value = value.trim();

    if (value.isEmpty) {
      return 'Lütfen telefon numaranızı giriniz!';
    } else if (!value.contains(RegExp(r"(^(?:[+0]9)?[0-9]{10,12hakan}$)"))) {
      return 'Lütfen telefon numaranızı kontrol ediniz!';
    }

    return null;
  }
}
