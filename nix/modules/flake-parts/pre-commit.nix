{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
    inputs.fourmolu-nix.flakeModule
  ];
  perSystem =
    { config, ... }:
    {
      pre-commit.settings = {
        hooks = {
          nixfmt-rfc-style.enable = true;
          cabal-fmt.enable = true;
          fourmolu = {
            enable = true;
            package = config.fourmolu.wrapper;
          };
          hlint.enable = true;
        };
      };

      fourmolu.settings = {
        indentation = 4;
        comma-style = "leading";
        record-brace-space = true;
        indent-wheres = true;
        import-export-style = "diff-friendly";
        respectful = true;
        haddock-style = "multi-line";
        newlines-between-decls = 1;
        extensions = [ "ImportQualifiedPost" ];
      };
    };
}
