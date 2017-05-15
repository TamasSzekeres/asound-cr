module ALSA
  @[Link("asound")]
  lib ASound
    # IEC958 structure
    struct SndAesIec958T
      status : UInt8[24] # AES/IEC958 channel status bits
      subcode : UInt8[147] # AES/IEC958 subcode bits
      pad : UInt8 # nothing
      dig_subframe : UInt8[4] # AES/IEC958 subframe bits
    end

    # CTL card info container
    alias SndCtlCardInfoT = Void*

    # CTL element identifier container
    alias SndCtlElemIdT = Void*

    # CTL element identifier list container
    alias SndCtlElemListT = Void*

    # CTL element info container
    alias SndCtlElemInfoT = Void*

    # CTL element value container
    alias SndCtlElemValueT = Void*

    # CTL event container
    alias SndCtlEventT = Void*

    # CTL element type
    enum SndCtlElemTypeT
      # Invalid type
      SND_CTL_ELEM_TYPE_NONE = 0
      # Boolean contents
      SND_CTL_ELEM_TYPE_BOOLEAN
      # Integer contents
      SND_CTL_ELEM_TYPE_INTEGER
      # Enumerated contents
      SND_CTL_ELEM_TYPE_ENUMERATED
      # Bytes contents
      SND_CTL_ELEM_TYPE_BYTES
      # IEC958 (S/PDIF) setting content
      SND_CTL_ELEM_TYPE_IEC958
      # 64-bit integer contents
      SND_CTL_ELEM_TYPE_INTEGER64
      SND_CTL_ELEM_TYPE_LAST = SND_CTL_ELEM_TYPE_INTEGER64
    end

    # CTL related interface
    enum SndCtlElemIfaceT
      # Card level
      SND_CTL_ELEM_IFACE_CARD = 0
      # Hardware dependent device
      SND_CTL_ELEM_IFACE_HWDEP
      # Mixer
      SND_CTL_ELEM_IFACE_MIXER
      # PCM
      SND_CTL_ELEM_IFACE_PCM
      # RawMidi
      SND_CTL_ELEM_IFACE_RAWMIDI
      # Timer
      SND_CTL_ELEM_IFACE_TIMER
      # Sequencer
      SND_CTL_ELEM_IFACE_SEQUENCER
      SND_CTL_ELEM_IFACE_LAST = SND_CTL_ELEM_IFACE_SEQUENCER
    end

    # Event class
    enum SndCtlEventTypeT
      # Elements related event
      SND_CTL_EVENT_ELEM = 0
      SND_CTL_EVENT_LAST = SND_CTL_EVENT_ELEM
    end

    # Element has been removed (Warning: test this first and if set don't
    # test the other masks) \hideinitializer
    SND_CTL_EVENT_MASK_REMOVE = (~0_u32)
    # Element value has been changed \hideinitializer
    SND_CTL_EVENT_MASK_VALUE = (1<<0)
    # Element info has been changed \hideinitializer
    SND_CTL_EVENT_MASK_INFO = (1<<1)
    # Element has been added \hideinitializer
    SND_CTL_EVENT_MASK_ADD = (1<<2)
    # Element's TLV value has been changed \hideinitializer
    SND_CTL_EVENT_MASK_TLV = (1<<3)

    # CTL name helper
    SND_CTL_NAME_NONE = ""
    # CTL name helper
    SND_CTL_NAME_PLAYBACK = "Playback "
    # CTL name helper
    SND_CTL_NAME_CAPTURE = "Capture "

    # CTL name helper
    SND_CTL_NAME_IEC958_NONE = ""
    # CTL name helper
    SND_CTL_NAME_IEC958_SWITCH = "Switch"
    # CTL name helper
    SND_CTL_NAME_IEC958_VOLUME = "Volume"
    # CTL name helper
    SND_CTL_NAME_IEC958_DEFAULT = "Default"
    # CTL name helper
    SND_CTL_NAME_IEC958_MASK = "Mask"
    # CTL name helper
    SND_CTL_NAME_IEC958_CON_MASK = "Con Mask"
    # CTL name helper
    SND_CTL_NAME_IEC958_PRO_MASK = "Pro Mask"
    # CTL name helper
    SND_CTL_NAME_IEC958_PCM_STREAM = "PCM Stream"

    # Mask for the major Power State identifier
    SND_CTL_POWER_MASK = 0xff00
    # ACPI/PCI Power State D0
    SND_CTL_POWER_D0 = 0x0000
    # ACPI/PCI Power State D1
    SND_CTL_POWER_D1 = 0x0100
    # ACPI/PCI Power State D2
    SND_CTL_POWER_D2 = 0x0200
    # ACPI/PCI Power State D3
    SND_CTL_POWER_D3 = 0x0300
    # ACPI/PCI Power State D3hot
    SND_CTL_POWER_D3hot = (SND_CTL_POWER_D3|0x0000)
    # ACPI/PCI Power State D3cold
    SND_CTL_POWER_D3cold = (SND_CTL_POWER_D3|0x0001)

    # TLV type - Container
    SND_CTL_TLVT_CONTAINER = 0x0000
    # TLV type - basic dB scale
    SND_CTL_TLVT_DB_SCALE = 0x0001
    # TLV type - linear volume
    SND_CTL_TLVT_DB_LINEAR = 0x0002
    # TLV type - dB range container
    SND_CTL_TLVT_DB_RANGE = 0x0003
    # TLV type - dB scale specified by min/max values
    SND_CTL_TLVT_DB_MINMAX = 0x0004
    # TLV type - dB scale specified by min/max values (with mute)
    SND_CTL_TLVT_DB_MINMAX_MUTE = 0x0005

    # Mute state
    SND_CTL_TLV_DB_GAIN_MUTE = -9999999

    # TLV type - fixed channel map positions
    SND_CTL_TLVT_CHMAP_FIXED = 0x00101
    # TLV type - freely swappable channel map positions
    SND_CTL_TLVT_CHMAP_VAR = 0x00102
    # TLV type - pair-wise swappable channel map positions
    SND_CTL_TLVT_CHMAP_PAIRED = 0x00103

    # CTL type
    enum SndCtlTypeT
      # Kernel level CTL
      SND_CTL_TYPE_HW
      # Shared memory client CTL
      SND_CTL_TYPE_SHM
      # INET client CTL (not yet implemented)
      SND_CTL_TYPE_INET
      # External control plugin
      SND_CTL_TYPE_EXT
    end

    # Non blocking mode (flag for open mode) \hideinitializer
    SND_CTL_NONBLOCK = 0x0001

    # Async notification (flag for open mode) \hideinitializer
    SND_CTL_ASYNC = 0x0002

    # Read only (flag for open mode) \hideinitializer
    SND_CTL_READONLY = 0x0004

    # CTL handle
    alias SndCtlT = Void*

    # Don't destroy the ctl handle when close
    SND_SCTL_NOFREE = 0x0001

    # SCTL type
    alias SndSctlT = Void*

    fun snd_card_load(card : Int32) : Int32
    fun snd_card_next(card : Int32*) : Int32
    fun snd_card_get_index(name : UInt8*) : Int32
    fun snd_card_get_name(card : Int32, name : UInt8**) : Int32
    fun snd_card_get_longname(card : Int32, name : UInt8**) : Int32

    fun snd_device_name_hint(card : Int32, iface : UInt8*, hints : Void***) : Int32
    fun snd_device_name_free_hint(hints : Void**) : Int32
    fun snd_device_name_get_hint(hint : Void*, id : UInt8*) : UInt8*

    fun snd_ctl_open(ctl : SndSctlT*, name : UInt8*, mode : Int32) : Int32
    fun snd_ctl_open_lconf(ctl : SndSctlT*, name : UInt8*, mode : Int32, lconf : SndConfigT) : Int32
    fun snd_ctl_open_fallback(ctl : SndSctlT*, root : SndConfigT, name : UInt8*, orig_name : UInt8*, mode : Int32) : Int32
    fun snd_ctl_close(ctl : SndSctlT) : Int32
    fun snd_ctl_nonblock(ctl : SndSctlT, nonblock : Int32) : Int32
    fun snd_async_add_ctl_handler(handler : SndAsyncHandlerT*, ctl : SndSctlT, callback : SndAsyncCallbackT, private_data : Void*) : Int32
    fun snd_async_handler_get_ctl(handler : SndAsyncHandlerT) : SndCtlT
    fun snd_ctl_poll_descriptors_count(ctl : SndSctlT) : Int32
    fun snd_ctl_poll_descriptors(ctl : SndSctlT, pfds : Pollfd*, space : UInt32) : Int32
    fun snd_ctl_poll_descriptors_revents(ctl : SndSctlT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_ctl_subscribe_events(ctl : SndSctlT, subscribe : Int32) : Int32
    fun snd_ctl_card_info(ctl : SndSctlT, info : SndCtlCardInfoT) : Int32
    fun snd_ctl_elem_list(ctl : SndSctlT, list : SndCtlElemListT) : Int32
    fun snd_ctl_elem_info(ctl : SndSctlT, info : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_read(ctl : SndSctlT, value : SndCtlElemValueT) : Int32
    fun snd_ctl_elem_write(ctl : SndSctlT, value : SndCtlElemValueT) : Int32
    fun snd_ctl_elem_lock(ctl : SndSctlT, id : SndCtlElemIdT) : Int32
    fun snd_ctl_elem_unlock(ctl : SndSctlT, id : SndCtlElemIdT) : Int32
    fun snd_ctl_elem_tlv_read(ctl : SndSctlT, id : SndCtlElemIdT, tlv : UInt32*, tlv_size : UInt32) : Int32
    fun snd_ctl_elem_tlv_write(ctl : SndSctlT, id : SndCtlElemIdT, tlv : UInt32*) : Int32
    fun snd_ctl_elem_tlv_command(ctl : SndSctlT, id : SndCtlElemIdT, tlv : UInt32*) : Int32

    fun snd_ctl_hwdep_next_device(ctl : SndSctlT, device : Int32) : Int32
    fun snd_ctl_hwdep_info(ctl : SndSctlT, info : SndHwdepInfoT) : Int32

    fun snd_ctl_pcm_next_device(ctl : SndSctlT, device : Int32*) : Int32
    fun snd_ctl_pcm_info(ctl : SndSctlT, info : SndPcmInfoT) : Int32
    fun snd_ctl_pcm_prefer_subdevice(ctl : SndSctlT, subdev : Int32) : Int32

    fun snd_ctl_rawmidi_next_device(ctl : SndSctlT, device : Int32*) : Int32
    fun snd_ctl_rawmidi_info(ctl : SndSctlT, info : SndRawmidiInfoT) : Int32
    fun snd_ctl_rawmidi_prefer_subdevice(ctl : SndSctlT, subdev : Int32) : Int32

    fun snd_ctl_set_power_state(ctl : SndSctlT, state : UInt32) : Int32
    fun snd_ctl_get_power_state(ctl : SndSctlT, state : UInt32*) : Int32

    fun snd_ctl_read(ctl : SndSctlT, event : SndCtlEventT) : Int32
    fun snd_ctl_wait(ctl : SndSctlT, timeout : Int32) : Int32
    fun snd_ctl_name(ctl : SndSctlT) : UInt8*
    fun snd_ctl_type(ctl : SndSctlT) : SndCtlTypeT

    fun snd_ctl_elem_type_name(type : SndCtlElemTypeT) : UInt8*
    fun snd_ctl_elem_iface_name(iface : SndCtlElemIfaceT) : UInt8*
    fun snd_ctl_event_type_name(type : SndCtlEventTypeT) : UInt8*

    fun snd_ctl_event_elem_get_mask(obj : SndCtlEventT) : UInt32
    fun snd_ctl_event_elem_get_numid(obj : SndCtlEventT) : UInt32
    fun snd_ctl_event_elem_get_id(obj : SndCtlEventT, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_event_elem_get_interface(obj : SndCtlEventT) : SndCtlElemIfaceT
    fun snd_ctl_event_elem_get_device(obj : SndCtlEventT) : UInt32
    fun snd_ctl_event_elem_get_subdevice(obj : SndCtlEventT) : UInt32
    fun snd_ctl_event_elem_get_name(obj : SndCtlEventT) : UInt8*
    fun snd_ctl_event_elem_get_index(obj : SndCtlEventT) : UInt32

    fun snd_ctl_elem_list_alloc_space(obj : SndCtlElemListT, entries : UInt32) : Int32
    fun snd_ctl_elem_list_free_space(obj : SndCtlElemListT) : Void

    fun snd_ctl_ascii_elem_id_get(id : SndCtlElemIdT) : UInt8*
    fun snd_ctl_ascii_elem_id_parse(dst : SndCtlElemIdT, str : UInt8*) : Int32
    fun snd_ctl_ascii_value_parse(handle : SndCtlT, dst : SndCtlElemValueT, info : SndCtlElemInfoT, value : UInt8*) : Int32
  end

  @[AlwaysInline]
  def self.snd_ctl_abort(ctl : SndCtlT) : Int32
    ASound.snd_ctl_nonblock(ctl, 2)
  end
end
