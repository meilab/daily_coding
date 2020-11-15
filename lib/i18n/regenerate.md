# Regenerating the i18n files

The files in this directory are based on my_localizations.dart
which defines all of the localizable strings used by the yimi
app. The yimi app uses
the [Dart `intl` package](https://github.com/dart-lang/intl).

Rebuilding everything requires two steps.

With the `yimi` as the current directory, generate
`intl_messages.arb` from `lib/i18n/my_localizations.dart`:

```bash
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/i18n lib/i18n/my_localizations.dart
```

The `intl_messages.arb` file is a JSON format map with one entry for
each `Intl.message()` function defined in `my_localizations.dart`. This
file was used to create the English and Chinese localizations,
`intl_en.arb` and `intl_zh.arb`. The `intl_messages.arb` wasn't
checked into the repository, since it only serves as a template for
the other `.arb` files.

With the `yimi` as the current directory, generate a
`intl_messages_<locale>.dart` for each `intl_<locale>.arb` file and
`intl_messages_all.dart`, which imports all of the messages files:

```bash
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i18n \
   --generated-file-prefix=intl_ --no-use-deferred-loading lib/*.dart lib/i18n/intl*.arb
```

The `MyLocalizations` class uses the generated `initializeMessages()`
function (`intl_messages_all.dart`) to load the localized messages
and `Intl.message()` to look them up.

do the translation by yourself in `intl_messages_en_US.dart` etc, such like

```dart
  static _notInlinedMessages(_) => <String, Function>{
        "title": MessageLookupByLibrary.simpleMessage("Xld"),
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile")
      };
```
