require "./c/pcm"

module ALSA
  LITTLE_ENDIAN = 1234
  BIG_ENDIAN = 4321
  BYTE_ORDER = LITTLE_ENDIAN

  # PCM access type
  enum PcmAccess
    # mmap access with simple interleaved channels
    MMapInterleaved = 0
    # mmap access with simple non interleaved channels
    MMapNonInterleaved
    # mmap access with complex placement
    MMapComplex
    # snd_pcm_readi/snd_pcm_writei access
    RWInterleaved
    # snd_pcm_readn/snd_pcm_writen access
    RWNonInterleaved
    Last = RWNonInterleaved
  end

  # PCM sample format
  enum PcmFormat
    # Unknown
    Unknown = -1
    # Signed 8 bit
    S8 = 0
    # Unsigned 8 bit
    U8
    # Signed 16 bit Little Endian
    S16_LE
    # Signed 16 bit Big Endian
    S16_BE
    # Unsigned 16 bit Little Endian
    U16_LE
    # Unsigned 16 bit Big Endian
    U16_BE
    # Signed 24 bit Little Endian using low three bytes in 32-bit word
    S24_LE
    # Signed 24 bit Big Endian using low three bytes in 32-bit word
    S24_BE
    # Unsigned 24 bit Little Endian using low three bytes in 32-bit word
    U24_LE
    # Unsigned 24 bit Big Endian using low three bytes in 32-bit word
    U24_BE
    # Signed 32 bit Little Endian
    S32_LE
    # Signed 32 bit Big Endian
    S32_BE
    # Unsigned 32 bit Little Endian
    U32_LE
    # Unsigned 32 bit Big Endian
    U32_BE
    # Float 32 bit Little Endian, Range -1.0 to 1.0
    Float_LE
    # Float 32 bit Big Endian, Range -1.0 to 1.0
    Float_BE
    # Float 64 bit Little Endian, Range -1.0 to 1.0
    Float64_LE
    # Float 64 bit Big Endian, Range -1.0 to 1.0
    Float64_BE
    # IEC-958 Little Endian
    IEC958_SUBFRAME_LE
    # IEC-958 Big Endian
    IEC958_SUBFRAME_BE
    # Mu-Law
    MuLaw
    # A-Law
    ALaw
    # Ima-ADPCM
    ImaADPCM
    # MPEG
    MPEG
    # GSM
    GSM
    # Special
    Special = 31
    # Signed 24bit Little Endian in 3bytes format
    S24_3LE = 32
    # Signed 24bit Big Endian in 3bytes format
    S24_3BE
    # Unsigned 24bit Little Endian in 3bytes format
    U24_3LE
    # Unsigned 24bit Big Endian in 3bytes format
    U24_3BE
    # Signed 20bit Little Endian in 3bytes format
    S20_3LE
    # Signed 20bit Big Endian in 3bytes format
    S20_3BE
    # Unsigned 20bit Little Endian in 3bytes format
    U20_3LE
    # Unsigned 20bit Big Endian in 3bytes format
    U20_3BE
    # Signed 18bit Little Endian in 3bytes format
    S18_3LE
    # Signed 18bit Big Endian in 3bytes format
    S18_3BE
    # Unsigned 18bit Little Endian in 3bytes format
    U18_3LE
    # Unsigned 18bit Big Endian in 3bytes format
    U18_3BE
    # G.723 (ADPCM) 24 kbit/s, 8 samples in 3 bytes
    G723_24
    # G.723 (ADPCM) 24 kbit/s, 1 sample in 1 byte
    G723_24_1B
    # G.723 (ADPCM) 40 kbit/s, 8 samples in 3 bytes
    G723_40
    # G.723 (ADPCM) 40 kbit/s, 1 sample in 1 byte
    G723_40_1B
    # Direct Stream Digital (DSD) in 1-byte samples (x8)
    DSD_U8
    # Direct Stream Digital (DSD) in 2-byte samples (x16)
    DSD_U16_LE
    # Direct Stream Digital (DSD) in 4-byte samples (x32)
    DSD_U32_LE
    # Direct Stream Digital (DSD) in 2-byte samples (x16)
    DSD_U16_BE
    # Direct Stream Digital (DSD) in 4-byte samples (x32)
    DSD_U32_BE
    Last = DSD_U32_BE

  {% if BYTE_ORDER == LITTLE_ENDIAN %}
    # Signed 16 bit CPU endian
    S16 = S16_LE
    # Unsigned 16 bit CPU endian
    U16 = U16_LE
    # Signed 24 bit CPU endian
    S24 = S24_LE
    # Unsigned 24 bit CPU endian
    U24 = U24_LE
    # Signed 32 bit CPU endian
    S32 = S32_LE
    # Unsigned 32 bit CPU endian
    U32 = U32_LE
    # Float 32 bit CPU endian
    Float = Float_LE
    # Float 64 bit CPU endian
    Float64 = Float64_LE
    # IEC-958 CPU Endian
    IEC958_SUBFRAME = IEC958_SUBFRAME_LE
  {% elsif BYTE_ORDER == BIG_ENDIAN %}
    # Signed 16 bit CPU endian
    S16 = S16_BE
    # Unsigned 16 bit CPU endian
    U16 = U16_BE
    # Signed 24 bit CPU endian
    S24 = S24_BE
    # Unsigned 24 bit CPU endian
    U24 = U24_BE
    # Signed 32 bit CPU endian
    S32 = S32_BE
    # Unsigned 32 bit CPU endian
    U32 = U32_BE
    # Float 32 bit CPU endian
    Float = Float_BE
    # Float 64 bit CPU endian
    Float64 = Float64_BE
    # IEC-958 CPU Endian
    IEC958_SUBFRAME = IEC958_SUBFRAME_BE
  {% else %}
    # "Unknown endian"
  {% end %}
  end

  @[Flags]
  enum PcmMode : Int32
    # Non blocking mode (flag for open mode)
    NonBlock = 0x00000001
    # Async notification (flag for open mode)
    Async = 0x00000002
    # In an abort state (internal, not allowed for open)
    Abort = 0x00008000
    # Disable automatic (but not forced!) rate resamplinig
    NoAutoResample = 0x00010000
    # Disable automatic (but not forced!) channel conversion
    NoAutoChannels = 0x00020000
    # Disable automatic (but not forced!) format conversion
    NoAutoFormat = 0x00040000
    # Disable soft volume control
    NoSoftvol = 0x00080000
  end

  # PCM state
  enum PcmState
    # Open
    Open = 0
    # Setup installed
    Setup
    # Ready to start
    Prepared
    # Running
    Running
    # Stopped: underrun (playback) or overrun (capture) detected
    Xrun
    # Draining: running (playback) or stopped (capture)
    Draining
    # Paused
    Paused
    # Hardware is suspended
    Suspended
    # Hardware is disconnected
    Disconnected
    Last = Disconnected
  end

  # PCM stream (direction)
  enum PcmStream
    # Playback stream
    Playback = 0
    # Capture stream
    Capture
    Last = Capture
  end

  class Pcm
    DEFAULT = "default"

    def initialize(name : String, stream : PcmStream, mode : PcmMode = PcmMode::None)
      @handle = uninitialized ASound::SndPcmT
      res = ASound.snd_pcm_open(pointerof(@handle), name.to_unsafe,
        ASound::SndPcmStreamT.new(stream.value), mode.value)
      raise AlsaException.new(res) unless res == 0
    end

    def finalize
      ASound.snd_pcm_drain @handle
      ASound.snd_pcm_close @handle
    end

    def hw_params=(params : PcmHwParams)
      res = ASound.snd_pcm_hw_params @handle, params.to_unsafe
      raise AlsaException.new(res) unless res == 0
      self
    end

    def name : String
      String.new ASound.snd_pcm_name(@handle)
    end

    def state : PcmState
      PcmState.new ASound.snd_pcm_state(@handle).value
    end

    def state_name : String
      String.new ASound.snd_pcm_state_name ASound::SndPcmStateT.new(state.value)
    end

    def self.state_name(state : PcmState) : String
      String.new ASound.snd_pcm_state_name ASound::SndPcmStateT.new(state.value)
    end

    def writei(buffer : Bytes, size : UInt64) : Int64
      ASound.snd_pcm_writei @handle, buffer.to_unsafe, size
    end

    def to_unsafe : ASound::SndPcmT
      @handle
    end
  end
end
