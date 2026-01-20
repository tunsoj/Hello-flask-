{ pkgs, ... }: {
  # To learn more about how to use Nix to configure your environment
  # see: https://developers.google.com/idx/guides/customize-idx-env
  
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages.
  # We are creating a Python environment with Flask.
  packages = [
    (pkgs.python3.withPackages (ps: [ ps.flask ]))
    , pkgs.gh
  ];

  # Sets environment variables in the workspace
  env = {};

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id".
    # We are adding the official Python extension.
    extensions = [
      "ms-python.python"
    ];

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created.
      # We removed the pip install command because Flask is now managed by Nix.
      onCreate = {};

      # Runs when the workspace is (re)started.
      onStart = {};
    };
  };
}
