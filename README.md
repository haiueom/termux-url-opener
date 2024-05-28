# termux-url-opener

Simple script for download video and audio using termux.

**Features**:

-   download using yt-dlp
-   download using curl
-   download using wget

## How to Install

Run **this** in your _termux app_.

```bash
pkg update -y && pkg upgrade -y
pkg install curl -y && curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/setup.sh | bash
```

Then you must run **this** to setup storage termux.

```bash
termux-setup-storage
```

Then make yt-dlp configuration file to set default output directory or you can make your own configuration.

```bash
mkdir -p $HOME/.config/yt-dlp
echo "--no-mtime" > $HOME/.config/yt-dlp/config
echo "-o $HOME/storage/shared/Download/termux/%(title)s.%(ext)s" >> $HOME/.config/yt-dlp/config
```

Then you can use the script by share a link to termux.

## How to Update

if you want to update the script, just run **this** in your _termux app_.

```bash
curl https://raw.githubusercontent.com/haiueom/termux-url-opener/main/update.sh | bash
```

## How to Use Cookies

If you want to use cookies, you should copy cookies as Netscape HTTP format and put your cookies in `$HOME/storage/shared/Download/termux/cookies`.

You can use this Chrome extension to export cookies as Netscape HTTP format:

-   [EditThisCookie](https://chromewebstore.google.com/detail/fngmhnnpilhplaeedifhccceomclgfbg)
-   [Get cookies.txt LOCALLY](https://chromewebstore.google.com/detail/cclelndahbckbenkjhflpdbgdldlbecc)
-   or you can use another extension that can export cookies as Netscape HTTP format.

example: `$HOME/storage/shared/Download/termux/instagram.txt`

```text
# Netscape HTTP Cookie File
# http://curl.haxx.se/rfc/cookie_spec.html
# This is a generated file!  Do not edit.

.example.com	TRUE	/	TRUE	1234567890	cookie_name	cookie_value
.example.com	TRUE	/	TRUE	1234567890	another_cookie	another_value
```
