import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiColumns
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

orange = "#ee9a00"
dmenu_config = " -fn -misc-fixed-*-*-*-*-10-*-*-*-*-*-*-* -nb black -nf gray -sf '" ++ orange ++ "' -sb black"
myLayoutHook = smartBorders $ avoidStruts $ layoutHook def ||| columns
--columns = ThreeColMid 1 (3/100) (1/3)
columns = multiCol [1,1,0] 4 0.01 0.5
mask = mod4Mask

myManageHook = composeAll
  [ resource =? "x3270"       --> doFloat
  , resource =? "keypadPopup" --> doIgnore
  , className =? "stellaris" --> doFullFloat
  , className =? "eu4" --> doFullFloat
  , className =? "ck2" --> doFullFloat
  , manageDocks
  ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook
           $ ewmh
           $ def
      { manageHook = myManageHook <+> manageHook def
      , handleEventHook = fullscreenEventHook <+> docksEventHook <+> handleEventHook def
      , layoutHook = myLayoutHook
      , logHook    = dynamicLogWithPP $ sjanssenPP
        { ppOutput = hPutStrLn xmproc
        , ppOrder  = \(ws:_:t:_) -> [ws,t]
        , ppTitle = xmobarColor orange "" . shorten 120
        , ppUrgent = xmobarColor orange "" . xmobarStrip
        }
      , startupHook = setWMName "LG3D"
      , modMask = mask     -- Rebind Mod to the Windows key
      , normalBorderColor = "#262626"
      , focusedBorderColor = orange
      , terminal = "konsole"
      } `additionalKeys` myKeys

myKeys = [ ((mask, xK_z), spawn "suspend.sh")
         , ((mask, xK_m), spawn "dmpc")
         , ((mask, xK_n), spawn "mpc next")
         , ((mask, xK_b), spawn "mpc toggle")
         , ((mask, xK_v), spawn "lastfm-love")
         , ((mask, xK_p), spawn ("dmenu_run" ++ dmenu_config))
         , ((mask, xK_s), sendMessage ToggleStruts)
         ] ++
         -- mod-[1..9] %! Switch to workspace N
         -- mod-shift-[1..9] %! Move client to workspace N
         [((m .|. mask, k), windows $ f i)
           | (i, k) <- zip (XMonad.workspaces def) numPadKeys
           , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

numPadKeys = [ xK_KP_End,  xK_KP_Down,  xK_KP_Page_Down -- 1, 2, 3
             , xK_KP_Left, xK_KP_Begin, xK_KP_Right     -- 4, 5, 6
             , xK_KP_Home, xK_KP_Up,    xK_KP_Page_Up   -- 7, 8, 9
             ] --, xK_KP_Insert]                            -- 0
