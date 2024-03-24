import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> verifyContacts(List<String> contacts) async {
    var dio = Dio();
    try {
      Response response = await dio.post(
        'http://0.0.0.0:8090/v1.0/contacts/verify',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: contacts,
      );

      if (response.statusCode == 200) {
        // Handle the response data or success here
        print(response.data);
      } else {
        // Handle errors or non-200 responses here
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Exception caught: $e");
    }
  }

  Future<void> _getContacts() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // We're allowed to access contacts.
      final List<Contact> contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      for (Contact contact in contacts) {
        print('Contact: ${contact.displayName}');
      }
      setState(() {
        _contacts = contacts;
      });
    } else {
      // If permissions have been denied show standard "permissions required" message.
      // Implement a more sophisticated approach for production applications.
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permissions error'),
          content: const Text(
              'Please enable contacts access permission in system settings'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    }
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: _contacts.isNotEmpty
          ? ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                Contact contact = _contacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(
                    contact.phones!.isNotEmpty
                        ? contact.phones!.elementAt(0).value ?? ''
                        : '',
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
