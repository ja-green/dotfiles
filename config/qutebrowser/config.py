# qutebrowser config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    'wq'  : 'quit --save',
    'w'   : 'session-save',
    'q'   : 'quit',
    'pe'  : 'set content.proxy http://localhost:8080',
    'pd'  : 'set content.proxy system',
    'mpv' : 'spawn --userscript mpv'
}

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['never']

# Maximum time (in minutes) between two history items for them to be
# considered being from the same browsing session. Items with less time
# between them are grouped when being displayed in `:history`. Use -1 to
# disable separation.
# Type: Int
c.history_gap_interval = 30

# When to find text on a page case-insensitively.
# Type: IgnoreCase
# Valid values:
#   - always: Search case-insensitively.
#   - never: Search case-sensitively.
#   - smart: Search case-sensitively if there are capital characters.
c.search.ignore_case = 'smart'

# Find text on a page incrementally, renewing the search for each typed
# character.
# Type: Bool
c.search.incremental = True

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
c.new_instance_open_target = 'tab'

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is set to `window`, this is ignored.
# Type: String
# Valid values:
#   - first-opened: Open new tabs in the first (oldest) opened window.
#   - last-opened: Open new tabs in the last (newest) opened window.
#   - last-focused: Open new tabs in the most recently focused window.
#   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = 'last-focused'

# Name of the session to save by default. If this is set to null, the
# session which was last loaded is saved.
# Type: SessionName
c.session.default_name = None

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = False

# Backend to use to display websites. qutebrowser supports two different
# web rendering engines / backends, QtWebKit and QtWebEngine. QtWebKit
# was discontinued by the Qt project with Qt 5.6, but picked up as a
# well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry than
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium).
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari).
c.backend = 'webengine'

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
# Type: Int
c.auto_save.interval = 15000

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = False

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = True

# Size (in bytes) of the HTTP network cache. Null to use the default
# value. With QtWebEngine, the maximum supported value is 2147483647 (~2
# GB).
# Type: Int
c.content.cache.size = None

# Allow websites to read canvas elements. Note this is needed for some
# websites to work properly.
# Type: Bool
c.content.canvas_reading = True

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-3rdparty'

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

# Limit fullscreen to the browser window (does not expand to fill the
# screen).
# Type: Bool
c.content.fullscreen.window = False

# Allow websites to share screen content. On Qt < 5.10, a dialog box is
# always displayed, even if this is set to "true".
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.desktop_capture = 'ask'

# Try to pre-fetch DNS entries to speed up browsing.
# Type: Bool
c.content.dns_prefetch = True

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.geolocation = 'ask'

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.accept_language = 'en-US,en'

# Custom headers for qutebrowser HTTP requests.
# Type: Dict
c.content.headers.custom = {}

# Value to send in the `DNT` header. When this is set to true,
# qutebrowser asks websites to not track your identity. If set to null,
# the DNT header is not sent at all.
# Type: Bool
c.content.headers.do_not_track = True

# When to send the Referer header. The Referer header tells websites
# from which website you were coming from when visiting them. No restart
# is needed with QtWebKit.
# Type: String
# Valid values:
#   - always: Always send the Referer.
#   - never: Never send the Referer. This is not recommended, as some sites may break.
#   - same-domain: Only send the Referer for the same domain. This will still protect your privacy, but shouldn't break any sites. With QtWebEngine, the referer will still be sent for other domains, but with stripped path information.
c.content.headers.referer = 'same-domain'

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# Enable host blocking.
# Type: Bool
c.content.host_blocking.enabled = True

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file   named `hosts` (with any extension).  It's also
# possible to add a local file or directory via a `file://` URL. In case
# of a directory, all files in the directory are read as adblock lists.
# The file `~/.config/qutebrowser/blocked-hosts` is always read if it
# exists.
# Type: List of Url
c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']

# A list of patterns that should always be loaded, despite being ad-
# blocked. Note this whitelists blocked hosts, not first-party URLs. As
# an example, if `example.org` loads an ad from `ads.example.org`, the
# whitelisted host should be `ads.example.org`. If you want to disable
# the adblocker on a given page, use the `content.host_blocking.enabled`
# setting with a URL pattern instead. Local domains are always exempt
# from hostblocking.
# Type: List of UrlPattern
c.content.host_blocking.whitelist = ['piwik.org']

