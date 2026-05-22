vim.keymap.set("n", "<leader>th", function()
  local client = vim.lsp.get_clients({ name = "harper_ls", bufnr = 0 })[1]
  if client then
    client:stop()
    vim.notify("Harper: off")
  else
    vim.lsp.start(vim.lsp.config["harper_ls"], { bufnr = 0 })
    vim.notify("Harper: on")
  end
end, { desc = "Toggle Harper diagnostics" })

vim.lsp.enable("harper_ls", false)

vim.lsp.config("harper_ls", {
  filetypes = {
    "c",
    "clojure",
    "cmake",
    "cpp",
    "cs",
    "dart",
    "gitcommit",
    "go",
    "haskell",
    "html",
    "java",
    "javascript",
    "lua",
    "markdown",
    "nix",
    "php",
    "python",
    "ruby",
    "rust",
    "sh",
    "swift",
    "text",
    "toml",
    "typescript",
    "typescriptreact",
  },
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      workspaceDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true,
      },
      codeActions = {
        ForceStable = false,
      },
      markdown = {
        IgnoreLinkTitle = false,
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000,
      ignoredLintsPath = "",
      excludePatterns = {},
    },
  },
})
