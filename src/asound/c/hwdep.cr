module ALSA::C
  @[Link("asound")]
  lib ASound
    # HwDep Hardware Dependant Interface

    # HwDep information container
    alias SndHwdepInfoT = Void*

    # HwDep DSP status container
    alias SndHwdepDspStatusT = Void*

    # HwDep DSP image container
    alias SndHwdepDspImageT = Void*

    # HwDep interface
    enum SndHwdepIfaceT
      SND_HWDEP_IFACE_OPL2 = 0 # OPL2 raw driver
      SND_HWDEP_IFACE_OPL3 # OPL3 raw driver
      SND_HWDEP_IFACE_OPL4 # OPL4 raw driver
      SND_HWDEP_IFACE_SB16CSP # SB16CSP driver
      SND_HWDEP_IFACE_EMU10K1 # EMU10K1 driver
      SND_HWDEP_IFACE_YSS225 # YSS225 driver
      SND_HWDEP_IFACE_ICS2115 # ICS2115 driver
      SND_HWDEP_IFACE_SSCAPE # Ensoniq SoundScape ISA card (MC68EC000)
      SND_HWDEP_IFACE_VX # Digigram VX cards
      SND_HWDEP_IFACE_MIXART # Digigram miXart cards
      SND_HWDEP_IFACE_USX2Y # Tascam US122, US224 & US428 usb
      SND_HWDEP_IFACE_EMUX_WAVETABLE # EmuX wavetable
      SND_HWDEP_IFACE_BLUETOOTH # Bluetooth audio
      SND_HWDEP_IFACE_USX2Y_PCM # Tascam US122, US224 & US428 raw USB PCM
      SND_HWDEP_IFACE_PCXHR # Digigram PCXHR
      SND_HWDEP_IFACE_SB_RC # SB Extigy/Audigy2NX remote control
      SND_HWDEP_IFACE_HDA # HD-audio
      SND_HWDEP_IFACE_USB_STREAM # direct access to usb stream
      SND_HWDEP_IFACE_FW_DICE # TC DICE FireWire device
      SND_HWDEP_IFACE_FW_FIREWORKS # Echo Audio Fireworks based device
      SND_HWDEP_IFACE_FW_BEBOB # BridgeCo BeBoB based device
      SND_HWDEP_IFACE_FW_OXFW # Oxford OXFW970/971 based device
      SND_HWDEP_IFACE_FW_DIGI00X # Digidesign Digi 002/003 family
      SND_HWDEP_IFACE_FW_TASCAM # TASCAM FireWire series

      SND_HWDEP_IFACE_LAST = SND_HWDEP_IFACE_FW_TASCAM # last known hwdep interface
    end

    # open for reading
    SND_HWDEP_OPEN_READ = LibC::O_RDONLY
    # open for writing
    SND_HWDEP_OPEN_WRITE  = LibC::O_WRONLY
    # open for reading and writing
    SND_HWDEP_OPEN_DUPLEX = LibC::O_RDWR
    # open mode flag: open in nonblock mode
    SND_HWDEP_OPEN_NONBLOCK = LibC::O_NONBLOCK

    # HwDep handle type
    enum SndHwdepTypeT
      # Kernel level HwDep
      SND_HWDEP_TYPE_HW
      # Shared memory client HwDep (not yet implemented)
      SND_HWDEP_TYPE_SHM
      # INET client HwDep (not yet implemented)
      SND_HWDEP_TYPE_INET
    end

    # HwDep handle
    alias SndHwdepT = Void*

    fun snd_hwdep_open(hwdep : SndHwdepT*, name : UInt8*, mode : Int32) : Int32
    fun snd_hwdep_close(hwdep : SndHwdepT*) : Int32
    fun snd_hwdep_poll_descriptors(hwdep : SndHwdepT*, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_hwdep_poll_descriptors_count(hwdep : SndHwdepT*) : Int32
    fun snd_hwdep_poll_descriptors_revents(hwdep : SndHwdepT*, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_hwdep_nonblock(hwdep : SndHwdepT*, nonblock : Int32) : Int32
    fun snd_hwdep_info(hwdep : SndHwdepT*, info : SndHwdepInfoT) : Int32
    fun snd_hwdep_dsp_status(hwdep : SndHwdepT*, status : SndHwdepDspStatusT) : Int32
    fun snd_hwdep_dsp_load(hwdep : SndHwdepT*, block : SndHwdepDspImageT) : Int32
    fun snd_hwdep_ioctl(hwdep : SndHwdepT*, request : UInt32, arg : Void*) : Int32
    fun snd_hwdep_write(hwdep : SndHwdepT*, buffer : Void*, size : LibC::SizeT) : LibC::SSizeT
    fun snd_hwdep_read(hwdep : SndHwdepT*, buffer : Void*, size : LibC::SizeT) : LibC::SSizeT

    fun snd_hwdep_info_sizeof() : LibC::SizeT
    fun snd_hwdep_info_malloc(ptr : SndHwdepInfoT*) : Int32
    fun snd_hwdep_info_free(obj : SndHwdepInfoT) : Void
    fun snd_hwdep_info_copy(dst : SndHwdepInfoT, src : SndHwdepInfoT) : Void

    fun snd_hwdep_info_get_device(obj : SndHwdepInfoT) : UInt32
    fun snd_hwdep_info_get_card(obj : SndHwdepInfoT) : Int32
    fun snd_hwdep_info_get_id(obj : SndHwdepInfoT) : UInt8*
    fun snd_hwdep_info_get_name(obj : SndHwdepInfoT) : UInt8*
    fun snd_hwdep_info_get_iface(obj : SndHwdepInfoT) : SndHwdepIfaceT
    fun snd_hwdep_info_set_device(obj : SndHwdepInfoT, val : UInt32) : Void

    fun snd_hwdep_dsp_status_sizeof() : LibC::SizeT
    fun snd_hwdep_dsp_status_malloc(ptr : SndHwdepDspStatusT*) : Int32
    fun snd_hwdep_dsp_status_free(obj : SndHwdepDspStatusT) : Void
    fun snd_hwdep_dsp_status_copy(dst : SndHwdepDspStatusT, src : SndHwdepDspStatusT) : Void

    fun snd_hwdep_dsp_status_get_version(obj : SndHwdepDspStatusT) : UInt32
    fun snd_hwdep_dsp_status_get_id(obj : SndHwdepDspStatusT) : UInt8*
    fun snd_hwdep_dsp_status_get_num_dsps(obj : SndHwdepDspStatusT) : UInt32
    fun snd_hwdep_dsp_status_get_dsp_loaded(obj : SndHwdepDspStatusT) : UInt32
    fun snd_hwdep_dsp_status_get_chip_ready(obj : SndHwdepDspStatusT) : UInt32

    fun snd_hwdep_dsp_image_sizeof() : LibC::SizeT
    fun snd_hwdep_dsp_image_malloc(ptr : SndHwdepDspImageT*) : Int32
    fun snd_hwdep_dsp_image_free(obj : SndHwdepDspImageT) : Void
    fun snd_hwdep_dsp_image_copy(dst : SndHwdepDspImageT, src : SndHwdepDspImageT) : Void

    fun snd_hwdep_dsp_image_get_index(obj : SndHwdepDspImageT) : UInt32
    fun snd_hwdep_dsp_image_get_name(obj : SndHwdepDspImageT) : UInt8*
    fun snd_hwdep_dsp_image_get_image(obj : SndHwdepDspImageT) : Void*
    fun snd_hwdep_dsp_image_get_length(obj : SndHwdepDspImageT) : LibC::SizeT

    fun snd_hwdep_dsp_image_set_index(obj : SndHwdepDspImageT, index : UInt32) : Void
    fun snd_hwdep_dsp_image_set_name(obj : SndHwdepDspImageT, name : UInt8*) : Void
    fun snd_hwdep_dsp_image_set_image(obj : SndHwdepDspImageT, buffer : Void*) : Void
    fun snd_hwdep_dsp_image_set_length(obj : SndHwdepDspImageT, length : LibC::SizeT) : Void
  end

  @[AlwaysInline]
  def self.snd_hwdep_info_alloca : ASound::SndHwdepInfoT
    LibC.malloc(ASound.snd_hwdep_info_sizeof).as(ASound::SndHwdepInfoT)
  end

  @[AlwaysInline]
  def self.snd_hwdep_dsp_status_alloca : ASound::SndHwdepDspStatusT
    LibC.malloc(ASound.snd_hwdep_dsp_status_sizeof).as(ASound::SndHwdepDspStatusT)
  end

  @[AlwaysInline]
  def self.snd_hwdep_dsp_image_alloca : ASound::SndHwdepDspImageT
    LibC.malloc(ASound.snd_hwdep_dsp_image_sizeof).as(ASound::SndHwdepDspImageT)
  end
end