# Enable hyperlink auditing (`<a ping>`).
# Type: Bool
c.content.hyperlink_auditing = False

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Load images automatically in web pages.
# Type: Bool
c.content.images = True

# Show javascript alerts.
# Type: Bool
c.content.javascript.alert = True

# Allow JavaScript to read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: Bool
c.content.javascript.can_access_clipboard = False

# Allow JavaScript to open new tabs without user interaction.
# Type: Bool
c.content.javascript.can_open_tabs_automatically = False

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Enable JavaScript.
# Type: Bool
c.content.javascript.enabled = True

# Log levels to use for JavaScript console logging messages. When a
# JavaScript message with the level given in the dictionary key is
# logged, the corresponding dictionary value selects the qutebrowser
# logger to use. On QtWebKit, the "unknown" setting is always used. The
# following levels are valid: `none`, `debug`, `info`, `warning`,
# `error`.
# Type: Dict
c.content.javascript.log = {'error': 'debug', 'warning': 'debug', 'unknown': 'debug', 'info': 'debug'}

# Use the standard JavaScript modal dialog for `alert()` and
# `confirm()`.
# Type: Bool
c.content.javascript.modal_dialog = False

# Show javascript prompts.
# Type: Bool
c.content.javascript.prompt = True

# Allow locally loaded documents to access remote URLs.
# Type: Bool
c.content.local_content_can_access_remote_urls = False

# Allow locally loaded documents to access other local URLs.
# Type: Bool
c.content.local_content_can_access_file_urls = True

# Enable support for HTML 5 local storage and Web SQL.
# Type: Bool
c.content.local_storage = True

# Netrc-file for HTTP authentication. If unset, `~/.netrc` is used.
# Type: File
c.content.netrc_file = None

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Allow websites to request persistent storage quota via
# `navigator.webkitPersistentStorage.requestQuota`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.persistent_storage = 'ask'

# Enable plugins in Web pages.
# Type: Bool
c.content.plugins = True

# Draw the background color and images also when the page is printed.
# Type: Bool
c.content.print_element_backgrounds = True

# Open new windows in private browsing mode which does not record
# visited pages.
# Type: Bool
c.content.private_browsing = False

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL. Note that with QtWebEngine, it will
# take a couple of seconds until the change is applied, if this value is
# changed at runtime.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'system'

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.ssl_strict = 'ask'

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = []

# Enable WebGL.
# Type: Bool
c.content.webgl = True

# Monitor load requests for cross-site scripting attempts. Suspicious
# scripts will be blocked and reported in the devtools JavaScript
# console. Note that bypasses for the XSS auditor are widely known and
# it can be abused for cross-site info leaks in some scenarios, see:
# https://www.chromium.org/developers/design-documents/xss-auditor
# Type: Bool
c.content.xss_auditing = True

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '25%'

# Move on to the next part when there's only one possible completion
# left.
# Type: Bool
c.completion.quick = True

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = 'always'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = True

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 12

# Padding (in pixels) of the scrollbar handle in the completion window.
# Type: Int
c.completion.scrollbar.padding = 2

# Format of timestamps (e.g. for the history completion). See
# https://sqlite.org/lang_datefunc.html for allowed substitutions.
# Type: String
c.completion.timestamp_format = '%d/%m'

# Delay (in milliseconds) before updating completions after typing a
# character.
# Type: Int
c.completion.delay = 0

# Minimum amount of characters needed to update completions.
# Type: Int
c.completion.min_chars = 1

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = False

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '/home/jagreen/dld'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Remember the last used download directory.
# Type: Bool
c.downloads.location.remember = True

# What to display in the download filename input.
# Type: String
# Valid values:
#   - path: Show only the download path.
#   - filename: Show only download filename.
#   - both: Show download path and filename.
c.downloads.location.suggestion = 'path'

# Default program used to open downloads. If null, the default internal
# handler is used. Any `{}` in the string will be expanded to the
# filename, else the filename will be appended.
# Type: String
c.downloads.open_dispatcher = None

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'top'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 50

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['nvim', '{file}']

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = 'utf-8'

# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = 'unique-match'

# Duration (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 0

