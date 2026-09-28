return {
  {
    "saghen/blink.cmp",
    version = "*",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ['<CR>'] = { 'select_and_accept', 'fallback' }
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        keyword = { range = "full" },
        list = {
          selection = {
            preselect = true,
            auto_insert = true
          }
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon",  "kind",             gap = 1 },
              { "label",      "label_description" },
              { "source_name" }
            },
          }
        },
        ghost_text = { enabled = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          window = { border = "rounded" }
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
          show_documentation = false
        }
      },
      fuzzy = {
        implementation = "rust",
        sorts = {
          'exact', 'score', 'sort_text'
        }
      }
    },
  },
}
