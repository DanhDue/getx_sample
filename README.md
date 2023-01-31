# GetX_Sample
A Flutter project base on [GetX][1].

## Introduction
This project is a sample project building to adapt to a full software development life cycle including Tasks Estimation, Codebase Creation, Source Code Management using Git Flow,
Testing(unit tests, integration tests), Continuous Integration, Continuous Delivery, and
Continuous Deployment.
<br />
## Installation
### 1. Install the Flutter SDK.
You can follow the steps from the [Flutter official web page](17).
### 2. Active the Melos package.
You can install this package after the Flutter SDK installing with this command:<br />

```shell
dart pub global activate melos
```

Or you can view the [Melos package homepage](18) for more details.
### 3. Install necessary tools.
After performing 2 steps above, you can install other necessary tools by running Melos's command following below:

```shell
Melos installTools
```

<mark> **Note**: You need to pay attention to the installation process to grant root permission for some necessary settings.<br /><mark />

This Melos's script will install FVM for you too so you can skip the fourth step below.
However, you still need to active FVM for this project following the below command:

```shell
Melos fvmUse
```

### 4. Install the Flutter Version Manager(FVM).
Flutter version management is a big trouble that any Flutter developers have to face in their development process.
So, in this project, I have used the FVM([Flutter Version Management][2]) package to manage it easily, rapidly, and conveniently.

To install this app, you can see at FVM official [page][3].
Here, I only show you some steps to run this sample.

1. Flutter version 2.10.3 is used for this project:
```
fvm use 2.10.3
```

2. FVM setup for the Android Studio:
<p align='center'>
    <img src="screenshots/fvm_setup.gif" />
</p>

3. FVM setup for the VSCode:
   Create a settings.json file on ~/.vscode folder and paste content below:
```
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  // Remove .fvm files from search
  "search.exclude": {
    "**/.fvm": true
  },
  // Remove from file watching
  "files.watcherExclude": {
    "**/.fvm": true
  },
  "terminal.integrated.fontFamily": "MesloLGS NF",
}
```
<br />

## Libraries Used

* Third party
    * [GetX][1] fast, stable, extra-light and powerful Flutter framework.
    * [Get_CLI][14] is a CLI tool used to help build your App's features with GetX more easily.
    * [Melos][13] is a CLI tool used to help manage Dart projects with multiple modules/packages and more ….
    * [Flutter_Gen][15]: The Flutter code generator for your assets, fonts, colors, ….
    * [Theme Tailor][16]: The code generator and theming utility for supercharging Flutter ThemeExtension classes.

[0]: https://flutter.dev/
[1]: https://github.com/jonataslaw/getx#about-get
[2]: https://fvm.app/
[3]: https://fvm.app/docs/getting_started/installation
[4]: https://viblo.asia/p/new-setup-for-flutter-stacked-state-management-ByEZkejA5Q0
[5]: https://viblo.asia/p/flutter-statemanagement-with-stacked-deep-dive-tutorial-GrLZDBRg5k0
[6]: https://viblo.asia/p/bottom-navigation-with-stacked-architecture-XL6lABVp5ek
[7]: https://viblo.asia/p/handle-users-profile-in-flutter-XL6lABpJ5ek
[8]: https://viblo.asia/p/how-to-unit-test-in-flutter-Eb85ozv6l2G
[9]: https://viblo.asia/p/flutter-117-no-more-flavors-no-more-ios-schemas-command-argument-that-changes-everything-3P0lPB7gKox
[10]: https://viblo.asia/p/setup-development-environmentsdevelopstagingproduction-for-the-flutter-project-bJzKmd9659N
[11]: https://viblo.asia/p/how-to-parse-json-in-dartflutter-with-code-generation-using-freezed-3Q75wv02lWb
[12]: https://viblo.asia/p/the-network-module-for-the-flutter-using-dio-freezed-json-annotation-json-serializable-bJzKmADrK9N
[13]: https://melos.invertase.dev
[14]: https://pub.dev/packages/get_cli
[15]: https://pub.dev/packages/flutter_gen
[16]: https://pub.dev/packages/theme_tailor
[17]: https://docs.flutter.dev/get-started/install
[18]: https://pub.dev/packages/melos/install
<br />

## Screenshots
1. Coverage Overview.

![Coverage Overview](screenshots/unit_tests_01.png "Coverage Overview.")

2. Unit Test overview for a controller.

![Unit Test Detail for ViewModel](screenshots/unit_tests_02.png "Unit Test Detail for ViewModel.")

3. Unit Test Detail for a controller.

![Unit Test Detail for Repository](screenshots/unit_tests_03.png "Unit Test Detail for Repository.")

<br />

## References

* [New Setup for Flutter Stacked State Management.][4]
* [Flutter StateManagement with Stacked - Deep Dive tutorial.][5]
* [Bottom Navigation with Stacked Architecture.][6]
* [Handle Users profile in Flutter.][7]
* [How to Unit Test in Flutter.][8]
* [Flutter 1.17 — no more Flavors, no more iOS Schemas. Command argument that changes everything.][9]
* [Setup development environments(Develop/Staging/Production) for the Flutter Project.][10]
* [How to Parse JSON in Dart/Flutter with Code Generation using Freezed.][11]
* [The Network Module for the Flutter using Dio, Freezed, json_annotation, json_serializable.][12]

<br />

## License

Copyright 2022 DanhDue ExOICTIF, danhdue@gmail.com

Licensed to the Apache Software Foundation (ASF) under one or more contributor
license agreements.  See the NOTICE file distributed with this work for
additional information regarding copyright ownership.  The ASF licenses this
file to you under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License.  You may obtain a copy of
the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
License for the specific language governing permissions and limitations under
the License.
