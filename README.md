# oict

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Firstly install Flutter [https://docs.flutter.dev/get-started/install]

### Set API key
To set the API_KEY create a ".env" file in root directory and set the API_KEY variable in this format:
 - API_KEY=key

### Generate files and build
Then run the commands:
1. flutter doctor -v 
    - resolve android licences and all dependant SDKs and errors
2. flutter pub get
3. dart run build_runner build --delete-conflicting-outputs 
    - The parameter --delete-conflicting-outputs might not be needed, use in case of a consecutive generator run to resolve conflicts
4. flutter run -d {deviceId} or flutter build
