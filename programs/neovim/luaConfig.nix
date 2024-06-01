{ lib, ... }:
let
  pluginConfigDir = ./config;

  fileNames = lib.attrNames (builtins.readDir pluginConfigDir);

  pluginConfigs = map (fileName:
    builtins.readFile  (toString (pluginConfigDir + "/${fileName}"))
  ) fileNames;

  aggregatedConfig = builtins.concatStringsSep "\n" pluginConfigs;
in
  aggregatedConfig
