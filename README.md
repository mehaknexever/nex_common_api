<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Getting started

A Dart class for sending HTTP GET and POST requests, with optional token-based authentication and API key support.

## Features

- Send HTTP GET and POST requests with optional headers.
- Support for token-based authentication.
- Option to include an API key in requests.

## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  nex_common_api:
    git:
      url: https://github.com/mehaknexever/nex_common_api.git
      ref: master
```

Run flutter pub get to install the dependencies.

## Usage

### Importing the Class
First, import the necessary packages:

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'path_to_api_methods/api_methods.dart';
```

### Example
Sending a GET Request
To send a basic GET request:

```dart
void main() async {
  try {
    var response = await ApiMethods().getMethod(url: "https://api.example.com/data");
    print(response);
  } catch (e) {
    print("Error: $e");
  }
}
```

Sending a GET Request with Token
To send a GET request with an authentication token:

```dart
void main() async {
  try {
    var response = await ApiMethods().getMethodWithToken(
        url: "https://api.example.com/data",
        token: "your_token_here"
    );
    print(response);
  } catch (e) {
    print("Error: $e");
  }
}
```

Sending a POST Request
To send a basic POST request:

```dart
void main() async {
  try {
    var response = await ApiMethods().postMethod(
        url: "https://api.example.com/data",
        body: jsonEncode({"key": "value"})
    );
    print(response);
  } catch (e) {
    print("Error: $e");
  }
}
```

Sending a POST Request with Token
To send a POST request with an authentication token:

```dart
void main() async {
  try {
    var response = await ApiMethods().postMethodWithToken(
        url: "https://api.example.com/data",
        token: "your_token_here",
        body: jsonEncode({"key": "value"})
    );
    print(response);
  } catch (e) {
    print("Error: $e");
  }
}
```