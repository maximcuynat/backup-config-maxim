{
    // --------------------------------------------------
    // PROFILE & UI
    // --------------------------------------------------
    "window.newWindowProfile": "Default",
    "workbench.startupEditor": "none",
    "workbench.iconTheme": "symbols",
    "workbench.colorTheme": "Deepdark Material Theme | Full Black Version",
    "workbench.activityBar.location": "top",
    "window.titleBarStyle": "custom",
    "window.commandCenter": false,
    "workbench.editor.empty.hint": "hidden",
    "breadcrumbs.enabled": true,
    "editor.stickyScroll.enabled": true,

    // --------------------------------------------------
    // EDITOR CORE
    // --------------------------------------------------
    "editor.fontFamily": "JetBrains Mono, Fira Code, monospace",
    "editor.fontLigatures": "'calt', 'liga', 'ss01', 'ss02'",
    "editor.fontVariations": true,
    "editor.fontWeight": "400",
    "editor.fontSize": 14,
    "editor.lineHeight": 22,
    "editor.cursorStyle": "line-thin",
    "editor.cursorBlinking": "expand",
    "editor.cursorSmoothCaretAnimation": "on",
    "editor.smoothScrolling": true,
    "editor.minimap.enabled": false,
    "editor.wordWrap": "on",
    "editor.renderWhitespace": "boundary",
    "editor.formatOnSave": true,
    "editor.tabSize": 4,
    "editor.detectIndentation": false,
    "editor.guides.bracketPairs": true,
    "editor.bracketPairColorization.enabled": true,
    "editor.renderLineHighlight": "gutter",
    "editor.guides.highlightActiveIndentation": true,

    // --------------------------------------------------
    // COULEURS & THÈME CUSTOM
    // --------------------------------------------------
    "workbench.colorCustomizations": {
        "[Deepdark Material Theme | Full Black Version]": {
            "activityBar.background": "#000000",
            "sideBar.background": "#0a0a0a",
            "editor.background": "#000000",
            "editorLineNumber.foreground": "#333333",
            "editorLineNumber.activeForeground": "#e06c75",
            "editorCursor.foreground": "#e06c75",
            "editor.lineHighlightBackground": "#111111",
            "editorBracketHighlight.foreground1": "#e06c75",
            "editorBracketHighlight.foreground2": "#61afef",
            "editorBracketHighlight.foreground3": "#98c379",
            "statusBar.background": "#0a0a0a",
            "statusBar.foreground": "#555555",
            "statusBar.debuggingBackground": "#e06c75",
            "titleBar.activeBackground": "#000000",
            "titleBar.inactiveBackground": "#000000",
            "tab.activeBackground": "#111111",
            "tab.inactiveBackground": "#000000",
            "tab.activeBorderTop": "#e06c75"
        }
    },
    "editor.tokenColorCustomizations": {
        "[Deepdark Material Theme | Full Black Version]": {
            "textMateRules": [
                {
                    "scope": "comment",
                    "settings": { "fontStyle": "italic" }
                },
                {
                    "scope": "keyword",
                    "settings": { "fontStyle": "bold" }
                },
                {
                    "scope": "keyword.control",
                    "settings": { "fontStyle": "bold italic" }
                },
                {
                    "scope": "storage.type",
                    "settings": { "fontStyle": "bold" }
                }
            ]
        }
    },

    // --------------------------------------------------
    // ZEN MODE
    // --------------------------------------------------
    "zenMode.hideLineNumbers": false,
    "zenMode.centerLayout": true,
    "zenMode.fullScreen": false,
    "zenMode.showTabs": "none",
    "zenMode.hideStatusBar": true,

    // --------------------------------------------------
    // INDENT RAINBOW (extension: oderwat.indent-rainbow)
    // --------------------------------------------------
    "indentRainbow.colors": [
        "rgba(255, 90, 90, 0.07)",
        "rgba(255, 180, 50, 0.07)",
        "rgba(100, 220, 100, 0.07)",
        "rgba(80, 180, 255, 0.07)"
    ],
    "indentRainbow.errorColor": "rgba(255, 50, 50, 0.3)",

    // --------------------------------------------------
    // PERFORMANCE (GROS PROJET SYMFONY)
    // --------------------------------------------------
    "files.watcherExclude": {
        "**/.git/**": true,
        "**/vendor/**": true,
        "**/node_modules/**": true,
        "**/var/**": true
    },
    "search.exclude": {
        "**/vendor": true,
        "**/node_modules": true,
        "**/var": true
    },
    "files.exclude": {
        "**/.git": true,
        "**/.DS_Store": true,
        "**/node_modules": true,
        "**/vendor/bin": true,
        "**/var/cache": true,
        "**/var/log": true
    },

    // --------------------------------------------------
    // AUTOSAVE & FILE HYGIENE
    // --------------------------------------------------
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 800,
    "files.trimTrailingWhitespace": true,
    "files.insertFinalNewline": true,
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,

    // --------------------------------------------------
    // NAVIGATION
    // --------------------------------------------------
    "workbench.list.smoothScrolling": true,
    "editor.gotoLocation.multipleDefinitions": "peek",
    "editor.gotoLocation.multipleReferences": "peek",

    // --------------------------------------------------
    // PHP (INTELEPHENSE UNIQUEMENT)
    // --------------------------------------------------
    "php.validate.enable": false,
    "php.suggest.basic": false,
    "intelephense.environment.phpVersion": "8.2",
    "intelephense.files.maxSize": 5000000,
    "intelephense.files.exclude": [
        "**/vendor/**/{Tests,tests}/**",
        "**/var/**"
    ],
    "intelephense.format.enable": false,
    "intelephense.diagnostics.enable": true,
    "intelephense.diagnostics.undefinedTypes": true,
    "intelephense.diagnostics.undefinedFunctions": true,
    "intelephense.diagnostics.undefinedConstants": true,
    "intelephense.completion.insertUseDeclaration": true,
    "intelephense.completion.fullyQualifyGlobalConstantsAndFunctions": false,
    "[php]": {
        "editor.defaultFormatter": "bmewburn.vscode-intelephense-client",
        "editor.codeActionsOnSave": {
            "source.organizeImports": "explicit"
        }
    },

    // --------------------------------------------------
    // TWIG
    // --------------------------------------------------
    "[twig]": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "mblode.twig-language-2"
    },
    "twig-language-2.validation": true,
    "twig-language-2.format.indentSize": 4,

    // --------------------------------------------------
    // DOCKER
    // --------------------------------------------------
    "docker.containers.groupBy": "Compose",

    // --------------------------------------------------
    // TERMINAL DOCKER SYMFONY
    // --------------------------------------------------
    "terminal.integrated.fontFamily": "JetBrains Mono",
    "terminal.integrated.fontSize": 13,
    "terminal.integrated.cursorBlinking": true,
    "terminal.integrated.smoothScrolling": true,
    "terminal.integrated.profiles.linux": {
        "Symfony": {
            "path": "bash",
            "args": [
                "-c",
                "docker compose exec -it php bash || bash"
            ]
        }
    },
    "terminal.integrated.defaultProfile.linux": "Symfony",

    // --------------------------------------------------
    // GIT
    // --------------------------------------------------
    "git.confirmSync": false,
    "git.enableSmartCommit": false,
    "git.autofetch": true,
    "git.autostash": true,
    "git.pruneOnFetch": true,

    // --------------------------------------------------
    // DIFF
    // --------------------------------------------------
    "diffEditor.hideUnchangedRegions.enabled": true,

    // --------------------------------------------------
    // LOGS
    // --------------------------------------------------
    "files.associations": {
        "*.log": "log"
    },

    // --------------------------------------------------
    // AI / EXTENSIONS CONTROL
    // --------------------------------------------------
    "cursor.general.enableAutoImport": false,
    "cursor.general.enableInlineDiffs": false,
    "atlascode.jira.enabled": false,
    "atlascode.bitbucket.enabled": true,
    "github.copilot.enable": {
        "*": false
    },
    "editor.guides.indentation": true
}
