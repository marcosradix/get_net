# get_net

Package to do payments using api getnet

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view the getnet 
[online documentation](https://developers.getnet.com.br/login), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# Usage 
You will neede create 3 dart/class files
# First
Create a constant.dart file to put params that getnet will need
All below params you will find here: https://developers.getnet.com.br/login(create a free account)

const String myUrlGetnetApi = "url getnet api";
const String mySellerId = "your seller id";
const myClientId = "your client id";
const myClientSecret = "your client secret";
const myAuthorizationBasic = "Concat the client_id, followed by ":" (two dots) plus client_secret, converted to base64"

# Second
Lets create a custom Dio that will use a interceptor
```
class CustomDioGetnet {
  Dio dio = Dio();
  CustomDioGetnet() {
    dio.options = BaseOptions(
        connectTimeout: 300000,
        receiveTimeout: 300000,
        baseUrl: myUrlGetnetApi);
    dio.interceptors.add(GetnetInterceptor());
  }
}
```
# Last create a interceptor
This interceptor will put the token saved in login in your request.
```
 options.headers["Authorization"] = "Bearer $accessToken";
```
# How to use it
In this video I will show you hoe to use this lib(language brazilian portuguese)
link: https://youtu.be/l3vLa9l7Wsc
