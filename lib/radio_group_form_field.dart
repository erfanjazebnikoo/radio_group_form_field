import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RadioGroupFormField extends FormField<int> {
  /// These [items] used to construct the [RadioGroupFormField].
  /// Each item contains the title of the [Radio]
  final List<String>? items;

  /// The padding of each radio widgets.
  final EdgeInsetsGeometry? padding;

  /// A flag to change the direction to use as the main axis.
  final bool? showVeritical;

  /// The [TextStyle] of the title of each [Radio].
  final TextStyle? titleStyle;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// [Radio] widget.
  final MouseCursor? mouseCursor;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Defines how compact the [Radio]'s layout will be.
  final VisualDensity? visualDensity;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The color to use when this [Radio] button is selected.
  final Color? activeColor;

  /// The color for the [Radio]'s [Material] when a pointer is hovering over it.
  final Color? hoverColor;

  /// The color for the [Radio]'s [Material] when it has the input focus.
  final Color? focusColor;

  RadioGroupFormField({
    Key? key,
    @required BuildContext? context,
    @required this.items,
    FormFieldSetter? onSaved,
    FormFieldValidator? validator,
    this.padding,
    this.showVeritical,
    this.titleStyle,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.activeColor,
    this.hoverColor,
    this.focusColor,
  }) : super(
          validator: validator,
          onSaved: onSaved,
          builder: (FormFieldState state) {
            Widget radio, title;

            return ListTile(
              title: Wrap(
                direction: showVeritical! ? Axis.vertical : Axis.horizontal,
                children: List<Widget>.generate(
                  items!.length,
                  (index) {
                    radio = Radio<int>(
                      value: index,
                      groupValue: state.value,
                      activeColor: activeColor,
                      focusColor: focusColor,
                      focusNode: focusNode,
                      hoverColor: hoverColor,
                      materialTapTargetSize: materialTapTargetSize,
                      mouseCursor: mouseCursor,
                      onChanged: (value) => state.didChange(value),
                      visualDensity: visualDensity,
                    );
                    title = Text(
                      items.elementAt(index),
                      style: titleStyle ?? TextStyle(color: Colors.black),
                    );

                    return Padding(
                      padding: padding ?? EdgeInsets.all(0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [radio, title],
                      ),
                    );
                  },
                ),
              ),
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        state.errorText.toString(),
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  : null,
            );
          },
        );
}
