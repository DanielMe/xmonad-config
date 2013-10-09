{-# LANGUAGE OverloadedStrings #-}
module Main (main) where
import DBus.Client
import DBus.Client.Simple (connectSession, connectSystem)
import DBus.Message
import DBus.Types
import DBus.Message
import Control.Monad
import Control.Concurrent
  
main :: IO ()
main = do
	client <- connectSystem
	
	-- Request a list of connected clients from the bus
	--bus <- proxy client "org.freedesktop.UDisks" "/org/freedesktop/UDisks"
        let rule = MatchRule { --matchType = Just MR.Signal,
                               matchSender = Nothing
                             , matchDestination = Nothing
                             , matchPath = Just "/org/freedesktop/UDisks"
                             , matchInterface = Just "org.freedesktop.UDisks"
                             , matchMember = Just "DeviceAdded"
                                             --, matchParameters = mp
                             }
	listen client rule callback
        forever $ threadDelay 100000
        
callback :: BusName -> Signal -> IO ()
callback _ s = putStrLn $ show s