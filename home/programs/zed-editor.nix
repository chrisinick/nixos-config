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
      nerd-fonts.commit-mono
    ];
    extensions = [
      "html"
      "toml"
      "git-firefly"
      "basher"
      "nix"
      "typst"
      "markdownlint"
      "latex"
      "java"
    ];
    userKeymaps = [
      {
        bindings = {
          "shift-escape" = null;
          "ctrl-shift-escape" = "workspace::ToggleZoom";
        };
      }
      {
        context = "CommitEditor > Editor";
        bindings = {
          "shift-escape" = null;
          "ctrl-shift-escape" = "git::ExpandCommitEditor";
        };
      }
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
      inlay_hints.enabled = true;
      format_on_save = "on";
      tab_size = 2;
      preferred_line_length = 100;
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
        use_smartcase_find = true;
      };
      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      diagnostics.inline.enabled = true;
      minimap.show = "never";
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter.external.command = "nixfmt";
        };
      };
      lsp = {
        rust-analyzer = {
          binary.path = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          initialization_options.check.command = "clippy";
        };
        package-version-server.binary.path = "${pkgs.package-version-server}/bin/package-version-server";
        basedpyright.settings = {
          basedpyright.analysis.diagnosticMode = "workspace";
          exclusions = [ "**/.venv/**" ];
        };
        tinymist = {
          settings = {
            formatterMode = "typstyle";
            syntaxOnly = "onPowerSaving";
          };
          initialization_options.preview.background.enabled = true;
        };
        markdownlint.settings = {
          "MD013" = false;
        };
        texlab = {
          binary.path = "${pkgs.texlab}/bin/texlab";
          settings.texlab = {
            latexindent.modifyLineBreaks = true;
            build = {
              onSave = true;
              forwardSearchAfter = true;
              executable = "${pkgs.texliveMedium}/bin/latexmk";
              args = [
                "-pdf"
                "-interaction=nonstopmode"
                "-file-line-error"
                "-synctex=1"
                "%f"
              ];
            };
            forwardSearch = {
              executable = "${pkgs.zathura}/bin/zathura";
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
        jdtls.initialization_options.settings.java = {
          maven.enabled = true;
          jdt.ls.lombokSupport.enabled = true;
          exclusions = [
            "**/node_modules/**"
            "**/.metadata/**"
            "**/archetype-resources/**"
            "**/META-INF/maven/**"
            "/**/test/**"
          ];
        };
      };
    };
  };
}
