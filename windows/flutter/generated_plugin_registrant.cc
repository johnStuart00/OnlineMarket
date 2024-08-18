//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_local_authentication/flutter_local_authentication_plugin_c_api.h>
#include <flutter_localization/flutter_localization_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterLocalAuthenticationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterLocalAuthenticationPluginCApi"));
  FlutterLocalizationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterLocalizationPluginCApi"));
}
