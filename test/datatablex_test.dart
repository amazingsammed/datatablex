// import 'package:flutter_test/flutter_test.dart';
// import 'package:datatablex/datatablex.dart';
// import 'package:datatablex/datatablex_platform_interface.dart';
// import 'package:datatablex/datatablex_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockDatatablexPlatform
//     with MockPlatformInterfaceMixin
//     implements DatatablexPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final DatatablexPlatform initialPlatform = DatatablexPlatform.instance;
//
//   test('$MethodChannelDatatablex is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelDatatablex>());
//   });
//
//   test('getPlatformVersion', () async {
//     Datatablex datatablexPlugin = Datatablex();
//     MockDatatablexPlatform fakePlatform = MockDatatablexPlatform();
//     DatatablexPlatform.instance = fakePlatform;
//
//     expect(await datatablexPlugin.getPlatformVersion(), '42');
//   });
// }
