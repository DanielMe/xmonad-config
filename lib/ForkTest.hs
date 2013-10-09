module ForkTest where

import Control.Monad
import Control.Concurrent

main :: IO ()
main = (doTimed 100000 $ putStrLn "foo") >> return ()

doTimed :: Int -> IO () -> IO ThreadId
doTimed interval f = forkIO fun
  where fun = forever $ f >> threadDelay interval
