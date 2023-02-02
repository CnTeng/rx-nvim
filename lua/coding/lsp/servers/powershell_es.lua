return {
  settings = {
    powershell = {
      buttons = {
        showPanelMovementButtons = false,
        showRunButtons = true,
      },
      codeFolding = {
        enable = true,
        showLastLine = true,
      },
      codeFormatting = {
        addWhitespaceAroundPipe = true,
        alignPropertyValuePairs = true,
        autoCorrectAliases = false,
        ignoreOneLineBlock = true,
        newLineAfterCloseBrace = true,
        newLineAfterOpenBrace = true,
        openBraceOnSameLine = true,
        pipelineIndentationStyle = "NoIndentation",
        preset = "Custom",
        trimWhitespaceAroundPipe = false,
        useConstantStrings = false,
        useCorrectCasing = false,
        whitespaceAfterSeparator = true,
        whitespaceAroundOperator = true,
        whitespaceAroundPipe = true,
        whitespaceBeforeOpenBrace = true,
        whitespaceBeforeOpenParen = true,
        whitespaceBetweenParameters = false,
        whitespaceInsideBrace = true,
      },
      debugging = { createTemporaryIntegratedConsole = false },
      developer = {
        bundledModulesPath = {},
        editorServicesLogLevel = "Normal",
        editorServicesWaitForDebugger = false,
        waitForSessionFileTimeoutSeconds = 240,
      },
      enableProfileLoading = true,
      helpCompletion = "BlockComment",
      integratedConsole = {
        focusConsoleOnExecute = true,
        showOnStartup = true,
        suppressStartupBanner = false,
        useLegacyReadLine = false,
      },
      pester = {
        codeLens = true,
        debugOutputVerbosity = "Diagnostic",
        outputVerbosity = "FromPreference",
        useLegacyCodeLens = true,
      },
      powerShellExePath = "",
      promptToUpdatePackageManagement = false,
      promptToUpdatePowerShell = true,
      scriptAnalysis = {
        enable = true,
        settingsPath = "PSScriptAnalyzerSettings.psd1",
      },
      sideBar = {
        CommandExplorerVisibility = true,
      },
      startAsLoginShell = { linux = false, osx = true },
      startAutomatically = true,
      useX86Host = false,
    },
  },
}
