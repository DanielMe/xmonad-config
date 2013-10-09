module Layout where
import XMonad
import XMonad.Layout.ResizableTile
import XMonad.Hooks.ManageDocks

-- Layouts:
myLayout = (avoidStruts  (resizableTile ||| Mirror resizableTile |||  Full )) ||| Full
    where
    resizableTile = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio = toRational (2/(1+sqrt(5)::Double))
    delta = 3/100
