import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RadioGroupFormField extends FormField<int> {
  final List<String>? items;

  final EdgeInsetsGeometry? padding;
  final bool? showVeritical;
  final TextStyle? titleStyle;
  final ShapeBorder? shape;
  final MouseCursor? mouseCursor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final Color? activeColor;
  final Color? hoverColor;
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
    this.shape,
    this.mouseCursor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autoFocus = false,
    this.tileColor,
    this.selectedTileColor,
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

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [radio, title],
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
