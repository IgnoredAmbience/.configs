import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook
           $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts  $  layoutHook defaultConfig
      , logHook    = dynamicLogWithPP $ sjanssenPP
        { ppOutput = hPutStrLn xmproc
        , ppOrder  = \(ws:_:t:_) -> [ws,t]
        , ppUrgent = xmobarColor "#ee9a00" "" . xmobarStrip
        }
      , modMask = mod4Mask     -- Rebind Mod to the Windows key
      , normalBorderColor = "#000000"
      , focusedBorderColor = "#ee9a00"
      } `additionalKeys`
      [ ((mod4Mask, xK_z), spawn "xlock")
      , ((mod4Mask, xK_n), spawn "exaile --next")
      , ((mod4Mask, xK_b), spawn "exaile --play-pause")
      , ((mod4Mask, xK_m), spawn "exaile --toggle-visible")
      , ((mod4Mask, xK_p), spawn "dmenu_run -fn -misc-fixed-*-*-*-*-10-*-*-*-*-*-*-* -nb black -nf gray -sf '#ee9a00' -sb black")
      ]
