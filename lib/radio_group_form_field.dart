import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RadioGroupFormField extends FormField<int> {
  final List<String>? options;

  final EdgeInsetsGeometry? padding;
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
    @required this.options,
    FormFieldSetter? onSaved,
    FormFieldValidator? validator,
    this.padding,
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
              title: ListView.builder(
                padding: padding,
                shrinkWrap: true,
                itemCount: options!.length,
                itemBuilder: (context, index) {
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
                    options.elementAt(index),
                    style: titleStyle ?? TextStyle(color: Colors.black),
                  );

                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    trailing: radio,
                    title: title,
                    onTap: () {
                      if (state.value != index) {
                        state.didChange(index);
                      } else {
                        state.didChange(null);
                      }
                    },
                  );
                },
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
