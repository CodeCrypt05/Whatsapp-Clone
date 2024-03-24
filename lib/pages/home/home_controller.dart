import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreenController extends GetxController {
  var selectedIndex = 0.obs;
  List<String> contactsList = [];
  RxList verifiedContactList = [].obs;
  List<Contact> contactDetailsList = []; // Unverified contact list
  List<Contact> verifiedContactDetailsList = []; //

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await _getPermission();
    await _getContacts();
    await verifyContacts(contactsList);
    removeVerifiedContactsFromContactsList();
  }

  // -- check

  void removeVerifiedContactsFromContactsList() {
    List<Contact> contactsToRemove = [];

    print("length of contacts: ${contactsList.length}");

    // Iterate through each contact.
    for (int i = 0; i < contactDetailsList.length; i++) {
      Contact contact = contactDetailsList[i];

      // Check if the contact has any phone numbers.
      if (contact.phones != null && contact.phones!.isNotEmpty) {
        // Iterate over each phone number in the contact's phones list.
        for (Item phone in contact.phones!) {
          // If a phone number is found in verifiedContactList, add this contact to contactsToRemove.
          if (verifiedContactList.contains(phone.value)) {
            contactsToRemove.add(contact);
            break; // No need to check more numbers for this contact.
          }
        }
      }
    }

    // Now, remove the identified contacts from contactDetailsList and add them to verifiedContactDetailsList.
    contactDetailsList
        .removeWhere((contact) => contactsToRemove.contains(contact));
    verifiedContactDetailsList.addAll(contactsToRemove);

    print("numbers on whatsapp: ${verifiedContactDetailsList.length}");
    print("numbers are not on whatsapp: ${contactDetailsList.length}");
  }

  // Calling Verify numbers API

  Future<void> verifyContacts(List<String> contacts) async {
    var dioClient = dio.Dio();
    try {
      dio.Response response = await dioClient.post(
        'https://739c-103-106-139-123.ngrok-free.app/v1.0/contacts/verify',
        options: dio.Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: contacts,
      );

      if (response.statusCode == 200) {
        // Handle the response data or success here
        print(response.data);
        return verifiedContactList.addAll(response.data);
      } else {
        // Handle errors or non-200 responses here
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print("Exception caught: $e");
    }
  }

  // -- Get Permissons --------------------------------
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

  // -- Get Contact --------------------------------

  Future<void> _getContacts() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // We're allowed to access contacts.
      final List<Contact> contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();

      contactDetailsList = contacts;

      for (Contact contact in contacts) {
        // Check if the contact has any phone numbers.
        if (contact.phones != null && contact.phones!.isNotEmpty) {
          // Iterate over each phone number in the contact's phones list.
          for (Item phone in contact.phones!) {
            // Add the phone number's value to the phoneNumbers list.
            contactsList.add(phone
                .value!); // Assuming 'value' holds the phone number string.
          }
        }
      }
    } else {
      // If permissions have been denied show standard "permissions required" message.
      // Implement a more sophisticated approach for production applications.
      // ignore: use_build_context_synchronously
      Get.dialog(
        AlertDialog(
          title: const Text('Permissions error'),
          content: const Text(
              'Please enable contacts access permission in system settings'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Get
                  .back(), // Use Get.back() to close dialogs or navigate back
            )
          ],
        ),
      );
    }
  }
}
