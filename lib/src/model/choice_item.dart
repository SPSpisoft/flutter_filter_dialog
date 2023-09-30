import 'package:flutter/foundation.dart';
import '../utils/accent.dart';
import 'choice_theme.dart';

/// Validation callback
typedef String S2Validation<T>(T value);

/// Choice data configuration
@immutable
class S2Choice<T> with Diagnosticable {
  /// Value to return
  final T value;

  /// Represent as primary text
  final String? title;

  /// Represent as secondary text
  final String? subtitle;

  /// The choice will grouped by this property value
  final String? group;

  /// Whether the choice is disabled or enabled
  final bool disabled;

  /// Whether the choice is displayed or not
  final bool hidden;

  /// This prop is useful for choice builder
  final dynamic meta;

  /// Individual unselected choice item style
  final S2ChoiceStyle? style;

  final S2ChoiceStyle? styleLast;

  /// Individual selected choice item style
  final S2ChoiceStyle? activeStyle;

  final S2ChoiceStyle? activeStyleLast;

  /// Callback to select choice
  final ValueSetter<bool?>? select;

  /// Whether the choice is selected or not
  final bool selected;
  /// Whether the selection is synced/saved or not
  final bool selectedSaved;

  /// Default constructor
  S2Choice({
    required this.value,
    required this.title,
    this.subtitle,
    this.group,
    this.disabled = false,
    this.hidden = false,
    this.meta,
    this.style,
    this.styleLast,
    this.activeStyle,
    this.activeStyleLast,
    this.select,
    this.selected = false,
    this.selectedSaved = false,
  });

  /// Helper to create option list from any list
  static List<S2Choice<R>> listFrom<R, E>({
    required List<E> source,
    required _S2OptionProp<E, R> value,
    required _S2OptionProp<E, String> title,
    _S2OptionProp<E, String>? subtitle,
    _S2OptionProp<E, String>? group,
    _S2OptionProp<E, bool>? disabled,
    _S2OptionProp<E, bool>? hidden,
    _S2OptionProp<E, dynamic>? meta,
    _S2OptionProp<E, S2ChoiceStyle>? style,
    _S2OptionProp<E, S2ChoiceStyle>? styleLast,
    _S2OptionProp<E, S2ChoiceStyle>? activeStyle,
    _S2OptionProp<E, S2ChoiceStyle>? activeStyleLast,
  }) =>
      source
          .asMap()
          .map((index, item) => MapEntry(
              index,
              S2Choice<R>(
                value: value.call(index, item),
                title: title.call(index, item),
                subtitle: subtitle?.call(index, item),
                group: group?.call(index, item),
                disabled: disabled?.call(index, item) ?? false,
                hidden: hidden?.call(index, item) ?? false,
                meta: meta?.call(index, item),
                style: style?.call(index, item),
                styleLast: styleLast?.call(index, item),
                activeStyle: activeStyle?.call(index, item),
                activeStyleLast: activeStyleLast?.call(index, item),
              )))
          .values
          .toList();

  bool contains(String query) {
    return _testPropBy(title, query) ||
        _testPropBy(subtitle, query) ||
        _testPropBy(group, query);
  }

  bool _testPropBy(String? prop, String query) {
    return prop != null ? normalized(prop).contains(normalized(query)) : false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is S2Choice &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;


  S2ChoiceStyle? get effectiveStyle {
    if(selected) print("selected ");
    if(selectedSaved) print("selectedSaved");

    return selected ? selectedSaved ? activeStyleLast : activeStyle : selectedSaved ? styleLast : style;
  }

  /// Creates a copy of this [S2Choice] but with
  /// the given fields replaced with the new values.
  S2Choice<T> copyWith({
    T? value,
    String? title,
    String? subtitle,
    String? group,
    bool? disabled,
    bool? hidden,
    dynamic meta,
    S2ChoiceStyle? style,
    S2ChoiceStyle? styleLast,
    S2ChoiceStyle? activeStyle,
    S2ChoiceStyle? activeStyleLast,
    ValueSetter<bool?>? select,
    bool? selected,
  }) {
    return S2Choice<T>(
      value: value ?? this.value,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      group: group ?? this.group,
      disabled: disabled ?? this.disabled,
      hidden: hidden ?? this.hidden,
      meta: meta ?? this.meta,
      style: style ?? this.style,
      styleLast: styleLast ?? this.styleLast,
      activeStyle: activeStyle ?? this.activeStyle,
      activeStyleLast: activeStyleLast ?? this.activeStyleLast,
      select: select ?? this.select,
      selected: selected ?? this.selected,
    );
  }

  /// Creates a copy of this [S2Choice] but with
  /// the given fields replaced with the new values.
  S2Choice<T> merge(S2Choice<T>? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      value: other.value,
      title: other.title,
      subtitle: other.subtitle,
      group: other.group,
      disabled: other.disabled,
      hidden: other.hidden,
      meta: other.meta,
      style: other.style,
      styleLast: other.styleLast,
      activeStyle: other.activeStyle,
      activeStyleLast: other.activeStyleLast,
      select: other.select,
      selected: other.selected,
    );
  }
}

typedef R _S2OptionProp<E, R>(int index, E item);
