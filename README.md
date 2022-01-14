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

Customized SmartSelect package.

About SmartSelect #
SmartSelect allows you to easily convert your usual form select or dropdown into dynamic page, popup dialog, or sliding bottom sheet with various choices input such as radio, checkbox, switch, chips, or even custom input. Supports single and multiple choice. Inspired by Smart Select component from Framework7.

## Features

What's New in Version 4.x.x 
Customizable every part on modal widget (header, footer, searchbar, confirm button, searchbar toggle) using style configuration or widget builder
Validate before confirm
Auto search on type
Accent marks handler on search
Highlight search result
Chips tile widget
Grid choice layout
Horizotal or vertical choice list scroll direction
Simplify class name and enum
Configurations supports copyWith and merge
Use StatefulWidget as state management
Easy shortcut to define configuration
Soft depends to other package
To Do 
Right-To-Left parameter support, currently this can be achieved using widget builder
Internally handle async choice items loader
Custom search handler
Choice items pagination (pull to refresh and pull to load more)
Add more test
Migration from 4.0.0 to 4.2.0 
modalValidation function nows should return String to indicates the changes value is not valid and null or empty String to indicates the changes value is valid

To display tile with chips use param S2Tile.body and S2TileChips, instead of S2ChipsTile

Migration from 3.0.x to 4.0.0 
The parameter options is removed, instead use choiceItems

Simplify class name and enum

SmartSelectTile to S2Tile
SmartSelectOption to S2Choice
SmartSelectChoiceConfig to S2ChoiceConfig
SmartSelectChoiceStyle to S2ChoiceStyle
SmartSelectChoiceType to S2ChoiceType
SmartSelectModalConfig to S2ModalConfig
SmartSelectModalStyle to S2ModalStyle
SmartSelectModalHeaderStyle to S2ModalHeaderStyle
SmartSelectModalType to S2ModalType
The parameter builder now is a collection of builder (S2SingleBuilder or S2MultiBuilder), instead use tileBuilder to create trigger tile widget.

The parameters dense, enabled, isLoading, isTwoLine, leading, loadingText, padding, selected, trailing is removed from SmartSelect class, instead use builder.tile or tileBuilder and return S2Tile widget, it's has all these parameters.

The parameter onChange nows return S2SingleState state or S2MultiState state instead of T value or List<T> value

The parameter choiceConfig.useWrap is removed, instead use choiceConfig.layout = S2ChoiceLayout.wrap

The parameter choiceConfig.builder moved to builder.choice or choiceBuilder

The parameter choiceConfig.titleBuilder moved to builder.choiceTitle or choiceTitleBuilder

The parameter choiceConfig.subtitleBuilder moved to builder.choiceSubtitle or choiceSubtitleBuilder

The parameter choiceConfig.secondaryBuilder moved to builder.choiceSecondary or choiceSecondaryBuilder

The parameter choiceConfig.dividerBuilder moved to builder.choiceDivider or choiceDividerBuilder

The parameter choiceConfig.emptyBuilder moved to builder.choiceEmpty or choiceEmptybuilder

The parameter choiceConfig.glowingOverscrollIndicatorColor is removed, instead use choiceConfig.overscrollColor

The parameter choiceConfig.spacing and choiceConfig.runSpacing moved to choiceConfig.style.spacing and choiceConfig.style.runSpacing

The parameter choiceConfig.useCheckmark moved to choiceConfig.style.showCheckmark

The parameter choiceConfig.padding moved to choiceConfig.style.wrapperPadding


## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
