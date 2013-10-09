import XMonad
import XMonad.Actions.UpdatePointer
import qualified Data.Map as M
import MyDzen
import Keys
import qualified Style
import XMonad.Hooks.DynamicLog hiding (dzen)
import XMonad.Hooks.UrgencyHook
import Layout
import System.IO

style = Style.defaultStyle

myConfig dzenPipe = defaultConfig 
  { modMask = mod4Mask -- use the Windows button as mod
  , keys               = \ c -> (myKeys style) c `M.union` keys defaultConfig c
  , focusedBorderColor = show $ Style.focusedBorderColor style
  , normalBorderColor  = show $ Style.borderColor style             
  , borderWidth        = Style.borderWidth style
  , layoutHook         = myLayout                      
  , logHook            = myLogHook dzenPipe >> logHook defaultConfig
  , terminal           = "emacshell"
  } 
    where
      myLogHook dzenPipe  = myDzenHook dzenPipe >> updatePointer (Relative 0.5 0.5)  

myDzenHook dzenPipe = dynamicLogWithPP $ myDzenPP style dzenPipe


-- Entry Point
main = do
  -- We spawn two dzen instances
  -- One will be passed to the log hook, the other one is fed by a conky script
  dzenPipe <- spawnDzen myLogHookBar
  spawnToDzen "conky -c ~/.dzen/conkyrc" myConkyBar
  runToDzen (printTimed 1000000 $ batteryBar style) myBatteryBar
  --runToDzen (printTimed 1000000 fooBar) myBatteryBar
  xmonad $ withUrgencyHook NoUrgencyHook $ myConfig dzenPipe

myLogHookBar = defaultDzen
               -- use the default as a base and override width and
               -- colors
               { width   = Just $ Percent 15
               , font    = Just $ Style.defaultFont style
               , height  = Just $ 22
               , fgColor = Just $ Style.dzenFGColor style
               , bgColor = Just $ Style.dzenBGColor style
               , screen = Just 0
               }
myConkyBar = myLogHookBar
             -- use the left one as a base and override just the
             -- x position and width
             { xPosition = Just $ Percent 85
             , width     = Just $ Percent 15
             , alignment = Just RightAlign
             }
myBatteryBar = myLogHookBar
               -- use the left one as a base and override just the
               -- x position and width
               { xPosition = Just $ Percent 15
               , width     = Just $ Percent 70
               , alignment = Just RightAlign
               }