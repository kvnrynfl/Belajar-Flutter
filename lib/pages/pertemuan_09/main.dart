import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Pertemuan09 extends StatefulWidget {
  const Pertemuan09({super.key});

  @override
  State<Pertemuan09> createState() => _Pertemuan09State();
}

class _Pertemuan09State extends State<Pertemuan09> {
  FileType _pickingType = FileType.any;
  String? _extension;
  Uint8List? _imageIntList;

  void _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowedExtensions: (_extension?.isNotEmpty ?? false) ? _extension!.replaceAll(' ', '').split(',') : null,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        setState(() {
          _imageIntList = file.bytes;
        });
      }
    } catch (e) {
      // print(e);
    }
  }

  String uint8ListToBase64(Uint8List? uint8list) {
    if (uint8list == null) return '';
    String base64String = base64Encode(uint8list);
    String header = "data:image/png;base64,";
    return header + base64String;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('File Picker Example App'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            DropdownButton<FileType>(
              hint: const Text('LOAD PATH FROM'),
              value: _pickingType,
              items: FileType.values
                  .map((fileType) => DropdownMenuItem<FileType>(
                        value: fileType,
                        child: Text(fileType.toString().split('.').last),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _pickingType = value!;
                  if (_pickingType != FileType.custom) {
                    _extension = '';
                  }
                });
              },
            ),
            if (_pickingType == FileType.custom)
              TextFormField(
                maxLength: 15,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: 'File extension',
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                onChanged: (String value) {
                  setState(() {
                    _extension = value;
                  });
                },
              ),
            ElevatedButton(
              onPressed: _pickFiles,
              child: const Text('Pick File'),
            ),
            const SizedBox(height: 10),
            _imageIntList != null
                ? Image.memory(_imageIntList!)
                : const Image(
                    image: AssetImage("assets/images/default/file_upload.png"),
                  ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const Pertemuan09());
}
