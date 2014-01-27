module Layout where
import XMonad
import XMonad.Layout.ResizableTile
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

-- Layouts:
myLayout = ( spacing 3 $ avoidStruts  (resizableTile ||| Mirror resizableTile |||  Full )) ||| (noBorders Full)
    where
    resizableTile = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio = toRational (2/(1+sqrt(5)::Double))
    delta = 3/100
