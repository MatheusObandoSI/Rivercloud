import 'dart:io';

//Common functions for any cloud storage service
abstract class CloudStorageFunctions{
  Future listFiles() async {}
  Future uploadFile(File file) async {}
  Future downloadFile(File file) async {}
  Future removeFile(File file) async {}
}