return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = opts.server or {}
      opts.server.settings = opts.server.settings or {}
      opts.server.settings["rust-analyzer"] = opts.server.settings["rust-analyzer"] or {}
      opts.server.settings["rust-analyzer"].cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
        loadOutDirsFromCheck = true,
      }
      opts.server.settings["rust-analyzer"].check = {
        command = "clippy",
        extraArgs = { "--no-deps" },
      }
      opts.server.settings["rust-analyzer"].checkOnSave = true
      opts.server.settings["rust-analyzer"].procMacro = {
        enable = true,
      }
      opts.server.settings["rust-analyzer"].diagnostics = {
        enable = true,
        -- NOTE: Disabled because of async-trait
        disabled = { "unresolved-proc-macro", "proc-macro-disabled", "E0308" },
        enableExperimental = true,
      }
      opts.server.settings["rust-analyzer"].files = {
        excludeDirs = { ".direnv", ".git", ".github", ".gitlab", "bin", "node_modules", "target", "venv", ".venv" },
        watcher = "server",
      }
    end,
  },
}

--        cargo = {
--          allFeatures = true,
--          buildScripts = {
--            enable = true
--          },
--          loadOutDirsFromCheck = true
--        },
--        check = {
--          command = "clippy",
--          extraArgs = { "--no-deps" }
--        },
--        checkOnSave = true,
--        diagnostics = {
--          enable = true
--        },
--        files = {
--          excludeDirs = { ".direnv", ".git", ".github", ".gitlab", "bin", "node_modules", "target", "venv", ".venv" },
--          watcher = "server"
--        },
--        procMacro = {
--          enable = true,
--          ignored = {
--            ["async-recursion"] = { "async_recursion" },
--            ["async-trait"] = { "async_trait" },
--            ["napi-derive"] = { "napi" }
--          }
--        }
--      }
