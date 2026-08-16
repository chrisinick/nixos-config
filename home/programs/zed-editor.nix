{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nil
      nixfmt
      package-version-server
    ];
    extensions = [
      "html"
      "toml"
      "git-firefly"
      "basher"
      "nix"
      "typst"
    ];
    userSettings = {
      cli_default_open_behavior = "existing_window";
      colorize_brackets = true;
      project_panel.dock = "left";
      outline_panel.dock = "left";
      collaboration_panel.dock = "left";
      git_panel.dock = "left";
      agent = {
        sidebar_side = "right";
        default_profile = "write";
        dock = "right";
      };
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      journal.hour_format = "hour24";
      calls.mute_on_join = true;
      terminal.shell.program = "${pkgs.fish}/bin/fish";
      buffer_font_family = "CommitMono Nerd Font";
      buffer_font_size = 18;
      ui_font_size = 20;
      inlay_hints = {
        enabled = true;
      };
      format_on_save = "on";
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
        use_multiline_find = true;
        use_smartcase_find = true;
      };
      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      assistant = {
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };
        version = "2";
      };
      #jupyter = {
      #kernel_selections = {
      #python = ""
      #}
      #};
      lsp = {
        rust-analyzer = {
          binary = {
            path = "/run/current-system/sw/bin/rust-analyzer";
          };
          initialization_options = {
            check = {
              command = "clippy";
            };
          };
        };
        package-version-server = {
          binary = {
            path = "/run/current-system/sw/bin/package-version-server";
          };
        };
        pyright = {
          binary = {
            path = "/run/current-system/sw/bin/pyright";
          };
          settings = {
            python.analysis = {
              diagnosticMode = "workspace";
              #typeCheckingMode = "strict";
            };
            #python = {
            #pythonPath = ".venv/bin/python";
            #};
          };
        };
        texlab = {
          binary = {
            path = "/run/current-system/sw/bin/texlab";
          };
          settings = {
            texlab = {
              latexindent = {
                modifyLineBreaks = true;
              };
              build = {
                onSave = true;
                forwardSearchAfter = true;
                executable = "/run/current-system/sw/bin/latexmk";
                args = [
                  "-pdf"
                  "-interaction=nonstopmode"
                  "-file-line-error"
                  "-synctex=1"
                  "%f"
                ];
              };
              forwardSearch = {
                executable = "/run/current-system/sw/bin/zathura";
                args = [
                  "--synctex-forward"
                  "%l:1:%f"
                  "-x"
                  "zed %%{input}:%%{line}"
                  "%p"
                ];
              };
            };
          };
        };
      };
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };
}
