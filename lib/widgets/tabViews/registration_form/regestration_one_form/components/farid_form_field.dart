import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FaridFormField extends StatefulWidget {
  final String text;
  FormFieldSetter<String> onSaved;
  final FieldValidator<String> validator;
  Function disabled = () => false;
  final bool isDate;

  final bool isRadioBtton;
  final List<Map<String, int>> radioList;
  final bool isDropdown;
  final List<String> dropdownNames;
  final bool isCollapsed;
  final String hint;

  //final bool isEmail;

  final Key key;
  int index = 0;
  int groupValue = 0;

//   TextEditingController controller;
// static GlobalKey<FormFieldState> dropKey= GlobalKey<FormFieldState>();

  dynamic textGot = '';
  String selectedItem;
  final InputDecoration decoration;
  final String description;
  final double fieldHieght;

  FaridFormField({
    //this.isEmail,
    this.text,
    this.validator,
    this.onSaved,
    this.isRadioBtton = false,
    this.radioList,
    this.isDropdown = false,
    this.dropdownNames = const ['farid'],
    this.isCollapsed = true,
    this.hint='',
    this.key,
    this.decoration,
    this.isDate = false,
    this.description = 'normal',
    this.fieldHieght=25,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FaridFormFieldState();
  }
}

class FaridFormFieldState extends State<FaridFormField> {

  @override
  Widget build(BuildContext context) {
    if (widget.isDropdown) {
      return MyDropDown(
        text: widget.text,
        isCollapsed: widget.isCollapsed,
        selectedItem: widget.selectedItem,
        dropdownNames: widget.dropdownNames,
        hint: widget.hint,
        onChanged: (value) {
          setState(() {
            widget.textGot = value;

            widget.selectedItem = value;
          });
        },
      );
    }
    if (widget.isRadioBtton) {
          return MyRadio(
            index: widget.index,
            groupValue: widget.groupValue,
            text: widget.text,
            radioList: widget.radioList,
            onChanged: (value) {
              widget.textGot = widget.groupValue;
              setState(() {
                widget.groupValue = value;
                widget.textGot = value;

              });
            },
          );

    }
    if (widget.isDate)
      return DateFormField(
        text: widget.text,fieldHeight: widget.fieldHieght,
        onChanged: (date) {
          setState(() {
            widget.textGot = '${date.day}/${date.month}/${date.year}';
            print(widget.textGot);

          });
        },
      );
    if(widget.fieldHieght!=25)
      return BigTextBox(
        onSaved: widget.onSaved,
        text: widget.text,
        fieldHeight: widget.fieldHieght,
        decoration: widget.decoration,
        description: widget.description,
        isCollapsed: widget.isCollapsed,
        onChanged: (value) {
          widget.textGot = value;
        },

      );
    return TextBox(
      onSaved: widget.onSaved,
      text: widget.text,
      fieldHeight: widget.fieldHieght,
      decoration: widget.decoration,
      description: widget.description,
      isCollapsed: widget.isCollapsed,
      onChanged: (value) {
        widget.textGot = value;
      },
    );
  }
}

class PhoneValidator extends TextFieldValidator {
  PhoneValidator(String errorText) : super(errorText);

  @override
  bool isValid(String value) {
    //r'[(^\D)(\w)](^((0)(\d{9}))$)|(^((\+)(\d{11,12}))$)'
    // return true if the value is valid according the your condition
    String phoneNumber = r'(^((0)(\d{9}))$)|(^((\+)(\d{11,12}))$)';

    return hasMatch('${phoneNumber}', value);
  }
}
class FaridValidator{
  final String description;

  FaridValidator(this.description);

 String validate (value) {
    switch (description) {
      case 'email':
        return MultiValidator(<FieldValidator>[
          EmailValidator(errorText: 'Enter a valid email'),
          RequiredValidator(errorText: 'This field is required')
        ]).call(value);
        break;
      case 'Phone number':
        return MultiValidator([
          PhoneValidator('Enter a valid Phone number'),
          RequiredValidator(errorText: 'This field is required'),
        ]).call(value);
        break;
      case 'required':
        return RequiredValidator(errorText: 'This field is required')
            .call(value);
        break;

      default:
        return null;
    }
}
}
class DateFormField extends StatefulWidget {
  final String text;
  final double fieldHeight;
  DateChangedCallback onChanged;


   DateFormField({Key key, this.text, this.fieldHeight, this.onChanged}) : super(key: key);

  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.text != null)
            Flexible(flex: 3, child: Text("${widget.text }")),

          Flexible(
            flex: 7,
            child: Container(
              height: widget.fieldHeight,
              child: TextFormField(
                expands: true,
                minLines: null,
                maxLines: null,
                //focusNode: FocusNode(canRequestFocus: false),
                readOnly: true,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isCollapsed: true,

                  helperStyle: TextStyle(color: Colors.black, inherit: false),
                ),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1930, 1, 1),
                      maxTime: DateTime(2050, 1, 1),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.green,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                          TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: widget.onChanged,
//
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BigTextBox extends StatelessWidget{
  final String text;
  final ValueChanged<String> onChanged;
  final double fieldHeight;
  final String description;
  final bool isCollapsed;
  final InputDecoration decoration;
  final FormFieldSetter<String> onSaved;

  BigTextBox({this.text, this.onChanged, this.fieldHeight, this.description,
      this.isCollapsed, this.decoration, this.onSaved});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (text != null)
            Flexible(
              flex: 3,
              child: Text('${text} '),
            ),
          Flexible(
            flex: 7,
            child: Container(
              height: fieldHeight,
              child: TextFormField(
                expands: true,
                maxLines: null,
                minLines: null,

                // keyboardType: TextInputType.multiline,


                onChanged: onChanged,
                validator:FaridValidator(description).validate,


                decoration: decoration ??
                    InputDecoration(
                      border: OutlineInputBorder(gapPadding: 6),
                      isDense: false,
                      isCollapsed: isCollapsed,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
class TextBox extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final double fieldHeight;
  final String description;
  final bool isCollapsed;
  final InputDecoration decoration;
  final FormFieldSetter<String> onSaved;

  TextBox({this.text, this.onChanged, this.fieldHeight, this.description,
      this.isCollapsed, this.decoration, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (text != null)
            Flexible(
              flex: 3,
              child: Text('${text} '),
            ),
          Flexible(
            flex: 7,
            child: Container(
//
              child: TextFormField(
                onSaved: onSaved,

                onChanged: onChanged,
                validator:FaridValidator(description).validate,

                decoration: decoration ??
                    InputDecoration(
                      border: OutlineInputBorder(gapPadding: 6),
                      isDense: false,
                      isCollapsed: isCollapsed,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
class MyDropDown extends StatelessWidget{
 final List<String> dropdownNames;
 final String text;
 final bool isCollapsed;
 final String selectedItem;
 final String hint;
 final ValueChanged onChanged;

 MyDropDown({this.dropdownNames, this.text, this.isCollapsed, this.selectedItem,
      this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropItems = [
      ...dropdownNames.map((name) => DropdownMenuItem<String>(
        value: name,
        child: Text(name),
      )),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (context) {
          if (text == null) {
            return Flexible(flex: 1, child: Text(''));
          }
          return Flexible(flex: 3, child: Text('${text} : '));
        }),
        Builder(builder: (context) {
          if (text == null) {
            return Flexible(
              flex: 7,
              child: DropdownButtonFormField<String>(

//                  },
                  isDense: isCollapsed,
                  value: selectedItem,
                  onChanged: onChanged,
                  items: dropItems ??
                      [
                        DropdownMenuItem(
                          child: Text('hello'),
                        )
                      ]),
            );
          }
          return Flexible(
            flex: 7,
            child: DropdownButton(
                hint: Text(hint),
                value: selectedItem,
                onChanged: onChanged,
                items: dropItems ??
                    [
                      DropdownMenuItem(
                        child: Text('hello'),
                      )
                    ]),
          );
        }),
      ],
    );
  }

}
class MyRadio extends StatelessWidget{
  final int groupValue;
  final String text;
  final List<Map<String, int>> radioList;
  final ValueChanged onChanged;
  int index;

  MyRadio({this.groupValue, this.index,this.text,this.onChanged, this.radioList});

  Widget radioTileBulder(String textGot, int value) {

    final RadioListTile tile = RadioListTile(
      title: SizedBox(
        width: 200,
          child: Text(textGot)),
      onChanged: onChanged,
      value: value,
      groupValue: groupValue,
    );
    index++;

    return tile;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (text != null) Text('${text} : '),
        ...radioList.map((map) => SizedBox(
          width: 150,
            child: radioTileBulder(map.keys.first, map[map.keys.first]))),
      ],
    );
//    return Row(
//      children: <Widget>[
//        if (text != null) Text('${text} : '),
//        ...radioList.map((map) => Flexible(
//            flex: radioList.length,
//            child: SizedBox(
//              height: 100,
//              width: 500,
//                child: radioTileBulder(map.keys.first, map[map.keys.first])))),
//      ],
//    );
//
  }
}
