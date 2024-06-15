{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      checks.rx-nvim = pkgs.nixosTest {
        name = "rx-nvim";
        nodes.machine = {
          imports = [ self.nixosModules.default ];
          programs.rx-nvim.enable = true;
        };

        testScript = ''
          machine.wait_for_unit("default.target")
          machine.succeed("which nvim")
        '';
      };
    };
}
