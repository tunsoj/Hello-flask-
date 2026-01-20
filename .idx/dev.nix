{ pkgs, ... }: {
  # To learn more about how to use Nix to configure your environment
  # see: https://developers.google.com/idx/guides/customize-idx-env
  
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages.
  # We are adding python3 and pip for our Flask application.
  packages = [
    pkgs.python3
    pkgs.pip
  ];

  # Sets environment variables in the workspace
  env = {};

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id".
    # We are adding the official Python extension.
    extensions = [
      "ms-python.python"
    ];

    # Enable previews for our web application.
    previews = {
      enable = true;
      previews = {
        web = {
          # This command runs the Flask development server.
          # It uses the $PORT environment variable provided by IDX to make the app available for preview.
          command = ["flask" "run" "--host" "0.0.0.0" "--port" "$PORT"];
          manager = "web";
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created.
      # This command installs the Python packages listed in requirements.txt.
      onCreate = {
        pip-install = "pip install -r requirements.txt";
      };

      # Runs when the workspace is (re)started.
      onStart = {};
    };
  };
}
