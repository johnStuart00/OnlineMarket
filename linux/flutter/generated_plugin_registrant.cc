//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_local_authentication/flutter_local_authentication_plugin.h>
#include <flutter_localization/flutter_localization_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_local_authentication_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterLocalAuthenticationPlugin");
  flutter_local_authentication_plugin_register_with_registrar(flutter_local_authentication_registrar);
  g_autoptr(FlPluginRegistrar) flutter_localization_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterLocalizationPlugin");
  flutter_localization_plugin_register_with_registrar(flutter_localization_registrar);
}
