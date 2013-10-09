module Keys where

import XMonad
import XMonad.Actions.Volume
import qualified XMonad.StackSet as W -- to shift and float windows
import qualified Data.Map as M
import XMonad.Prompt.Shell
import ShellPrompt

xK_XF86AudioRaiseVolume :: KeySym
xK_XF86AudioRaiseVolume = 0x1008ff13
xK_XF86AudioLowerVolume :: KeySym
xK_XF86AudioLowerVolume = 0x1008ff11

myKeys style (XConfig {modMask = modm}) = M.fromList $
    [ ((modm, xK_e), shellPrompt (myXPConfig style)),
      ((0, xK_XF86AudioRaiseVolume), raiseVolume 4 >> return ()),
      ((0, xK_XF86AudioLowerVolume), lowerVolume 4 >> return ())
    ]
    ++
    --
    -- mod-{a,s,d}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{a,s,d}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_d, xK_s, xK_a] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    [((0, xK_F11   ), spawn "ksnapshot")]