# CSS border value for hints.
# Type: String
c.hints.border = '1px solid #dadada'

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'asdfghjkl'

# Dictionary file to be used by the word hints.
# Type: File
c.hints.dictionary = '/usr/share/dict/words'

# Hide unmatched hints in rapid mode.
# Type: Bool
c.hints.hide_unmatched_rapid_hints = True

# Minimum number of characters used for hint strings.
# Type: Int
c.hints.min_chars = 1

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'letter'

# Comma-separated list of regular expressions to use for 'next' links.
# Type: List of Regex
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']

# Comma-separated list of regular expressions to use for 'prev' links.
# Type: List of Regex
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']

# Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
# number hints.
# Type: Bool
c.hints.scatter = True

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = False

# Allow Escape to quit the crash reporter.
# Type: Bool
c.input.escape_quits_reporter = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# Enter insert mode if an editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_enter = True

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = True

# Switch to insert mode when clicking flash and other plugins.
# Type: Bool
c.input.insert_mode.plugins = False

# Include hyperlinks in the keyboard focus chain when tabbing.
# Type: Bool
c.input.links_included_in_focus_chain = True

# Timeout (in milliseconds) for partially typed key bindings. If the
# current input forms only partial matches, the keystring will be
# cleared after this time.
# Type: Int
c.input.partial_timeout = 5000

# Enable spatial navigation. Spatial navigation consists in the ability
# to navigate between focusable elements in a Web page, such as
# hyperlinks and form controls, by using Left, Right, Up and Down arrow
# keys. For example, if the user presses the Right key, heuristics
# determine whether there is an element he might be trying to reach
# towards the right and which element he probably wants.
# Type: Bool
c.input.spatial_navigation = False

# Rounding radius (in pixels) for the edges of the keyhint dialog.
# Type: Int
c.keyhint.radius = 6

# Time (in milliseconds) from pressing a key to seeing the keyhint
# dialog.
# Type: Int
c.keyhint.delay = 500

# Duration (in milliseconds) to show messages in the statusbar for. Set
# to 0 to never clear messages.
# Type: Int
c.messages.timeout = 5000

# Show a filebrowser in download prompts.
# Type: Bool
c.prompt.filebrowser = True

# Rounding radius (in pixels) for the edges of prompts.
# Type: Int
c.prompt.radius = 8

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = ['en-GB']

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {'top': 1, 'left': 0, 'bottom': 1, 'right': 0}

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# List of widgets displayed in the statusbar.
# Type: List of String
# Valid values:
#   - url: Current page URL.
#   - scroll: Percentage of the current page position like `10%`.
#   - scroll_raw: Raw percentage of the current page position like `10`.
#   - history: Display an arrow when possible to go back/forward in history.
#   - tabs: Current active tab, e.g. `2`.
#   - keypress: Display pressed keys when composing a vi command.
#   - progress: Progress bar for the current page loading.
c.statusbar.widgets = ['keypress', 'url', 'scroll', 'history', 'tabs', 'progress']

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Mouse button with which to close tabs.
# Type: String
# Valid values:
#   - right: Close tabs on right-click.
#   - middle: Close tabs on middle-click.
#   - none: Don't close tabs using the mouse.
c.tabs.close_mouse_button = 'middle'

# How to behave when the close mouse button is pressed on the tab bar.
# Type: String
# Valid values:
#   - new-tab: Open a new tab.
#   - close-current: Close the current tab.
#   - close-last: Close the last tab.
#   - ignore: Don't do anything.
c.tabs.close_mouse_button_on_bar = 'new-tab'

# Scaling factor for favicons in the tab bar. The tab size is unchanged,
# so big favicons also require extra `tabs.padding`.
# Type: Float
c.tabs.favicons.scale = 1.0

# When to show favicons in the tab bar.
# Type: String
# Valid values:
#   - always: Always show favicons.
#   - never: Always hide favicons.
#   - pinned: Show favicons only on pinned tabs.
c.tabs.favicons.show = 'never'

# How to behave when the last tab is closed.
# Type: String
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = 'startpage'

# Switch between tabs using the mouse wheel.
# Type: Bool
c.tabs.mousewheel_switching = True

# Position of new tabs opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.related = 'next'

# Position of new tabs which are not opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.unrelated = 'last'

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'top': 0, 'left': 5, 'bottom': 0, 'right': 5}

