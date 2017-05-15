module ALSA
  @[Link("asound")]
  lib ASound
    #RawMidi RawMidi Interface

    # RawMidi information container
    alias SndRawmidiInfoT = Void*
    # RawMidi settings container
    alias SndRawmidiParamsT = Void*
    # RawMidi status container
    alias SndRawmidiStatusT = Void*

    # RawMidi stream (direction)
    enum SndRawmidiStreamT
      # Output stream
      SND_RAWMIDI_STREAM_OUTPUT = 0
      # Input stream
      SND_RAWMIDI_STREAM_INPUT
      SND_RAWMIDI_STREAM_LAST = SND_RAWMIDI_STREAM_INPUT
    end

    # Append (flag to open mode)
    SND_RAWMIDI_APPEND = 0x0001
    # Non blocking mode (flag to open mode)
    SND_RAWMIDI_NONBLOCK = 0x0002
    # Write sync mode (Flag to open mode)
    SND_RAWMIDI_SYNC = 0x0004

    # RawMidi handle
    alias SndRawmidiT = Void*

    # RawMidi type
    enum SndRawmidiTypeT
      # Kernel level RawMidi
      SND_RAWMIDI_TYPE_HW
      # Shared memory client RawMidi (not yet implemented)
      SND_RAWMIDI_TYPE_SHM
      # INET client RawMidi (not yet implemented)
      SND_RAWMIDI_TYPE_INET
      # Virtual (sequencer) RawMidi
      SND_RAWMIDI_TYPE_VIRTUAL
    end

    fun snd_rawmidi_open(in_rmidi : SndRawmidiT*, out_rmidi : SndRawmidiT*, name : UInt8*, mode : Int32) : Int32
    fun snd_rawmidi_open_lconf(in_rmidi : SndRawmidiT*, out_rmidi : SndRawmidiT*, name : UInt8*, mode : Int32, lconf : SndConfigT) : Int32
    fun snd_rawmidi_close(rmidi : SndRawmidiT*) : Int32
    fun snd_rawmidi_poll_descriptors_count(rmidi : SndRawmidiT) : Int32
    fun snd_rawmidi_poll_descriptors(rmidi : SndRawmidiT, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_rawmidi_poll_descriptors_revents(rawmidi : SndRawmidiT, pfds : Pollfd*, nfds : UInt32, revent : UInt16) : Int32
    fun snd_rawmidi_nonblock(rmidi : SndRawmidiT, nonblock : Int32) : Int32
    fun snd_rawmidi_info_sizeof() : LibC::SizeT
    fun snd_rawmidi_info_malloc(ptr : SndRawmidiInfoT*) : Int32
    fun snd_rawmidi_info_free(obj : SndRawmidiInfoT) : Void
    fun snd_rawmidi_info_copy(dst : SndRawmidiInfoT, src : SndRawmidiInfoT) : Void
    fun snd_rawmidi_info_get_device(obj : SndRawmidiInfoT) : UInt32
    fun snd_rawmidi_info_get_subdevice(obj : SndRawmidiInfoT) : UInt32
    fun snd_rawmidi_info_get_stream(obj : SndRawmidiInfoT) : SndRawmidiStreamT
    fun snd_rawmidi_info_get_card(obj : SndRawmidiInfoT) : Int32
    fun snd_rawmidi_info_get_flags(obj : SndRawmidiInfoT) : UInt32
    fun snd_rawmidi_info_get_id(obj : SndRawmidiInfoT) : UInt8*
    fun snd_rawmidi_info_get_name(obj : SndRawmidiInfoT) : UInt8*
    fun snd_rawmidi_info_get_subdevice_name(obj : SndRawmidiInfoT) : UInt8*
    fun snd_rawmidi_info_get_subdevices_count(obj : SndRawmidiInfoT) : UInt32
    fun snd_rawmidi_info_get_subdevices_avail(obj : SndRawmidiInfoT) : UInt32
    fun snd_rawmidi_info_set_device(obj : SndRawmidiInfoT, val : UInt32) : Void
    fun snd_rawmidi_info_set_subdevice(obj : SndRawmidiInfoT, val : UInt32) : Void
    fun snd_rawmidi_info_set_stream(obj : SndRawmidiInfoT, val : SndRawmidiStreamT) : Void
    fun snd_rawmidi_info(rmidi : SndRawmidiT, info : SndRawmidiInfoT) : Int32
    fun snd_rawmidi_params_sizeof() : LibC::SizeT
    fun snd_rawmidi_params_malloc(ptr : SndRawmidiParamsT*) : Int32
    fun snd_rawmidi_params_free(obj : SndRawmidiParamsT) : Void
    fun snd_rawmidi_params_copy(dst : SndRawmidiParamsT, src : SndRawmidiParamsT) : Void
    fun snd_rawmidi_params_set_buffer_size(rmidi : SndRawmidiT, params : SndRawmidiParamsT, val : LibC::SizeT) : Int32
    fun snd_rawmidi_params_get_buffer_size(params : SndRawmidiParamsT) : LibC::SizeT
    fun snd_rawmidi_params_set_avail_min(rmidi : SndRawmidiT, params : SndRawmidiParamsT, val : LibC::SizeT) : Int32
    fun snd_rawmidi_params_get_avail_min(params : SndRawmidiParamsT) : LibC::SizeT
    fun snd_rawmidi_params_set_no_active_sensing(rmidi : SndRawmidiT, params : SndRawmidiParamsT, val : Int32) : Int32
    fun snd_rawmidi_params_get_no_active_sensing(params : SndRawmidiParamsT) : Int32
    fun snd_rawmidi_params(rmidi : SndRawmidiT, params : SndRawmidiParamsT) : Int32
    fun snd_rawmidi_params_current(rmidi : SndRawmidiT, params : SndRawmidiParamsT) : Int32
    fun snd_rawmidi_status_sizeof() : LibC::SizeT
    fun snd_rawmidi_status_malloc(ptr : SndRawmidiStatusT*) : Int32
    fun snd_rawmidi_status_free(obj : SndRawmidiStatusT) : Void
    fun snd_rawmidi_status_copy(dst : SndRawmidiStatusT, src : SndRawmidiStatusT) : Void
    fun snd_rawmidi_status_get_tstamp(obj : SndRawmidiStatusT, ptr : SndHTimestampT*) : Void
    fun snd_rawmidi_status_get_avail(obj : SndRawmidiStatusT) : LibC::SizeT
    fun snd_rawmidi_status_get_xruns(obj : SndRawmidiStatusT) : LibC::SizeT
    fun snd_rawmidi_status(rmidi : SndRawmidiT, status : SndRawmidiStatusT) : Int32
    fun snd_rawmidi_drain(rmidi : SndRawmidiT) : Int32
    fun snd_rawmidi_drop(rmidi : SndRawmidiT) : Int32
    fun snd_rawmidi_write(rmidi : SndRawmidiT, buffer : Void*, size : LibC::SizeT) : LibC::SizeT
    fun snd_rawmidi_read(rmidi : SndRawmidiT, buffer : Void*, size : LibC::SizeT) : LibC::SizeT
    fun snd_rawmidi_name(rmidi : SndRawmidiT) : UInt8*
    fun snd_rawmidi_type(rmidi : SndRawmidiT) : SndRawmidiTypeT
    fun snd_rawmidi_stream(rawmidi : SndRawmidiT) : SndRawmidiStreamT
  end

  @[AlwaysInline]
  def self.snd_rawmidi_info_alloca : ASound::SndRawmidiInfoT
    LibC.malloc(ASound.snd_rawmidi_info_sizeof).as(ASound::SndRawmidiInfoT)
  end

  @[AlwaysInline]
  def self.snd_rawmidi_params_alloca : ASound::SndRawmidiParamsT
    LibC.malloc(ASound.snd_rawmidi_params_sizeof).as(ASound::SndRawmidiParamsT)
  end

  @[AlwaysInline]
  def self.snd_rawmidi_status_alloca : ASound::SndRawmidiStatusT
    LibC.malloc(ASound.snd_rawmidi_status_sizeof).as(ASound::SndRawmidiStatusT)
  end
end
