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

## Customized SmartSelect package.

About SmartSelect #
SmartSelect allows you to easily convert your usual form select or dropdown into dynamic page, popup dialog, or sliding bottom sheet with various choices input such as radio, checkbox, switch, chips, or even custom input. Supports single and multiple choice. Inspired by Smart Select component from Framework7.

## To Do

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

<pre><code class="dart">dependencies:
  flutter_filter_dialog: ^0.1.0
</code></pre>
<pre><code class="dart">import 'package:flutter_filter_dialog/flutter_filter_dialog.dart';
</code></pre>
## Usage

TODO: examples..
to `/example` folder.

```dart
const like = 'sample';
```

# Features

* Select single or multiple choice
* Open choices modal in full page, bottom sheet, or popup dialog
* Various choices input (radio, checkbox, switch, chips, or custom widget)
* Various choices layout (list, wrap, or grid)
* Grouping choices with easy support to sticky header
* Searchable choices with highlighted result
* Disabled or hidden choices
* Customizable trigger/tile widget
* Customizable modal style
* Customizable modal header style
* Customizable modal footer
* Customizable choices style
* Build choice items from any `List`
* Easy load async choice items
* and many more
