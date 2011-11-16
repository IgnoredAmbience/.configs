import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook
           $ defaultConfig
      { manageHook = isFullscreen --> doFullFloat <+> manageDocks <+> manageHook defaultConfig
      , layoutHook = smartBorders $ avoidStruts  $  layoutHook defaultConfig
      , logHook    = dynamicLogWithPP $ sjanssenPP
        { ppOutput = hPutStrLn xmproc
        , ppOrder  = \(ws:_:t:_) -> [ws,t]
        , ppUrgent = xmobarColor "#ee9a00" "" . xmobarStrip
        }
      , modMask = mod4Mask     -- Rebind Mod to the Windows key
      , normalBorderColor = "#000000"
      , focusedBorderColor = "#ee9a00"
      } `additionalKeys`
      [ ((mod4Mask, xK_z), spawn "slimlock")
      , ((mod4Mask, xK_n), spawn "exaile --next --start-anyway")
      , ((mod4Mask, xK_b), spawn "exaile --play-pause --start-anyway")
      , ((mod4Mask, xK_m), spawn "exaile --toggle-visible --start-anyway")
      , ((mod4Mask, xK_p), spawn "dmenu_run -fn -*-*-*-*-*-12-*-*-*-*-*-*-* -nb black -nf gray -sf '#ee9a00' -sb black")
      , ((0, 0x1008FF2F),  spawn "sudo pm-suspend")
      ]
