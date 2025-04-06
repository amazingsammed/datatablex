#ifndef FLUTTER_PLUGIN_DATATABLEX_PLUGIN_H_
#define FLUTTER_PLUGIN_DATATABLEX_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace datatablex {

class DatatablexPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DatatablexPlugin();

  virtual ~DatatablexPlugin();

  // Disallow copy and assign.
  DatatablexPlugin(const DatatablexPlugin&) = delete;
  DatatablexPlugin& operator=(const DatatablexPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace datatablex

#endif  // FLUTTER_PLUGIN_DATATABLEX_PLUGIN_H_
