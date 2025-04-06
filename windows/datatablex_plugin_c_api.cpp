#include "include/datatablex/datatablex_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "datatablex_plugin.h"

void DatatablexPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  datatablex::DatatablexPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
