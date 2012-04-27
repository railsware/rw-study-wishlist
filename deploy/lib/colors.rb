module Color
  BLACK    = "\033[30m"
  GRAY     = "\033[30m"
  LGRAY    = "\033[37m"
  WHITE    = "\033[37m"
  RED      = "\033[31m"
  LRED     = "\033[31m"
  GREEN    = "\033[32m"
  LGREEN   = "\033[32m"
  BROWN    = "\033[33m"
  YELLOW   = "\033[33m"
  BLUE     = "\033[34m"
  LBLUE    = "\033[34m"
  PURPLE   = "\033[35m"
  LPURPLE  = "\033[35m"
  CYAN     = "\033[36m"
  LCYAN    = "\033[36m"

  BACKBLACK  = "\033[40m"
  BACKRED    = "\033[41m"
  BACKGREEN  = "\033[42m"
  BACKYELLOW = "\033[43m"
  BACKBLUE   = "\033[44m"
  BACKPURPLE = "\033[45m"
  BACKCYAN   = "\033[46m"
  BACKGRAY   = "\033[47m"

  RESET      = "\033[0m"
  BOLD       = "\033[1m"
  UNDERSCORE = "\033[4m"
  BLINK      = "\033[5m"
  REVERSE    = "\033[7m"
  CONCEALED  = "\033[8m"

  XTERM_SET_TITLE   = "\033]2;"
  XTERM_END         = "\007"
  ITERM_SET_TAB     = "\033]1;"
  ITERM_END         = "\007"
  SCREEN_SET_STATUS = "\033]0;"
  SCREEN_END        = "\007"
end

def mycolorize(text, color_code)
    "#{color_code}#{text}#{Color::RESET}"
end

def red(text); mycolorize(text, Color::RED); end
def green(text); mycolorize(text, Color::GREEN); end
def yellow(text); mycolorize(text, Color::YELLOW); end
def blue(text); mycolorize(text, Color::BLUE); end
