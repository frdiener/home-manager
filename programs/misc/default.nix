{ ... }: 
{
  imports =  [ (import ./bash.nix)    ]
          ++ [ (import ./git.nix)     ]
          ++ [ (import ./kitty.nix)   ]
          ++ [ (import ./starship.nix)];
}
