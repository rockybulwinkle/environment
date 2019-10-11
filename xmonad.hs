-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Hooks.EwmhDesktops

import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce
import XMonad.Actions.SpawnOn
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W

--main = do
--     session <- getEnv "DESKTOP_SESSION"
--     xmonad  $ maybe desktopConfig desktop session

main =	 xmonad $ ewmh gnomeConfig 
          { terminal = "xfce4-terminal"
          , borderWidth = 3
          , startupHook = myStartupHook
          , manageHook = manageHook gnomeConfig <+> composeAll myManageHook
          , logHook = ewmhDesktopsLogHook >> setWMName "LG3D" -- java workaround
          } `additionalKeys` myKeys

myKeys = [
		((mod1Mask, xK_p), spawn "dmenu_run"),
                ((mod1Mask .|. controlMask,xK_l), spawn "xscreensaver-command -lock")

		--((mod1Mask .|. shiftMask, xK_q), spawn "gnome-session-save --logout")
	]
        ++
        [((m .|. mod1Mask, key), screenWorkspace sc >>= flip whenJust (windows . f)) -- Replace 'mod1Mask' with your mod key of choice.
            | (key, sc) <- zip [xK_w, xK_e, xK_r] [1,2,0] -- was [0..] *** change to match your screen order ***
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myStartupHook = do 
                        spawn "xrandr --output HDMI-0 --rotate normal  --right-of DVI-D-0 --primary --output DVI-I-1 --rotate normal  --left-of DVI-D-0 --output DVI-D-0 --rotate left"
			spawn "mate-panel"
			spawn "xscreensaver"



desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-gnome" = gnomeConfig
desktop _ = desktopConfig

myManageHook :: [ManageHook]
myManageHook = 
    [ resource  =? "Do"   --> doIgnore ]

