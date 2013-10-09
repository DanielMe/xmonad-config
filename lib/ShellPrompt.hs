
module ShellPrompt where

import qualified XMonad.Prompt as Prompt
import qualified Style as Style
import qualified Color as C

myXPConfig :: Style.StyleConfig -> Prompt.XPConfig
myXPConfig s = Prompt.defaultXPConfig
               { Prompt.font = Style.defaultFont s  -- "-*-dejavu sans mono-medium-r-*-*-17-*-*-*-*-*-*-*"
               , Prompt.height   = 22
               , Prompt.promptBorderWidth = 0 --Style.borderWidth style
               , Prompt.bgColor = show $ Style.dzenBGColor s    
               , Prompt.fgColor = show $ Style.dzenFGColor2 s
               , Prompt.borderColor = show $ Style.focusedBorderColor s
               , Prompt.position = Prompt.Top
               }