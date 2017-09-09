module ALSA::C
  @[Link("asound")]
  lib ASound
    LITTLE_ENDIAN = 1234
    BIG_ENDIAN = 4321
    BYTE_ORDER = LITTLE_ENDIAN

    # PCM PCM Interface
    # See the \ref pcm page for more details.

    # dlsym version for interface entry callback
    #SND_PCM_DLSYM_VERSION = _dlsym_pcm_001

    # PCM generic info container
    alias SndPcmInfoT = Void*

    # PCM hardware configuration space container
    #
    # snd_pcm_hw_params_t is an opaque structure which contains a set of possible
    # PCM hardware configurations. For example, a given instance might include a
    # range of buffer sizes, a range of period sizes, and a set of several sample
    # formats. Some subset of all possible combinations these sets may be valid,
    # but not necessarily any combination will be valid.
    #
    # When a parameter is set or restricted using a snd_pcm_hw_params_set*
    # function, all of the other ranges will be updated to exclude as many
    # impossible configurations as possible. Attempting to set a parameter
    # outside of its acceptable range will result in the function failing
    # and an error code being returned.
    alias SndPcmHwParamsT = Void*

    # PCM software configuration container
    alias SndPcmSwParamsT = Void*

    # PCM status container
    alias SndPcmStatusT = Void*

    # PCM access types mask
    alias SndPcmAccessMaskT = Void*

    # PCM formats mask
    alias SndPcmFormatMaskT = Void*

    # PCM subformats mask
    alias SndPcmSubformatMaskT = Void*

    # PCM class
    enum SndPcmClassT
      # standard device

      SND_PCM_CLASS_GENERIC = 0
      # multichannel device
      SND_PCM_CLASS_MULTI,
      # software modem device
      SND_PCM_CLASS_MODEM
      # digitizer device
      SND_PCM_CLASS_DIGITIZER
      SND_PCM_CLASS_LAST = SND_PCM_CLASS_DIGITIZER
    end

    # PCM subclass
    enum SndPcmSubclassT
      # subdevices are mixed together
      SND_PCM_SUBCLASS_GENERIC_MIX = 0
      # multichannel subdevices are mixed together
      SND_PCM_SUBCLASS_MULTI_MIX
      SND_PCM_SUBCLASS_LAST = SND_PCM_SUBCLASS_MULTI_MIX
    end

    # PCM stream (direction)
    enum SndPcmStreamT
      # Playback stream
      SND_PCM_STREAM_PLAYBACK = 0
      # Capture stream
      SND_PCM_STREAM_CAPTURE
      SND_PCM_STREAM_LAST = SND_PCM_STREAM_CAPTURE
    end

    # PCM access type
    enum SndPcmAccessT
      # mmap access with simple interleaved channels
      SND_PCM_ACCESS_MMAP_INTERLEAVED = 0
      # mmap access with simple non interleaved channels
      SND_PCM_ACCESS_MMAP_NONINTERLEAVED
      # mmap access with complex placement
      SND_PCM_ACCESS_MMAP_COMPLEX
      # snd_pcm_readi/snd_pcm_writei access
      SND_PCM_ACCESS_RW_INTERLEAVED
      # snd_pcm_readn/snd_pcm_writen access
      SND_PCM_ACCESS_RW_NONINTERLEAVED
      SND_PCM_ACCESS_LAST = SND_PCM_ACCESS_RW_NONINTERLEAVED
    end

    # PCM sample format
    enum SndPcmFormatT
      # Unknown
      SND_PCM_FORMAT_UNKNOWN = -1
      # Signed 8 bit
      SND_PCM_FORMAT_S8 = 0
      # Unsigned 8 bit
      SND_PCM_FORMAT_U8
      # Signed 16 bit Little Endian
      SND_PCM_FORMAT_S16_LE
      # Signed 16 bit Big Endian
      SND_PCM_FORMAT_S16_BE
      # Unsigned 16 bit Little Endian
      SND_PCM_FORMAT_U16_LE
      # Unsigned 16 bit Big Endian
      SND_PCM_FORMAT_U16_BE
      # Signed 24 bit Little Endian using low three bytes in 32-bit word
      SND_PCM_FORMAT_S24_LE
      # Signed 24 bit Big Endian using low three bytes in 32-bit word
      SND_PCM_FORMAT_S24_BE
      # Unsigned 24 bit Little Endian using low three bytes in 32-bit word
      SND_PCM_FORMAT_U24_LE
      # Unsigned 24 bit Big Endian using low three bytes in 32-bit word
      SND_PCM_FORMAT_U24_BE
      # Signed 32 bit Little Endian
      SND_PCM_FORMAT_S32_LE
      # Signed 32 bit Big Endian
      SND_PCM_FORMAT_S32_BE
      # Unsigned 32 bit Little Endian
      SND_PCM_FORMAT_U32_LE
      # Unsigned 32 bit Big Endian
      SND_PCM_FORMAT_U32_BE
      # Float 32 bit Little Endian, Range -1.0 to 1.0
      SND_PCM_FORMAT_FLOAT_LE
      # Float 32 bit Big Endian, Range -1.0 to 1.0
      SND_PCM_FORMAT_FLOAT_BE
      # Float 64 bit Little Endian, Range -1.0 to 1.0
      SND_PCM_FORMAT_FLOAT64_LE
      # Float 64 bit Big Endian, Range -1.0 to 1.0
      SND_PCM_FORMAT_FLOAT64_BE
      # IEC-958 Little Endian
      SND_PCM_FORMAT_IEC958_SUBFRAME_LE
      # IEC-958 Big Endian
      SND_PCM_FORMAT_IEC958_SUBFRAME_BE
      # Mu-Law
      SND_PCM_FORMAT_MU_LAW
      # A-Law
      SND_PCM_FORMAT_A_LAW
      # Ima-ADPCM
      SND_PCM_FORMAT_IMA_ADPCM
      # MPEG
      SND_PCM_FORMAT_MPEG
      # GSM
      SND_PCM_FORMAT_GSM
      # Special
      SND_PCM_FORMAT_SPECIAL = 31
      # Signed 24bit Little Endian in 3bytes format
      SND_PCM_FORMAT_S24_3LE = 32
      # Signed 24bit Big Endian in 3bytes format
      SND_PCM_FORMAT_S24_3BE
      # Unsigned 24bit Little Endian in 3bytes format
      SND_PCM_FORMAT_U24_3LE
      # Unsigned 24bit Big Endian in 3bytes format
      SND_PCM_FORMAT_U24_3BE
      # Signed 20bit Little Endian in 3bytes format
      SND_PCM_FORMAT_S20_3LE
      # Signed 20bit Big Endian in 3bytes format
      SND_PCM_FORMAT_S20_3BE
      # Unsigned 20bit Little Endian in 3bytes format
      SND_PCM_FORMAT_U20_3LE
      # Unsigned 20bit Big Endian in 3bytes format
      SND_PCM_FORMAT_U20_3BE
      # Signed 18bit Little Endian in 3bytes format
      SND_PCM_FORMAT_S18_3LE
      # Signed 18bit Big Endian in 3bytes format
      SND_PCM_FORMAT_S18_3BE
      # Unsigned 18bit Little Endian in 3bytes format
      SND_PCM_FORMAT_U18_3LE
      # Unsigned 18bit Big Endian in 3bytes format
      SND_PCM_FORMAT_U18_3BE
      # G.723 (ADPCM) 24 kbit/s, 8 samples in 3 bytes
      SND_PCM_FORMAT_G723_24
      # G.723 (ADPCM) 24 kbit/s, 1 sample in 1 byte
      SND_PCM_FORMAT_G723_24_1B
      # G.723 (ADPCM) 40 kbit/s, 8 samples in 3 bytes
      SND_PCM_FORMAT_G723_40
      # G.723 (ADPCM) 40 kbit/s, 1 sample in 1 byte
      SND_PCM_FORMAT_G723_40_1B
      # Direct Stream Digital (DSD) in 1-byte samples (x8)
      SND_PCM_FORMAT_DSD_U8
      # Direct Stream Digital (DSD) in 2-byte samples (x16)
      SND_PCM_FORMAT_DSD_U16_LE
      # Direct Stream Digital (DSD) in 4-byte samples (x32)
      SND_PCM_FORMAT_DSD_U32_LE
      # Direct Stream Digital (DSD) in 2-byte samples (x16)
      SND_PCM_FORMAT_DSD_U16_BE
      # Direct Stream Digital (DSD) in 4-byte samples (x32)
      SND_PCM_FORMAT_DSD_U32_BE
      SND_PCM_FORMAT_LAST = SND_PCM_FORMAT_DSD_U32_BE

    {% if BYTE_ORDER == LITTLE_ENDIAN %}
      # Signed 16 bit CPU endian
      SND_PCM_FORMAT_S16 = SND_PCM_FORMAT_S16_LE
      # Unsigned 16 bit CPU endian
      SND_PCM_FORMAT_U16 = SND_PCM_FORMAT_U16_LE
      # Signed 24 bit CPU endian
      SND_PCM_FORMAT_S24 = SND_PCM_FORMAT_S24_LE
      # Unsigned 24 bit CPU endian
      SND_PCM_FORMAT_U24 = SND_PCM_FORMAT_U24_LE
      # Signed 32 bit CPU endian
      SND_PCM_FORMAT_S32 = SND_PCM_FORMAT_S32_LE
      # Unsigned 32 bit CPU endian
      SND_PCM_FORMAT_U32 = SND_PCM_FORMAT_U32_LE
      # Float 32 bit CPU endian
      SND_PCM_FORMAT_FLOAT = SND_PCM_FORMAT_FLOAT_LE
      # Float 64 bit CPU endian
      SND_PCM_FORMAT_FLOAT64 = SND_PCM_FORMAT_FLOAT64_LE
      # IEC-958 CPU Endian
      SND_PCM_FORMAT_IEC958_SUBFRAME = SND_PCM_FORMAT_IEC958_SUBFRAME_LE
    {% elsif BYTE_ORDER == BIG_ENDIAN %}
      # Signed 16 bit CPU endian
      SND_PCM_FORMAT_S16 = SND_PCM_FORMAT_S16_BE
      # Unsigned 16 bit CPU endian
      SND_PCM_FORMAT_U16 = SND_PCM_FORMAT_U16_BE
      # Signed 24 bit CPU endian
      SND_PCM_FORMAT_S24 = SND_PCM_FORMAT_S24_BE
      # Unsigned 24 bit CPU endian
      SND_PCM_FORMAT_U24 = SND_PCM_FORMAT_U24_BE
      # Signed 32 bit CPU endian
      SND_PCM_FORMAT_S32 = SND_PCM_FORMAT_S32_BE
      # Unsigned 32 bit CPU endian
      SND_PCM_FORMAT_U32 = SND_PCM_FORMAT_U32_BE
      # Float 32 bit CPU endian
      SND_PCM_FORMAT_FLOAT = SND_PCM_FORMAT_FLOAT_BE
      # Float 64 bit CPU endian
      SND_PCM_FORMAT_FLOAT64 = SND_PCM_FORMAT_FLOAT64_BE
      # IEC-958 CPU Endian
      SND_PCM_FORMAT_IEC958_SUBFRAME = SND_PCM_FORMAT_IEC958_SUBFRAME_BE
    {% else %}
      # "Unknown endian"
    {% end %}
    end

    # PCM sample subformat
    enum SndPcmSubformatT
      # Standard
      SND_PCM_SUBFORMAT_STD = 0
      SND_PCM_SUBFORMAT_LAST = SND_PCM_SUBFORMAT_STD
    end

    # PCM state
    enum SndPcmStateT
      # Open
      SND_PCM_STATE_OPEN = 0
      # Setup installed
      SND_PCM_STATE_SETUP
      # Ready to start
      SND_PCM_STATE_PREPARED
      # Running
      SND_PCM_STATE_RUNNING
      # Stopped: underrun (playback) or overrun (capture) detected
      SND_PCM_STATE_XRUN
      # Draining: running (playback) or stopped (capture)
      SND_PCM_STATE_DRAINING
      # Paused
      SND_PCM_STATE_PAUSED
      # Hardware is suspended
      SND_PCM_STATE_SUSPENDED
      # Hardware is disconnected
      SND_PCM_STATE_DISCONNECTED
      SND_PCM_STATE_LAST = SND_PCM_STATE_DISCONNECTED
    end

    # PCM start mode
    enum SndPcmStartT
      # Automatic start on data read/write
      SND_PCM_START_DATA = 0
      # Explicit start
      SND_PCM_START_EXPLICIT
      SND_PCM_START_LAST = SND_PCM_START_EXPLICIT
    end

    # PCM xrun mode
    enum SndPcmXrunT
      # Xrun detection disabled
      SND_PCM_XRUN_NONE = 0
      # Stop on xrun detection
      SND_PCM_XRUN_STOP
      SND_PCM_XRUN_LAST = SND_PCM_XRUN_STOP
    end

    # PCM timestamp mode
    enum SndPcmTstampT
      # No timestamp
      SND_PCM_TSTAMP_NONE = 0
      # Update timestamp at every hardware position update
      SND_PCM_TSTAMP_ENABLE
      # Equivalent with #SND_PCM_TSTAMP_ENABLE,
      # just for compatibility with older versions
      SND_PCM_TSTAMP_MMAP = SND_PCM_TSTAMP_ENABLE
      SND_PCM_TSTAMP_LAST = SND_PCM_TSTAMP_ENABLE
    end

    enum SndPcmTstampTypeT
      SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY = 0 # gettimeofday equivalent
      SND_PCM_TSTAMP_TYPE_MONOTONIC # posix_clock_monotonic equivalent
      SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW # monotonic_raw (no NTP)
      SND_PCM_TSTAMP_TYPE_LAST = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW
    end

    struct SndPcmAudioTstampConfigT
      # 5 of max 16 bits used
      # unsigned int type_requested:4;
      # unsigned int report_delay:1; /* add total delay to A/D or D/A */
      bits : UInt16
    end

    struct SndPcmAudioTstampReportT
      # 6 of max 16 bits used for bit-fields

      # for backwards compatibility
      # unsigned int valid:1;

      # actual type if hardware could not support requested timestamp
      # unsigned int actual_type:4;

      # accuracy represented in ns units
      # unsigned int accuracy_report:1; /* 0 if accuracy unknown, 1 if accuracy field is valid */
      # unsigned int accuracy; /* up to 4.29s, will be packed in separate field  */
      bits : UInt16
    end

    # Unsigned frames quantity
    alias SndPcmUframesT = UInt64
    # Signed frames quantity
    alias SndPcmSframesT = Int64

    # Non blocking mode (flag for open mode)
    SND_PCM_NONBLOCK = 0x00000001
    # Async notification (flag for open mode)
    SND_PCM_ASYNC = 0x00000002
    # In an abort state (internal, not allowed for open)
    SND_PCM_ABORT = 0x00008000
    # Disable automatic (but not forced!) rate resamplinig
    SND_PCM_NO_AUTO_RESAMPLE = 0x00010000
    # Disable automatic (but not forced!) channel conversion
    SND_PCM_NO_AUTO_CHANNELS = 0x00020000
    # Disable automatic (but not forced!) format conversion
    SND_PCM_NO_AUTO_FORMAT = 0x00040000
    # Disable soft volume control
    SND_PCM_NO_SOFTVOL = 0x00080000

    # PCM handle
    alias SndPcmT = Void*

    # PCM type
    enum SndPcmTypeT
      # Kernel level PCM
      SND_PCM_TYPE_HW = 0
      # Hooked PCM
      SND_PCM_TYPE_HOOKS
      # One or more linked PCM with exclusive access to selected channels
      SND_PCM_TYPE_MULTI
      # File writing plugin
      SND_PCM_TYPE_FILE
      # Null endpoint PCM
      SND_PCM_TYPE_NULL
      # Shared memory client PCM
      SND_PCM_TYPE_SHM
      # INET client PCM (not yet implemented)
      SND_PCM_TYPE_INET
      # Copying plugin
      SND_PCM_TYPE_COPY
      # Linear format conversion PCM
      SND_PCM_TYPE_LINEAR
      # A-Law format conversion PCM
      SND_PCM_TYPE_ALAW
      # Mu-Law format conversion PCM
      SND_PCM_TYPE_MULAW
      # IMA-ADPCM format conversion PCM
      SND_PCM_TYPE_ADPCM
      # Rate conversion PCM
      SND_PCM_TYPE_RATE
      # Attenuated static route PCM
      SND_PCM_TYPE_ROUTE
      # Format adjusted PCM
      SND_PCM_TYPE_PLUG
      # Sharing PCM
      SND_PCM_TYPE_SHARE
      # Meter plugin
      SND_PCM_TYPE_METER
      # Mixing PCM
      SND_PCM_TYPE_MIX
      # Attenuated dynamic route PCM (not yet implemented)
      SND_PCM_TYPE_DROUTE
      # Loopback server plugin (not yet implemented)
      SND_PCM_TYPE_LBSERVER
      # Linear Integer <-> Linear Float format conversion PCM
      SND_PCM_TYPE_LINEAR_FLOAT
      # LADSPA integration plugin
      SND_PCM_TYPE_LADSPA
      # Direct Mixing plugin
      SND_PCM_TYPE_DMIX
      # Jack Audio Connection Kit plugin
      SND_PCM_TYPE_JACK
      # Direct Snooping plugin
      SND_PCM_TYPE_DSNOOP
      # Direct Sharing plugin
      SND_PCM_TYPE_DSHARE
      # IEC958 subframe plugin
      SND_PCM_TYPE_IEC958
      # Soft volume plugin
      SND_PCM_TYPE_SOFTVOL
      # External I/O plugin
      SND_PCM_TYPE_IOPLUG
      # External filter plugin
      SND_PCM_TYPE_EXTPLUG
      # Mmap-emulation plugin
      SND_PCM_TYPE_MMAP_EMUL
      SND_PCM_TYPE_LAST = SND_PCM_TYPE_MMAP_EMUL
    end

    # PCM area specification
    struct SndPcmChannelAreaT
      # base address of channel samples
      addr : Void*
      # offset to first sample in bits
      first : UInt32
      # samples distance in bits
      step : UInt32
    end

    # PCM synchronization ID
    union SndPcmSyncIdT
      # 8-bit ID
      id : UInt8[16]
      # 16-bit ID
      id16 : UInt16[8]
      # 32-bit ID
      id32 : UInt32[4]
    end

    # SND_PCM_TYPE_METER scope handle
    alias SndPcmScopeT = Void*

    fun snd_pcm_open(pcm : SndPcmT*, name : UInt8*, stream : SndPcmStreamT, mode : Int32) : Int32
    fun snd_pcm_open_lconf(pcm : SndPcmT*, name : UInt8*, stream : SndPcmStreamT, mode : Int32, lconf : SndConfigT*) : Int32
    fun snd_pcm_open_fallback(pcm : SndPcmT*, root : SndConfigT*, name : UInt8*, orig_name : UInt8*, stream : SndPcmStreamT, mode : Int32) : Int32

    fun snd_pcm_close(pcm : SndPcmT) : Int32
    fun snd_pcm_name(pcm : SndPcmT) : UInt8*
    fun snd_pcm_type(pcm : SndPcmT) : SndPcmTypeT
    fun snd_pcm_stream(pcm : SndPcmT) : SndPcmStreamT
    fun snd_pcm_poll_descriptors_count(pcm : SndPcmT) : Int32

    # Data structure describing a polling request.
    struct Pollfd
      fd : Int32 # File descriptor to poll.
      events : Int32 # Types of events poller cares about.
      revents : Int32 # Types of events that actually occurred.
    end

    fun snd_pcm_poll_descriptors(pcm : SndPcmT, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_pcm_poll_descriptors_revents(pcm : SndPcmT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_pcm_nonblock(pcm : SndPcmT, nonblock : Int32) : Int32
    fun snd_async_add_pcm_handler(handler : SndAsyncHandlerT**, pcm : SndPcmT, callback : SndAsyncHandlerT, private_data : Void*) : Int32
    fun snd_async_handler_get_pcm(handler : SndAsyncHandlerT) : SndPcmT
    fun snd_pcm_info(pcm : SndPcmT, info : SndPcmInfoT) : Int32
    fun snd_pcm_hw_params_current(pcm : SndPcmT, params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params(pcm : SndPcmT, params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_free(pcm : SndPcmT) : Int32
    fun snd_pcm_sw_params_current(pcm : SndPcmT, params : SndPcmSwParamsT) : Int32
    fun snd_pcm_sw_params(pcm : SndPcmT, params : SndPcmSwParamsT) : Int32
    fun snd_pcm_prepare(pcm : SndPcmT) : Int32
    fun snd_pcm_reset(pcm : SndPcmT) : Int32
    fun snd_pcm_status(pcm : SndPcmT, status : SndPcmStatusT) : Int32
    fun snd_pcm_start(pcm : SndPcmT) : Int32
    fun snd_pcm_drop(pcm : SndPcmT) : Int32
    fun snd_pcm_drain(pcm : SndPcmT) : Int32
    fun snd_pcm_pause(pcm : SndPcmT, enable : Int32) : Int32
    fun snd_pcm_state(pcm : SndPcmT) : SndPcmStateT
    fun snd_pcm_hwsync(pcm : SndPcmT) : Int32
    fun snd_pcm_delay(pcm : SndPcmT, delayp : SndPcmSframesT*) : Int32
    fun snd_pcm_resume(pcm : SndPcmT) : Int32
    fun snd_pcm_htimestamp(pcm : SndPcmT, avail : SndPcmUframesT*, tstamp : SndHTimestampT*) : Int32
    fun snd_pcm_avail(pcm : SndPcmT) : SndPcmSframesT
    fun snd_pcm_avail_update(pcm : SndPcmT) : SndPcmSframesT
    fun snd_pcm_avail_delay(pcm : SndPcmT, availp : SndPcmSframesT*, delayp : SndPcmSframesT*) : Int32
    fun snd_pcm_rewindable(pcm : SndPcmT) : SndPcmSframesT
    fun snd_pcm_rewind(pcm : SndPcmT, frames : SndPcmUframesT*) : SndPcmSframesT
    fun snd_pcm_forwardable(pcm : SndPcmT) : SndPcmSframesT
    fun snd_pcm_forward(pcm : SndPcmT, frames : SndPcmUframesT*) : SndPcmSframesT
    fun snd_pcm_writei(pcm : SndPcmT, buffer : Void*, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_readi(pcm : SndPcmT, buffer : Void*, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_writen(pcm : SndPcmT, bufs : Void**, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_readn(pcm : SndPcmT, bufs : Void**, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_wait(pcm : SndPcmT, timeout : Int32) : Int32

    fun snd_pcm_link(pcm1 : SndPcmT, pcm2 : SndPcmT) : Int32
    fun snd_pcm_unlink(pcm : SndPcmT) : Int32

    # channel mapping API version number
    SND_CHMAP_API_VERSION = ((1 << 16) | (0 << 8) | 1)

    # channel map list type
    enum SndPcmChmapType
      SND_CHMAP_TYPE_NONE = 0 # unspecified channel position
      SND_CHMAP_TYPE_FIXED # fixed channel position
      SND_CHMAP_TYPE_VAR # freely swappable channel position
      SND_CHMAP_TYPE_PAIRED # pair-wise swappable channel position
      SND_CHMAP_TYPE_LAST = SND_CHMAP_TYPE_PAIRED # last entry
    end

    # channel positions
    enum SndPcmChmapPosition
      SND_CHMAP_UNKNOWN = 0 # unspecified
      SND_CHMAP_NA # N/A, silent
      SND_CHMAP_MONO # mono stream
      SND_CHMAP_FL # front left
      SND_CHMAP_FR # front right
      SND_CHMAP_RL # rear left
      SND_CHMAP_RR # rear right
      SND_CHMAP_FC, # front center
      SND_CHMAP_LFE # LFE
      SND_CHMAP_SL # side left
      SND_CHMAP_SR # side right
      SND_CHMAP_RC # rear center
      SND_CHMAP_FLC # front left center
      SND_CHMAP_FRC # front right center
      SND_CHMAP_RLC # rear left center
      SND_CHMAP_RRC # rear right center
      SND_CHMAP_FLW # front left wide
      SND_CHMAP_FRW # front right wide
      SND_CHMAP_FLH # front left high
      SND_CHMAP_FCH # front center high
      SND_CHMAP_FRH # front right high
      SND_CHMAP_TC # top center
      SND_CHMAP_TFL # top front left
      SND_CHMAP_TFR # top front right
      SND_CHMAP_TFC # top front center
      SND_CHMAP_TRL # top rear left
      SND_CHMAP_TRR # top rear right
      SND_CHMAP_TRC # top rear center
      SND_CHMAP_TFLC # top front left center
      SND_CHMAP_TFRC # top front right center
      SND_CHMAP_TSL # top side left
      SND_CHMAP_TSR # top side right
      SND_CHMAP_LLFE # left LFE
      SND_CHMAP_RLFE # right LFE
      SND_CHMAP_BC # bottom center
      SND_CHMAP_BLC # bottom left center
      SND_CHMAP_BRC # bottom right center
      SND_CHMAP_LAST = SND_CHMAP_BRC
    end

    # bitmask for channel position
    SND_CHMAP_POSITION_MASK = 0xffff

    # bit flag indicating the channel is phase inverted
    SND_CHMAP_PHASE_INVERSE = (0x01 << 16)
    # bit flag indicating the non-standard channel value
    SND_CHMAP_DRIVER_SPEC = (0x02 << 16)

    # the channel map header
    struct SndPcmChmapT
      channels : UInt32 # number of channels
      #pos : UInt32[0] # channel position array
    end

    # the header of array items returned from snd_pcm_query_chmaps()
    struct SndPcmChmapQueryT
      type : SndPcmChmapType # channel map type
      map : SndPcmChmapT #  available channel map
    end


    fun snd_pcm_query_chmaps(pcm : SndPcmT) : SndPcmChmapQueryT**
    fun snd_pcm_query_chmaps_from_hw(card : Int32, dev : Int32, subdev : Int32, stream : SndPcmStreamT) : SndPcmChmapQueryT**
    fun snd_pcm_free_chmaps(maps : SndPcmChmapQueryT**) : Void
    fun snd_pcm_get_chmap(pcm : SndPcmT) : SndPcmChmapT*
    fun snd_pcm_set_chmap(pcm : SndPcmT, map : SndPcmChmapT*) : Int32

    fun snd_pcm_chmap_type_name(val : SndPcmChmapType) : UInt8*
    fun snd_pcm_chmap_name(val : SndPcmChmapPosition) : UInt8*
    fun snd_pcm_chmap_long_name(val : SndPcmChmapPosition) : UInt8*
    fun snd_pcm_chmap_print(map : SndPcmChmapT*, maxlen : LibC::SizeT, buf : UInt8*) : Int32
    fun snd_pcm_chmap_from_string(str : UInt8*) : UInt32
    fun snd_pcm_chmap_parse_string(str : UInt8*) : SndPcmChmapT*

    #fun snd_pcm_mixer_element(pcm : SndPcmT, mixer : SndPcmMixerT, elem : SndMixerElemT**) : Int32

    # application helpers - these functions are implemented on top
    # of the basic API

    fun snd_pcm_recover(pcm : SndPcmT, err : Int32, silent : Int32) : Int32
    fun snd_pcm_set_params(pcm : SndPcmT, format : SndPcmFormatT, access : SndPcmAccessT, channels : UInt32, rate : UInt32, soft_resample : Int32, latency : UInt32) : Int32
    fun snd_pcm_get_params(pcm : SndPcmT, buffer_size : SndPcmUframesT*, period_size : SndPcmUframesT*) : Int32

    # PCM_Info Stream Information
    # PCM
    # See the \ref pcm page for more details.

    fun snd_pcm_info_sizeof() : LibC::SizeT

    fun snd_pcm_info_malloc(ptr : SndPcmInfoT*) : Int32
    fun snd_pcm_info_free(obj : SndPcmInfoT) : Void
    fun snd_pcm_info_copy(dst : SndPcmInfoT, src : SndPcmInfoT) : Void
    fun snd_pcm_info_get_device(obj : SndPcmInfoT) : UInt32
    fun snd_pcm_info_get_subdevice(obj : SndPcmInfoT) : UInt32
    fun snd_pcm_info_get_stream(obj : SndPcmInfoT) : SndPcmStreamT
    fun snd_pcm_info_get_card(obj : SndPcmInfoT) : Int32
    fun snd_pcm_info_get_id(obj : SndPcmInfoT) : UInt8*
    fun snd_pcm_info_get_name(obj : SndPcmInfoT) : UInt8*
    fun snd_pcm_info_get_subdevice_name(obj : SndPcmInfoT) : UInt8*
    fun snd_pcm_info_get_class(obj : SndPcmInfoT) : SndPcmClassT
    fun snd_pcm_info_get_subclass(obj : SndPcmInfoT) : SndPcmSubclassT
    fun snd_pcm_info_get_subdevices_count(obj : SndPcmInfoT) : UInt32
    fun snd_pcm_info_get_subdevices_avail(obj : SndPcmInfoT) : UInt32
    fun snd_pcm_info_get_sync(obj : SndPcmInfoT) : SndPcmSyncIdT
    fun snd_pcm_info_set_device(obj : SndPcmInfoT, val: UInt32) : Void
    fun snd_pcm_info_set_subdevice(obj : SndPcmInfoT, val : UInt32) : Void
    fun snd_pcm_info_set_stream(obj : SndPcmInfoT, val : SndPcmStreamT) : Void

    # PCM_HW_Params Hardware Parameters
    # PCM
    # See the pcm page for more details.

    fun snd_pcm_hw_params_any(pcm : SndPcmT, params : SndPcmHwParamsT) : Int32

    fun snd_pcm_hw_params_can_mmap_sample_resolution(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_double(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_batch(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_block_transfer(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_monotonic(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_can_overrange(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_can_pause(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_can_resume(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_half_duplex(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_is_joint_duplex(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_can_sync_start(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_can_disable_period_wakeup(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_supports_audio_wallclock_ts(params : SndPcmHwParamsT) : Int32 # deprecated, use audio_ts_type
    fun snd_pcm_hw_params_supports_audio_ts_type(params : SndPcmHwParamsT, type : Int32) : Int32
    fun snd_pcm_hw_params_get_rate_numden(params : SndPcmHwParamsT, rate_num : UInt32*, rate_den : UInt32*) : Int32
    fun snd_pcm_hw_params_get_sbits(params : SndPcmHwParamsT) : Int32
    fun snd_pcm_hw_params_get_fifo_size(params : SndPcmHwParamsT) : Int32

  {% if false %}
    alias SndPcmHwStrategyT = Void*

    # choices need to be sorted on ascending badness
    struct SndPcmHwStrategySimpleChoicesListT
      value : UInt32
      badness : UInt32
    end

    fun snd_pcm_hw_params_strategy(pcm : SndPcmT, params : SndPcmHwParamsT, strategy : SndPcmHwStrategyT, badness_min : UInt32, badness_max : UInt32) : Int32

    fun snd_pcm_hw_strategy_free(strategy : SndPcmHwStrategyT) : Void
    fun snd_pcm_hw_strategy_simple(strategyp : SndPcmHwStrategyT*, badness_min : UInt32, badness_max : UInt32) : Int32
    fun snd_pcm_hw_params_try_explain_failure(pcm : SndPcmT, fail : SndPcmHwParamsT, success : SndPcmHwParamsT, depth : UInt32, out : SndOutputT) : Int32
  {% end %}

    fun snd_pcm_hw_params_sizeof() : LibC::SizeT

    fun snd_pcm_hw_params_malloc(ptr : SndPcmHwParamsT*) : Int32
    fun snd_pcm_hw_params_free(obj : SndPcmHwParamsT) : Void
    fun snd_pcm_hw_params_copy(dst : SndPcmHwParamsT, src : SndPcmHwParamsT) : Void

    ALSA_LIBRARY_BUILD = false
    ALSA_PCM_OLD_HW_PARAMS_API = false
    ALSA_PCM_OLD_SW_PARAMS_API = false

  {% if !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_HW_PARAMS_API %}

    fun snd_pcm_hw_params_get_access(params : SndPcmHwParamsT, access : SndPcmAccessT*) : Int32
    fun snd_pcm_hw_params_test_access(pcm : SndPcmT, params : SndPcmHwParamsT, access : SndPcmAccessT) : Int32
    fun snd_pcm_hw_params_set_access(pcm : SndPcmT, params : SndPcmHwParamsT, access : SndPcmAccessT) : Int32
    fun snd_pcm_hw_params_set_access_first(pcm : SndPcmT, params : SndPcmHwParamsT, access : SndPcmAccessT*) : Int32
    fun snd_pcm_hw_params_set_access_last(pcm : SndPcmT, params : SndPcmHwParamsT, access : SndPcmAccessT*) : Int32
    fun snd_pcm_hw_params_set_access_mask(pcm : SndPcmT, params : SndPcmHwParamsT, mask : SndPcmAccessMaskT) : Int32
    fun snd_pcm_hw_params_get_access_mask(params : SndPcmHwParamsT, mask : SndPcmAccessMaskT) : Int32

    fun snd_pcm_hw_params_get_format(params : SndPcmHwParamsT, val : SndPcmFormatT) : Int32
    fun snd_pcm_hw_params_test_format(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmFormatT) : Int32
    fun snd_pcm_hw_params_set_format(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmFormatT) : Int32
    fun snd_pcm_hw_params_set_format_first(pcm : SndPcmT, params : SndPcmHwParamsT, format : SndPcmFormatT*) : Int32
    fun snd_pcm_hw_params_set_format_last(pcm : SndPcmT, params : SndPcmHwParamsT, format : SndPcmFormatT*) : Int32
    fun snd_pcm_hw_params_set_format_mask(pcm : SndPcmT, params : SndPcmHwParamsT, mask : SndPcmFormatMaskT) : Int32
    fun snd_pcm_hw_params_get_format_mask(params : SndPcmHwParamsT, mask : SndPcmFormatMaskT) : Void

    fun snd_pcm_hw_params_get_subformat(params : SndPcmHwParamsT, subformat : SndPcmSubformatT*) : Int32
    fun snd_pcm_hw_params_test_subformat(pcm : SndPcmT, params : SndPcmHwParamsT, subformat : SndPcmSubformatT) : Int32
    fun snd_pcm_hw_params_set_subformat(pcm : SndPcmT, params : SndPcmHwParamsT, subformat : SndPcmSubformatT) : Int32
    fun snd_pcm_hw_params_set_subformat_first(pcm : SndPcmT, params : SndPcmHwParamsT, subformat : SndPcmSubformatT*) : Int32
    fun snd_pcm_hw_params_set_subformat_last(pcm : SndPcmT, params : SndPcmHwParamsT, subformat : SndPcmSubformatT*) : Int32
    fun snd_pcm_hw_params_set_subformat_mask(pcm : SndPcmT, params : SndPcmHwParamsT, mask : SndPcmSubformatMaskT) : Int32
    fun snd_pcm_hw_params_get_subformat_mask(params : SndPcmHwParamsT, mask : SndPcmSubformatMaskT) : Void

    fun snd_pcm_hw_params_get_channels(params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_get_channels_min(params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_get_channels_max(params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_test_channels(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32) : Int32
    fun snd_pcm_hw_params_set_channels_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, max : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_channels_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32

    fun snd_pcm_hw_params_get_rate(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_rate_min(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_rate_max(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_rate(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_rate(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_rate_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, mindir : Int32*, max : UInt32*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_rate_resample(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32) : Int32
    fun snd_pcm_hw_params_get_rate_resample(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_export_buffer(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32) : Int32
    fun snd_pcm_hw_params_get_export_buffer(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32
    fun snd_pcm_hw_params_set_period_wakeup(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32) : Int32
    fun snd_pcm_hw_params_get_period_wakeup(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*) : Int32

    fun snd_pcm_hw_params_get_period_time(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_period_time_min(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_period_time_max(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_period_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_period_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_period_time_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_time_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_time_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, mindir : Int32*, max : UInt32*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_time_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_time_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_time_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32

    fun snd_pcm_hw_params_get_period_size(params : SndPcmHwParamsT, frames : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_period_size_min(params : SndPcmHwParamsT, frames : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_period_size_max(params : SndPcmHwParamsT, frames : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_period_size(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_period_size(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_period_size_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_max(pcm : SndPcmT, param : SndPcmHwParamsT, val : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : SndPcmUframesT*, mindir : Int32*, max : SndPcmUframesT*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_period_size_integer(pcm : SndPcmT, params : SndPcmHwParamsT) : Int32

    fun snd_pcm_hw_params_get_periods(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_periods_min(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_periods_max(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_periods(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_periods(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_periods_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, mindir : Int32*, max : UInt32*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_periods_integer(pcm : SndPcmT, params : SndPcmHwParamsT) : Int32

    fun snd_pcm_hw_params_get_buffer_time(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_buffer_time_min(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_buffer_time_max(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_buffer_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_buffer_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_buffer_time_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_buffer_time_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_buffer_time_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, mindir : Int32*, max : UInt32*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_buffer_time_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_buffer_time_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_buffer_time_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32

    fun snd_pcm_hw_params_get_buffer_size(params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_get_buffer_size_min(params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_get_buffer_size_max(params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_test_buffer_size(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_hw_params_set_buffer_size(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_hw_params_set_buffer_size_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_set_buffer_size_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_set_buffer_size_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : SndPcmUframesT*, max : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_set_buffer_size_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_set_buffer_size_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_hw_params_set_buffer_size_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32

  {% end %} # !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_HW_PARAMS_API

    fun snd_pcm_hw_params_get_min_align(params : SndPcmHwParamsT, val : SndPcmUframesT*) : Int32

    # PCM_SW_Params Software Parameters

    fun snd_pcm_sw_params_sizeof() : LibC::SizeT

    fun snd_pcm_sw_params_malloc(ptr : SndPcmSwParamsT**) : Int32
    fun snd_pcm_sw_params_free(obj : SndPcmSwParamsT*) : Void
    fun snd_pcm_sw_params_copy(dst : SndPcmSwParamsT*, src : SndPcmSwParamsT*) : Void
    fun snd_pcm_sw_params_get_boundary(params : SndPcmSwParamsT*, val : SndPcmUframesT*) : Int32

  {% if !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_SW_PARAMS_API %}

    fun snd_pcm_sw_params_set_tstamp_mode(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmTstampT) : Int32
    fun snd_pcm_sw_params_get_tstamp_mode(params : SndPcmSwParamsT, val : SndPcmTstampT*) : Int32
    fun snd_pcm_sw_params_set_tstamp_type(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmTstampT) : Int32
    fun snd_pcm_sw_params_get_tstamp_type(params : SndPcmSwParamsT, val : SndPcmTstampT*) : Int32
    fun snd_pcm_sw_params_set_avail_min(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_sw_params_get_avail_min(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_set_period_event(pcm : SndPcmT, params : SndPcmSwParamsT, val : Int32) : Int32
    fun snd_pcm_sw_params_get_period_event(params : SndPcmSwParamsT, val : Int32*) : Int32
    fun snd_pcm_sw_params_set_start_threshold(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_get_start_threshold(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_set_stop_threshold(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_sw_params_get_stop_threshold(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_set_silence_threshold(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_sw_params_get_silence_threshold(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_set_silence_size(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_sw_params_get_silence_size(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32

  {% end %} # !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_HW_PARAMS_API

    # PCM_Access Access Mask Functions
    fun snd_pcm_access_mask_sizeof() : LibC::SizeT
    fun snd_pcm_access_mask_malloc(ptr : SndPcmAccessMaskT*) : Int32
    fun snd_pcm_access_mask_free(obj : SndPcmAccessMaskT) : Void
    fun snd_pcm_access_mask_copy(dst : SndPcmAccessMaskT, src : SndPcmAccessMaskT) : Void
    fun snd_pcm_access_mask_none(mask : SndPcmAccessMaskT) : Void
    fun snd_pcm_access_mask_any(mask : SndPcmAccessMaskT) : Void
    fun snd_pcm_access_mask_test(mask : SndPcmAccessMaskT, val : SndPcmAccessT) : Int32
    fun snd_pcm_access_mask_empty(mask : SndPcmAccessMaskT) : Int32
    fun snd_pcm_access_mask_set(mask : SndPcmAccessMaskT, val : SndPcmAccessT) : Void
    fun snd_pcm_access_mask_reset(mask : SndPcmAccessMaskT, val : SndPcmAccessT) : Void

    # PCM_Format Format Mask Functions
    fun snd_pcm_format_mask_sizeof() : LibC::SizeT
    fun snd_pcm_format_mask_malloc(ptr : SndPcmFormatMaskT*) : Int32
    fun snd_pcm_format_mask_free(obj : SndPcmFormatMaskT) : Void
    fun snd_pcm_format_mask_copy(dst : SndPcmFormatMaskT, src : SndPcmFormatMaskT) : Void
    fun snd_pcm_format_mask_none(mask : SndPcmFormatMaskT) : Void
    fun snd_pcm_format_mask_any(mask : SndPcmFormatMaskT) : Void
    fun snd_pcm_format_mask_test(mask : SndPcmFormatMaskT, val : SndPcmFormatT) : Int32
    fun snd_pcm_format_mask_empty(mask : SndPcmFormatMaskT) : Int32
    fun snd_pcm_format_mask_set(mask : SndPcmFormatMaskT, val : SndPcmFormatT) : Void
    fun snd_pcm_format_mask_reset(mask : SndPcmFormatMaskT, val : SndPcmFormatT) : Void

    # PCM_SubFormat Subformat Mask Functions
    fun snd_pcm_subformat_mask_sizeof() : LibC::SizeT
    fun snd_pcm_subformat_mask_malloc(ptr : SndPcmSubformatMaskT*) : Int32
    fun snd_pcm_subformat_mask_free(obj : SndPcmSubformatMaskT) : Void
    fun snd_pcm_subformat_mask_copy(dst : SndPcmSubformatMaskT, src : SndPcmSubformatMaskT) : Void
    fun snd_pcm_subformat_mask_none(mask : SndPcmSubformatMaskT) : Void
    fun snd_pcm_subformat_mask_any(mask : SndPcmSubformatMaskT) : Void
    fun snd_pcm_subformat_mask_test(mask : SndPcmSubformatMaskT, val : SndPcmSubformatT) : Int32
    fun snd_pcm_subformat_mask_empty(mask : SndPcmSubformatMaskT) : Int32
    fun snd_pcm_subformat_mask_set(mask : SndPcmSubformatMaskT, val : SndPcmSubformatT) : Void
    fun snd_pcm_subformat_mask_reset(mask : SndPcmSubformatMaskT, val : SndPcmSubformatT) : Void

    #PCM_Status Status Functions
    fun snd_pcm_status_sizeof() : LibC::SizeT
    fun snd_pcm_status_malloc(ptr : SndPcmStatusT*) : Int32
    fun snd_pcm_status_free(obj : SndPcmStatusT) : Void
    fun snd_pcm_status_copy(dst : SndPcmStatusT, src : SndPcmStatusT) : Void
    fun snd_pcm_status_get_state(obj : SndPcmStatusT) : SndPcmStateT
    fun snd_pcm_status_get_trigger_tstamp(obj : SndPcmStatusT, ptr : SndTimestampT*) : Void
    fun snd_pcm_status_get_trigger_htstamp(obj : SndPcmStatusT, ptr : SndHTimestampT*) : Void
    fun snd_pcm_status_get_tstamp(obj : SndPcmStatusT, ptr : SndTimestampT*) : Void
    fun snd_pcm_status_get_htstamp(obj : SndPcmStatusT, ptr : SndHTimestampT*) : Void
    fun snd_pcm_status_get_audio_htstamp(obj : SndPcmStatusT, ptr : SndHTimestampT*) : Void
    fun snd_pcm_status_get_driver_htstamp(obj : SndPcmStatusT, ptr : SndHTimestampT*) : Void
    fun snd_pcm_status_get_audio_htstamp_report(obj : SndPcmStatusT, audio_tstamp_report : SndPcmAudioTstampReportT*) : Void
    fun snd_pcm_status_set_audio_htstamp_config(obj : SndPcmStatusT, audio_tstamp_config : SndPcmAudioTstampConfigT*) : Void
    fun snd_pcm_status_get_delay(obj : SndPcmStatusT) : SndPcmSframesT
    fun snd_pcm_status_get_avail(obj : SndPcmStatusT) : SndPcmUframesT
    fun snd_pcm_status_get_avail_max(obj : SndPcmStatusT) : SndPcmUframesT
    fun snd_pcm_status_get_overrange(obj : SndPcmStatusT) : SndPcmUframesT

    # PCM_Description Description Functions
    fun snd_pcm_type_name(type : SndPcmTypeT) : UInt8*
    fun snd_pcm_stream_name(stream : SndPcmStreamT) : UInt8*
    fun snd_pcm_access_name(access : SndPcmAccessT) : UInt8*
    fun snd_pcm_format_name(format : SndPcmFormatT) : UInt8*
    fun snd_pcm_format_description(format : SndPcmFormatT) : UInt8*
    fun snd_pcm_subformat_name(subformat : SndPcmSubformatT) : UInt8*
    fun snd_pcm_subformat_description(subformat : SndPcmSubformatT) : UInt8*
    fun snd_pcm_format_value(name : UInt8*) : SndPcmFormatT
    fun snd_pcm_tstamp_mode_name(mode : SndPcmTstampT) : UInt8*
    fun snd_pcm_state_name(state : SndPcmStateT) : UInt8*

    # PCM_Dump Debug Functions
    fun snd_pcm_dump(pcm : SndPcmT, out : SndOutputT) : Int32
    fun snd_pcm_dump_hw_setup(pcm : SndPcmT, out : SndOutputT) : Int32
    fun snd_pcm_dump_sw_setup(pcm : SndPcmT, out : SndOutputT) : Int32
    fun snd_pcm_dump_setup(pcm : SndPcmT, out : SndOutputT) : Int32
    fun snd_pcm_hw_params_dump(params : SndPcmHwParamsT, out : SndOutputT) : Int32
    fun snd_pcm_sw_params_dump(params : SndPcmSwParamsT, out : SndOutputT) : Int32
    fun snd_pcm_status_dump(status : SndPcmStatusT*, out : SndOutputT) : Int32

    # PCM_Direct Direct Access (MMAP) Functions
    fun snd_pcm_mmap_begin(pcm : SndPcmT, areas : SndPcmChannelAreaT**, offset : SndPcmUframesT*, frames : SndPcmUframesT*) : Int32
    fun snd_pcm_mmap_commit(pcm : SndPcmT, offset : SndPcmUframesT, frames : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_mmap_writei(pcm : SndPcmT, buffer : Void*, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_mmap_readi(pcm : SndPcmT, buffer : Void*, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_mmap_writen(pcm : SndPcmT, bufs : Void**, size : SndPcmUframesT) : SndPcmSframesT
    fun snd_pcm_mmap_readn(pcm : SndPcmT, bufs : Void**, size : SndPcmUframesT) : SndPcmSframesT

    # PCM_Helpers Helper Functions
    fun snd_pcm_format_signed(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_unsigned(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_linear(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_float(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_little_endian(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_big_endian(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_cpu_endian(format : SndPcmFormatT) : Int32
    fun snd_pcm_format_width(format : SndPcmFormatT) : Int32 # in bits
    fun snd_pcm_format_physical_width(format : SndPcmFormatT) : Int32 # in bits
    fun snd_pcm_build_linear_format(width : Int32, pwidth : Int32, unsignd : Int32, big_endian : Int32) : SndPcmFormatT
    fun snd_pcm_format_size(format : SndPcmFormatT, samples : LibC::SizeT) : LibC::SSizeT
    fun snd_pcm_format_silence(format : SndPcmFormatT) : UInt8
    fun snd_pcm_format_silence_16(format : SndPcmFormatT) : UInt16
    fun snd_pcm_format_silence_32(format : SndPcmFormatT) : UInt32
    fun snd_pcm_format_silence_64(format : SndPcmFormatT) : UInt64
    fun snd_pcm_format_set_silence(format : SndPcmFormatT, buf : Void*, samples : UInt32) : Int32

    fun snd_pcm_bytes_to_frames(pcm : SndPcmT, bytes : LibC::SSizeT) : SndPcmSframesT
    fun snd_pcm_frames_to_bytes(pcm : SndPcmT, frames : SndPcmSframesT) : LibC::SSizeT
    fun snd_pcm_bytes_to_samples(pcm : SndPcmT, bytes : LibC::SSizeT) : LibC::Long
    fun snd_pcm_samples_to_bytes(pcm : SndPcmT, samples : LibC::Long) : LibC::SSizeT

    fun snd_pcm_area_silence(dst_channel : SndPcmChannelAreaT*, dst_offset : SndPcmUframesT, samples : UInt32, format : SndPcmFormatT) : Int32
    fun snd_pcm_areas_silence(dst_channels : SndPcmChannelAreaT*, dst_offset : SndPcmUframesT, channels : UInt32, frames : SndPcmUframesT, format : SndPcmFormatT) : Int32
    fun snd_pcm_area_copy(dst_channel : SndPcmChannelAreaT*, dst_offset : SndPcmUframesT, src_channel : SndPcmChannelAreaT*, src_offset : SndPcmUframesT, samples : UInt32, format : SndPcmFormatT) : Int32
    fun snd_pcm_areas_copy(dst_channels : SndPcmChannelAreaT*, dst_offset : SndPcmUframesT, src_channels : SndPcmChannelAreaT*, src_offset : SndPcmUframesT, channels : UInt32, frames : SndPcmUframesT, format : SndPcmFormatT) : Int32

    # PCM_Hook Hook Extension

    # type of pcm hook
    enum SndPcmHookTypeT
      SND_PCM_HOOK_TYPE_HW_PARAMS = 0
      SND_PCM_HOOK_TYPE_HW_FREE
      SND_PCM_HOOK_TYPE_CLOSE
      SND_PCM_HOOK_TYPE_LAST = SND_PCM_HOOK_TYPE_CLOSE
    end

    # PCM hook container
    alias SndPcmHookT = Void*

    # PCM hook callback function
    alias SndPcmHookFuncT = SndPcmHookT -> Int32

    fun snd_pcm_hook_get_pcm(hook : SndPcmHookT) : SndPcmT
    fun snd_pcm_hook_get_private(hook : SndPcmHookT) : Void*
    fun snd_pcm_hook_set_private(hook : SndPcmHookT, private_data : Void*): Void
    fun snd_pcm_hook_add(hookp : SndPcmHookT*, pcm : SndPcmT, type : SndPcmHookTypeT, func : SndPcmHookFuncT, private_data : Void*) : Int32
    fun snd_pcm_hook_remove(hook : SndPcmHookT) : Int32

    # PCM_Scope Scope Plugin Extension

    # SND_PCM_TYPE_METER scope functions
    struct SndPcmScopeOpsT
      # Enable and prepare it using current params
      enable : SndPcmScopeT -> Int32

      #Disable
      disable : SndPcmScopeT -> Void

      # PCM has been started
      start : SndPcmScopeT -> Void

      # PCM has been stopped
      stop : SndPcmScopeT -> Void

      # New frames are present
      update : SndPcmScopeT -> Void

      # Reset status
      reset : SndPcmScopeT -> Void

      # PCM is closing
      close : SndPcmScopeT -> Void
    end

    fun snd_pcm_meter_get_bufsize(pcm : SndPcmT) : SndPcmUframesT
    fun snd_pcm_meter_get_channels(pcm : SndPcmT) : UInt32
    fun snd_pcm_meter_get_rate(pcm : SndPcmT) : UInt32
    fun snd_pcm_meter_get_now(pcm : SndPcmT) : SndPcmUframesT
    fun snd_pcm_meter_get_boundary(pcm : SndPcmT) : SndPcmUframesT
    fun snd_pcm_meter_add_scope(pcm : SndPcmT, scope : SndPcmScopeT) : Int32
    fun snd_pcm_meter_search_scope(pcm : SndPcmT, name : UInt8*) : SndPcmScopeT
    fun snd_pcm_scope_malloc(ptr : SndPcmScopeT*) : Int32
    fun snd_pcm_scope_set_ops(scope : SndPcmScopeT, val : SndPcmScopeOpsT*) : Void
    fun snd_pcm_scope_set_name(scope : SndPcmScopeT, val : UInt8*) : Void
    fun snd_pcm_scope_get_name(scope : SndPcmScopeT) : UInt8*
    fun snd_pcm_scope_get_callback_private(scope : SndPcmScopeT) : Void*
    fun snd_pcm_scope_set_callback_private(scope : SndPcmScopeT, val : Void*) : Void
    fun snd_pcm_scope_s16_open(pcm : SndPcmT, name : UInt8*, scopep : SndPcmScopeT*) : Int32
    fun snd_pcm_scope_s16_get_channel_buffer(scope : SndPcmScopeT, channel : UInt32) : Int16*

    # PCM_Simple Simple setup functions

    # Simple PCM latency type
    enum SndSPcmLatencyT
      # standard latency - for standard playback or capture
      # (estimated latency in one direction 350ms)
      SND_SPCM_LATENCY_STANDARD = 0

      # medium latency - software phones etc.
      # (estimated latency in one direction maximally 25ms
      SND_SPCM_LATENCY_MEDIUM

      # realtime latency - realtime applications (effect processors etc.)
      # (estimated latency in one direction 5ms and better)
      SND_SPCM_LATENCY_REALTIME
    end

    # Simple PCM xrun type
    enum SndSPcmXrunTypeT
      # driver / library will ignore all xruns, the stream runs forever
      SND_SPCM_XRUN_IGNORE = 0

      # driver / library stops the stream when an xrun occurs
      SND_SPCM_XRUN_STOP
    end

    # Simple PCM duplex type
    enum SndSPcmDuplexTypeT
      # liberal duplex - the buffer and period sizes might not match
      SND_SPCM_DUPLEX_LIBERAL = 0

      # pedantic duplex - the buffer and period sizes MUST match
      SND_SPCM_DUPLEX_PEDANTIC
    end

    fun snd_spcm_init(pcm : SndPcmT, rate : UInt32,
        channels : UInt32, format : SndPcmFormatT,
        subformat : SndPcmSubformatT, latency : SndSPcmLatencyT,
        access : SndPcmAccessT, xrun_type : SndSPcmXrunTypeT) : Int32

    fun snd_spcm_init_duplex(playback_pcm : SndPcmT,
        capture_pcm : SndPcmT, rate : UInt32,
        channels : UInt32, format : SndPcmFormatT,
        subformat : SndPcmSubformatT, latency : SndSPcmLatencyT,
        access : SndPcmAccessT, xrun_type : SndSPcmXrunTypeT,
        duplex_type : SndSPcmDuplexTypeT) : Int32

    fun snd_spcm_init_get_params(pcm : SndPcmT,
        rate : UInt32*, buffer_size : SndPcmUframesT*,
        period_size : SndPcmUframesT*) : Int32

    # PCM_Deprecated Deprecated Functions

    # Deprecated functions, for compatibility
    fun snd_pcm_start_mode_name(mode : SndPcmStartT) : UInt8*
    fun snd_pcm_xrun_mode_name(mode : SndPcmXrunT) : UInt8*
    fun snd_pcm_sw_params_set_start_mode(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmStartT) : Int32
    fun snd_pcm_sw_params_get_start_mode(params : SndPcmSwParamsT) : SndPcmStartT
    fun snd_pcm_sw_params_set_xrun_mode(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmXrunT) : Int32
    fun snd_pcm_sw_params_get_xrun_mode(params : SndPcmSwParamsT) : SndPcmXrunT
  {% if !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_SW_PARAMS_API %}
    fun snd_pcm_sw_params_set_xfer_align(pcm : SndPcmT, params : SndPcmSwParamsT, val : SndPcmUframesT) : Int32
    fun snd_pcm_sw_params_get_xfer_align(params : SndPcmSwParamsT, val : SndPcmUframesT*) : Int32
    fun snd_pcm_sw_params_set_sleep_min(pcm : SndPcmT, params : SndPcmSwParamsT, val : UInt32) : Int32
    fun snd_pcm_sw_params_get_sleep_min(params : SndPcmSwParamsT, val : UInt32*) : Int32
  {% end %} # !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_SW_PARAMS_API
  {% if !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_HW_PARAMS_API %}
    fun snd_pcm_hw_params_get_tick_time(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_tick_time_min(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_get_tick_time_max(params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_test_tick_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_tick_time(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32, dir : Int32) : Int32
    fun snd_pcm_hw_params_set_tick_time_min(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_tick_time_max(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_tick_time_minmax(pcm : SndPcmT, params : SndPcmHwParamsT, min : UInt32*, mindir : Int32*, max : UInt32*, maxdir : Int32*) : Int32
    fun snd_pcm_hw_params_set_tick_time_near(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_tick_time_first(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
    fun snd_pcm_hw_params_set_tick_time_last(pcm : SndPcmT, params : SndPcmHwParamsT, val : UInt32*, dir : Int32*) : Int32
  {% end %} # !ALSA_LIBRARY_BUILD && !ALSA_PCM_OLD_HW_PARAMS_API
  end

  @[AlwaysInline]
  def self.snd_pcm_abort(pcm : SndPcmT) : Int32
    ASound.snd_pcm_nonblock(pcm, 2)
  end

  @[AlwaysInline]
  def self.snd_pcm_hw_params_alloca : ASound::SndPcmHwParamsT
    LibC.malloc(ASound.snd_pcm_hw_params_sizeof).as(ASound::SndPcmHwParamsT)
  end
end
