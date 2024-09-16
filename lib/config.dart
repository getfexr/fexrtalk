import 'dart:io';
import 'package:dotenv/dotenv.dart';

String dotEnvPath = '.env';

DotEnv loadEnv() {
  if (!File(dotEnvPath).existsSync()) {
    File(dotEnvPath).createSync();
  }
  return DotEnv(includePlatformEnvironment: true)..load([dotEnvPath]);
}

DotEnv _env = loadEnv();

abstract class Validator {
  final String errorMessage;
  String prefix = "";
  bool verify(String value);

  Validator(this.errorMessage);

  void throwExceptionIfInvalid(String value) {
    var error = returnErrorMessage(value);
    if (error != null) {
      throw Exception(error);
    }
  }

  String? returnErrorMessage(String value) {
    if (!verify(value)) {
      return errorMessage;
    }

    return null;
  }
}

class RequiredValidator extends Validator {
  RequiredValidator() : super("This field is required");

  @override
  bool verify(String value) {
    return value.isNotEmpty;
  }
}

class LengthValidator extends Validator {
  final int min;
  final int max;

  LengthValidator(this.min, this.max)
      : super("This field must be between $min and $max characters");

  @override
  bool verify(String value) {
    return value.length >= min && value.length <= max;
  }
}

String validateAndAcceptInput(
    String name, String value, List<Validator> validators,
    {bool fix = false}) {
  var errors = validators
      .map((validator) {
        return validator.returnErrorMessage(value);
      })
      .where((element) => element != null)
      .toList();

  if (errors.isNotEmpty) {
    print('==================================');
    print("Errors in env: $name = $value");

    for (var error in errors) {
      print(error);
    }

    print("\nPlease enter a valid value for $name:");
    var newValue = stdin.readLineSync();
    return validateAndAcceptInput(name, newValue!, validators, fix: true);
  } else {
    if (fix) {
      writeToEnv(name, value, isNewValue: _env[name] == null);
      _env = loadEnv();
    }

    return value;
  }
}

void writeToEnv(String name, String value, {bool isNewValue = false}) {
  var file = File(dotEnvPath);
  var content = file.readAsStringSync();

  String newContent;
  if (!isNewValue) {
    newContent =
        content.replaceAll(RegExp("$name=.*", multiLine: true), "$name=$value");
  } else {
    newContent = "$content\n$name=$value";
  }

  file.writeAsStringSync(newContent);
}

String acceptStdIn(String key) {
  print("Please enter a value for $key:");
  while (true) {
    var value = stdin.readLineSync();
    if (value != null && value.isNotEmpty) {
      return value;
    }
    print("Error: Please enter a value for $key:");
  }
}

bool getConfirmation(String message) {
  print("$message (y/n)");
  while (true) {
    var value = stdin.readLineSync();
    if (["y", "Y"].contains(value)) {
      return true;
    } else if (["n", "N"].contains(value)) {
      return false;
    }
    print("Error: Please enter y or n");
  }
}

class ConfigItem {
  final String envVar;
  late String value;
  final String defaultValue;
  final List<Validator> validators;
  final bool optional;

  ConfigItem(
      {required this.envVar,
      this.defaultValue = "",
      this.validators = const [],
      this.optional = false}) {
    if (optional && defaultValue.isNotEmpty) {
      throw Exception("Optional config items cannot have default values");
    }

    if (defaultValue.isNotEmpty) {
      // Validate default values - This is to ensure that the default values we hardcode are valid. (Ideally, test case should be added)
      for (var validator in validators) {
        validator.throwExceptionIfInvalid(defaultValue);
      }
    }

    if (_env.isDefined(envVar)) {
      value = _env[envVar]!;
    } else {
      if (optional) {
        bool answer = getConfirmation(
            "Env: $envVar is optional, Do you want to set a value?");
        if (answer) {
          var newValue = acceptStdIn(envVar);
          value =
              validateAndAcceptInput(envVar, newValue, validators, fix: true);
        } else {
          value = "";
        }
      } else {
        if (defaultValue.isNotEmpty) {
          var confirmDefault = getConfirmation(
              "Do you want to set the default value ($defaultValue) for $envVar?");

          if (confirmDefault) {
            value = defaultValue;
          } else {
            value = acceptStdIn(envVar);
          }
        } else {
          value = acceptStdIn(envVar);
        }

        value = validateAndAcceptInput(envVar, value, validators, fix: true);
      }
    }
  }

  String getString() => value;
  int getInt() => int.parse(value);
  Map<K, V> getMap<K, V>() {
    var map = <K, V>{};
    var pairs = value.split(",");
    for (var pair in pairs) {
      var keyValue = pair.split(":");
      dynamic value = keyValue[1];
      if (V == int) {
        value = int.parse(value);
      }
      map[keyValue[0] as K] = value as V;
    }
    return map;
  }
}

class Config {
  static final Config _config = Config._internal();
  factory Config() {
    return _config;
  }

  Config._internal();

  final int port = 6942;

  final String jwtAuthSecret = ConfigItem(
      envVar: 'JWT_AUTH_SECRET',
      validators: [RequiredValidator(), LengthValidator(32, 64)]).getString();

  bool debugLog = false; // set via --debug flag
  bool test = false; // set via --test flag

  // Rubix
  final rubixPeerIdPortMap = ConfigItem(
      envVar: 'RUBIX_PEER_ID_PORT_MAP',
      validators: [RequiredValidator()]).getMap<String, int>();

  final skyUrl = ConfigItem(envVar: 'SKY_URL',
  validators: [RequiredValidator()]).getString();
}
