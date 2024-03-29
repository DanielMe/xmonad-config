module Style where

import XMonad (Dimension)
import Color as C

data StyleConfig = StyleConfig 
                   { defaultFont :: String
                   , iconDir     :: String
                   , dzenFGColor :: C.Color
                   , dzenFGColor2 :: C.Color
                   , dzenBGColor :: C.Color
                   , dzenUrgentFGColor :: C.Color
                   , dzenUrgentBGColor :: C.Color
                   , dzenWarningColor :: C.Color
                   , seperatorColor :: C.Color
                   , borderColor :: C.Color
                   , focusedBorderColor :: C.Color
                   , borderWidth :: Dimension
                   }
                   
                   
-- -unknown-DejaVu Sans Mono-normal-normal-normal--14-*-*-*-m-0-iso10646-1
-- "-*-montecarlo-medium-r-normal-*-11-*-*-*-c-*-*-*"
defaultStyle = StyleConfig
               { defaultFont = "-unknown-DejaVu Sans Mono-normal-normal-normal--12-*-*-*-m-0-iso10646-1"
               , iconDir = "/home/daniel/.dzen/xbm8x8"
               , dzenFGColor = greyTone 120
               , dzenFGColor2 = greyTone 170
               , dzenBGColor = greyTone 35
               , dzenUrgentFGColor = RGB 0 150 255
               , dzenUrgentBGColor = RGB 0 170 255
               , dzenWarningColor = RGB 150 50 50
               , seperatorColor = greyTone 85
               , borderColor = greyTone 135
               , focusedBorderColor = (RGB 35 100 150)
               , borderWidth = 3
               }