module ALSA::C
  @[Link("asound")]
  lib ASound
    # Internal structure for an input object.
    #
    # The ALSA library uses a pointer to this structure as a handle to an
    # input object. Applications don't access its contents directly.

    alias SndInputT = Void*

    # Input type.
    enum SndInputTypeT
      # Input from a stdio stream.
      SND_INPUT_STDIO
      # Input from a memory buffer.
      SND_INPUT_BUFFER
    end

    fun snd_input_stdio_open(inputp : SndInputT*, file : UInt8*, mode : UInt8*) : Int32
    fun snd_input_stdio_attach(inputp : SndInputT*, fp : Void*, close : Int32) : Int32
    fun snd_input_buffer_open(inputp : SndInputT*, buffer : UInt8, size : LibC::SSizeT) : Int32
    fun snd_input_close(input : SndInputT) : Int32
    fun snd_input_scanf(input : SndInputT, format : UInt8, ...) : Int32

    fun snd_input_gets(input : SndInputT, str : UInt8*, size : LibC::SizeT) : UInt8*
    fun snd_input_getc(input : SndInputT) : Int32
    fun snd_input_ungetc(input : SndInputT, c : Int32) : Int32
  end
end
