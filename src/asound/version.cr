module ALSA
  VERSION = "0.1.0"

  SND_LIB_MAJOR = 1 # < major number of library version
  SND_LIB_MINOR = 1 # < minor number of library version
  SND_LIB_SUBMINOR = 0 # < subminor number of library version
  SND_LIB_EXTRAVER = 1000000 # < extra version number, used mainly for betas
  # library version
  SND_LIB_VERSION = ((SND_LIB_MAJOR<<16) | (SND_LIB_MINOR<<8) | SND_LIB_SUBMINOR)
  # library version (string)
  SND_LIB_VERSION_STR = "1.1.0"
end
