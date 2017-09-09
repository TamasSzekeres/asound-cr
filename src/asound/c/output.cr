module ALSA
  @[Link("asound")]
  lib ASound
    # Internal structure for an output object.
    #
    # The ALSA library uses a pointer to this structure as a handle to an
    # output object. Applications don't access its contents directly.
    alias SndOutputT = Void*

    # Output type.
    enum SndOutputTypeT
      # Output to a stdio stream.
      SND_OUTPUT_STDIO
      # Output to a memory buffer.
      SND_OUTPUT_BUFFER
    end

    struct Va_List
      gp_offset : UInt32
      fp_offset : UInt32
      overflow_arg_area : Void*
      reg_save_area : Void*
    end

    fun snd_output_stdio_open(outputp : SndOutputT*, file : UInt8*, mode : UInt8*) : Int32
    fun snd_output_stdio_attach(outputp : SndOutputT*, fp : Void*, close : Int32) : Int32
    fun snd_output_buffer_open(outputp : SndOutputT*) : Int32
    fun snd_output_buffer_string(output : SndOutputT, buf : UInt8**) : LibC::SizeT
    fun snd_output_close(output : SndOutputT) : Int32
    fun snd_output_printf(output : SndOutputT, format : UInt8*, ...) : Int32
    fun snd_output_vprintf(output : SndOutputT, format : UInt8*, args : Va_List) : Int32
    fun snd_output_puts(output : SndOutputT, str : UInt8*) : Int32
    fun snd_output_putc(output : SndOutputT, c : Int32) : Int32
    fun snd_output_flush(output : SndOutputT) : Int32
  end
end
