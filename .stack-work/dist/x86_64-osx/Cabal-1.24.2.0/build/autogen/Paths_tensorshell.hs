{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_tensorshell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/bin"
libdir     = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/lib/x86_64-osx-ghc-8.0.2/tensorshell-0.1.0.0-KcYKhuPNkUz9Qc3C77Ogex"
dynlibdir  = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/share/x86_64-osx-ghc-8.0.2/tensorshell-0.1.0.0"
libexecdir = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/libexec"
sysconfdir = "/Users/john/src/tensorshell/.stack-work/install/x86_64-osx/lts-8.18/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tensorshell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tensorshell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tensorshell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tensorshell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tensorshell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tensorshell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
