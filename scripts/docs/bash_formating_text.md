In order to apply a style on your string, you can use a command like:

```dart
echo -e '\033[1mYOUR_STRING\033[0m'
```

# **Explanation**:

* `echo -e` - The `-e` option means that escaped (backslashed) strings will be interpreted
* `\033` - escaped sequence represents `beginning/ending` of the style
* lowercase `m` - indicates the end of the sequence
* `1` - Bold attribute (see below for more)
* `[0m` - resets all attributes, colors, formatting, etc.

The possible integers are:
```dart
    0 - Normal Style
    1 - Bold
    2 - Dim
    3 - Italic
    4 - Underlined
    5 - Blinking
    7 - Reverse
    8 - Invisible
```
