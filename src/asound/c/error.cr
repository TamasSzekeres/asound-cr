module ALSA::C
  @[Link("asound")]
  lib ASound
    # Error handling

    SND_ERROR_BEGIN = 500000 # Lower boundary of sound error codes.
    SND_ERROR_INCOMPATIBLE_VERSION = (SND_ERROR_BEGIN + 0) # Kernel/library protocols are not compatible.
    SND_ERROR_ALISP_NIL = (SND_ERROR_BEGIN + 1) # Lisp encountered an error during acall.

    fun snd_strerror(errnum : Int32) : UInt8*
  end
end
