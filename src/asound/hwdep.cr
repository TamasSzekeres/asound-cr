module ALSA
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
  end
end