# When switching tabs, what input mode is applied.
# Type: String
# Valid values:
#   - persist: Retain the current mode.
#   - restore: Restore previously saved mode.
#   - normal: Always revert to normal mode.
c.tabs.mode_on_change = 'normal'

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'next'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'always'

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'left'

# Format to use for the tab title for pinned tabs. The same placeholders
# like for `tabs.title.format` are defined.
# Type: FormatString
c.tabs.title.format_pinned = '{index}'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '20%'

# Width (in pixels) of the progress indicator (0 to disable).
# Type: Int
c.tabs.indicator.width = 3

# Padding (in pixels) for tab indicators.
# Type: Padding
c.tabs.indicator.padding = {'top': 2, 'left': 0, 'bottom': 2, 'right': 4}

# Shrink pinned tabs down to their contents.
# Type: Bool
c.tabs.pinned.shrink = True

# Wrap when changing tabs.
# Type: Bool
c.tabs.wrap = True

# What search to start when something else than a URL is entered.
# Type: String
# Valid values:
#   - naive: Use simple/naive check.
#   - dns: Use DNS requests (might be slow!).
#   - never: Never search automatically.
#   - schemeless: Always search automatically unless URL explicitly contains a scheme.
c.url.auto_search = 'naive'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'file:///home/jagreen/src/github.com/ja-green/startpage/startpage.html'

# Open base URL of the searchengine if a searchengine shortcut is
# invoked without parameters.
# Type: Bool
c.url.open_base_url = True

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}', 'google': 'https://www.google.com/search?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ['file:///home/jagreen/src/github.com/ja-green/startpage/startpage.html']

# URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = False

# Default zoom level.
# Type: Perc
c.zoom.default = '75%'

# Available zoom levels.
# Type: List of Perc
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

# Number of zoom increments to divide the mouse wheel movements to.
# Type: Int
c.zoom.mouse_divider = 512

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ['#dadada', '#dadada', '#dadada']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#404552'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#404552'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#dadada'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#3a3f4d'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#3a3f4d'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#3a3f4d'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#000000'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#8ba870'

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#8ba870'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#8ba870'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#000000'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#dadada'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#404552'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#3a3f4d'

# Color gradient interpolation system for download text.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.fg = 'rgb'

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.fg = 'none'
c.colors.downloads.system.bg = 'none'

c.colors.downloads.start.fg = '#dadada'
c.colors.downloads.start.bg = '#968665'

c.colors.downloads.start.fg = '#000000'
c.colors.downloads.start.bg = '#8ba870'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#dadada'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#966575'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#dadada'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#404552'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#e0be80'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = 'purple'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#dadada'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#966575'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#966575'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#dadada'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#968665'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#968665'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#dadada'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#657596'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#657596'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#dadada'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#404552'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#dadada'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#404552'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#000000'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#8ba870'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#dadada'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#5e8d87'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#dadada'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#383c4a'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#dadada'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#404552'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#dadada'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#383c4a'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#dadada'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#966894'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#dadada'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#b294bb'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#383c4a'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#dadada'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#966575'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#657596'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#dadada'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#8ba870'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#968665'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#404552'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#966575'

c.colors.tabs.indicator.start = '#968665'

c.colors.tabs.indicator.stop = '#8ba870'

c.colors.tabs.indicator.system = 'none'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#dadada'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#3a3f4d'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#dadada'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#3a3f4d'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#dadada'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#404552'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#dadada'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#404552'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = 'white'

# Default font families to use.
# Type: Font
c.fonts.default_family = 'Inconsolata Nerd Font Mono'

# Default font size to use.
# Type: String
c.fonts.default_size = '8pt'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = 'default_size default_family'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'default_size default_family'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = 'default_size default_family'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = 'default_size default_family'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'default_size default_family'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = 'default_size default_family'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = 'default_size default_family'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = 'default_size default_family'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = 'default_size default_family'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'default_size default_family'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = 'default_size default_family'

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl+[>': '<Escape>', '<Ctrl+6>': '<Ctrl+^>', '<Ctrl+m>': '<Return>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Ctrl+Enter>': '<Ctrl+Return>', '<Ctrl+j>': '<Return>', '<Shift+Return>': '<Return>'}
