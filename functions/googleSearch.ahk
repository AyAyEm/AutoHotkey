; Google Search highlighted text
googleSearch() {
    Send, ^c
    Sleep 50
    Run, http://www.google.com/search?q=%clipboard%
    Return
}