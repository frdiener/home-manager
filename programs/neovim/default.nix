
{ ... }: 
{
  imports =  [ (import ./neovim.nix)   ]
          ++ [ (import ./plugins.nix)  ] 
          ++ [ (import ./settings.nix) ];
}
