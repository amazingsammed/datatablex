//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <datatablex/datatablex_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) datatablex_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DatatablexPlugin");
  datatablex_plugin_register_with_registrar(datatablex_registrar);
}
