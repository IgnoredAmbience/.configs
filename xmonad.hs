import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName

orange = "#ee9a00"
dmenu_config = " -fn -misc-fixed-*-*-*-*-10-*-*-*-*-*-*-* -nb black -nf gray -sf '" ++ orange ++ "' -sb black"
myLayoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig ||| columns
--columns = ThreeColMid 1 (3/100) (1/3)
columns = multiCol [1,1,0] 4 0.01 0.5

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook
           $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , handleEventHook = docksEventHook <+> handleEventHook defaultConfig
      , layoutHook = myLayoutHook
      , logHook    = dynamicLogWithPP $ sjanssenPP
        { ppOutput = hPutStrLn xmproc
        , ppOrder  = \(ws:_:t:_) -> [ws,t]
        , ppTitle = xmobarColor orange "" . shorten 120
        , ppUrgent = xmobarColor orange "" . xmobarStrip
        }
      , startupHook = setWMName "LG3D"
      , modMask = mod4Mask     -- Rebind Mod to the Windows key
      , normalBorderColor = "#262626"
      , focusedBorderColor = orange
      , terminal = "xterm"
      } `additionalKeys`
      [ ((mod4Mask, xK_z), spawn "xscreensaver-command -lock")
      , ((mod4Mask, xK_m), spawn "dmpc")
      , ((mod4Mask, xK_n), spawn "mpc next")
      , ((mod4Mask, xK_b), spawn "mpc toggle")
      , ((mod4Mask, xK_v), spawn "lastfm-love")
      , ((mod4Mask, xK_p), spawn ("dmenu_run" ++ dmenu_config))
      , ((mod4Mask, xK_s), sendMessage ToggleStruts)
      , ((mod4Mask, xK_x), spawn "touchpad-toggle")
      ]
