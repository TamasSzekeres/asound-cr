module ALSA::C
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

    fun snd_ctl_elem_id_sizeof() : LibC::SizeT
    fun snd_ctl_elem_id_malloc(ptr : SndCtlElemIdT*) : Int32
    fun snd_ctl_elem_id_free(obj : SndCtlElemIdT) : Void
    fun snd_ctl_elem_id_clear(obj : SndCtlElemIdT) : Void
    fun snd_ctl_elem_id_copy(dst : SndCtlElemIdT, src : SndCtlElemIdT) : Void
    fun snd_ctl_elem_id_get_numid(obj : SndCtlElemIdT) : UInt32
    fun snd_ctl_elem_id_get_interface(obj : SndCtlElemIdT) : SndCtlElemIfaceT
    fun snd_ctl_elem_id_get_device(obj : SndCtlElemIdT) : UInt32
    fun snd_ctl_elem_id_get_subdevice(obj : SndCtlElemIdT) : UInt32
    fun snd_ctl_elem_id_get_name(obj : SndCtlElemIdT) : UInt8*
    fun snd_ctl_elem_id_get_index(obj : SndCtlElemIdT) : UInt32
    fun snd_ctl_elem_id_set_numid(obj : SndCtlElemIdT, val : UInt32) : Void
    fun snd_ctl_elem_id_set_interface(obj : SndCtlElemIdT, val : SndCtlElemIfaceT) : Void
    fun snd_ctl_elem_id_set_device(obj : SndCtlElemIdT, val : UInt32) : Void
    fun snd_ctl_elem_id_set_subdevice(obj : SndCtlElemIdT, val : UInt32) : Void
    fun snd_ctl_elem_id_set_name(obj : SndCtlElemIdT, val : UInt8*) : Void
    fun snd_ctl_elem_id_set_index(obj : SndCtlElemIdT, val : UInt32) : Void

    fun snd_ctl_card_info_sizeof() : LibC::SizeT
    fun snd_ctl_card_info_malloc(ptr : SndCtlCardInfoT*) : Int32
    fun snd_ctl_card_info_free(obj : SndCtlCardInfoT) : Void
    fun snd_ctl_card_info_clear(obj : SndCtlCardInfoT) : Void
    fun snd_ctl_card_info_copy(dst : SndCtlCardInfoT, src : SndCtlCardInfoT) : Void
    fun snd_ctl_card_info_get_card(obj : SndCtlCardInfoT) : Int32
    fun snd_ctl_card_info_get_id(obj : SndCtlCardInfoT) : UInt8*
    fun snd_ctl_card_info_get_driver(obj : SndCtlCardInfoT) : UInt8*
    fun snd_ctl_card_info_get_name(obj : SndCtlCardInfoT) : UInt8*
    fun snd_ctl_card_info_get_longname(obj : SndCtlCardInfoT) : UInt8*
    fun snd_ctl_card_info_get_mixername(obj : SndCtlCardInfoT) : UInt8*
    fun snd_ctl_card_info_get_components(obj : SndCtlCardInfoT) : UInt8*

    fun snd_ctl_event_sizeof() : LibC::SizeT
    fun snd_ctl_event_malloc(ptr : SndCtlElemIdT*) : Int32
    fun snd_ctl_event_free(obj : SndCtlElemIdT) : Void
    fun snd_ctl_event_clear(obj : SndCtlElemIdT) : Void
    fun snd_ctl_event_copy(dst : SndCtlElemIdT, src : SndCtlElemIdT) : Void
    fun snd_ctl_event_get_type(obj : SndCtlElemIdT) : SndCtlEventTypeT

    fun snd_ctl_event_sizeof() : LibC::SizeT
    fun snd_ctl_event_malloc(ptr : SndCtlEventT*) : Int32
    fun snd_ctl_event_free(obj : SndCtlEventT) : Void
    fun snd_ctl_event_clear(obj : SndCtlEventT) : Void
    fun snd_ctl_event_copy(dst : SndCtlEventT, src : SndCtlEventT) : Void
    fun snd_ctl_event_get_type(obj : SndCtlEventT) : SndCtlEventTypeT

    fun snd_ctl_elem_list_sizeof() : LibC::SizeT
    fun snd_ctl_elem_list_malloc(ptr : SndCtlElemListT*) : Int32
    fun snd_ctl_elem_list_free(obj : SndCtlElemListT) : Void
    fun snd_ctl_elem_list_clear(obj : SndCtlElemListT) : Void
    fun snd_ctl_elem_list_copy(dst : SndCtlElemListT, src : SndCtlElemListT) : Void
    fun snd_ctl_elem_list_set_offset(obj : SndCtlElemListT, val : UInt32) : Void
    fun snd_ctl_elem_list_get_used(obj : SndCtlElemListT) : UInt32
    fun snd_ctl_elem_list_get_count(obj : SndCtlElemListT) : UInt32
    fun snd_ctl_elem_list_get_id(obj : SndCtlElemListT, idx : UInt32, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_elem_list_get_numid(obj : SndCtlElemListT, idx : UInt32) : UInt32
    fun snd_ctl_elem_list_get_interface(obj : SndCtlElemListT, idx : UInt32) : SndCtlElemIfaceT
    fun snd_ctl_elem_list_get_device(obj : SndCtlElemListT, idx : UInt32) : UInt32
    fun snd_ctl_elem_list_get_subdevice(obj : SndCtlElemListT, idx : UInt32) : UInt32
    fun snd_ctl_elem_list_get_name(obj : SndCtlElemListT, idx : UInt32) : UInt8*
    fun snd_ctl_elem_list_get_index(obj : SndCtlElemListT, idx : UInt32) : UInt32

    fun snd_ctl_elem_info_sizeof() : LibC::SizeT
    fun snd_ctl_elem_info_malloc(ptr : SndCtlElemInfoT*) : Int32
    fun snd_ctl_elem_info_free(obj : SndCtlElemInfoT) : Void
    fun snd_ctl_elem_info_clear(obj : SndCtlElemInfoT) : Void
    fun snd_ctl_elem_info_copy(dst : SndCtlElemInfoT, src : SndCtlElemInfoT) : Void
    fun snd_ctl_elem_info_get_type(obj : SndCtlElemInfoT) : SndCtlElemTypeT
    fun snd_ctl_elem_info_is_readable(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_writable(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_volatile(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_inactive(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_locked(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_tlv_readable(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_tlv_writable(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_tlv_commandable(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_owner(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_is_user(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_get_owner(obj : SndCtlElemInfoT) : LibC::PidT
    fun snd_ctl_elem_info_get_count(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_get_min(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_max(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_step(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_min64(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_max64(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_step64(obj : SndCtlElemInfoT) : Int64
    fun snd_ctl_elem_info_get_items(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_set_item(obj : SndCtlElemInfoT, val : UInt32) : Void
    fun snd_ctl_elem_info_get_item_name(obj : SndCtlElemInfoT) : UInt8*
    fun snd_ctl_elem_info_get_dimensions(obj : SndCtlElemInfoT) : Int32
    fun snd_ctl_elem_info_get_dimension(obj : SndCtlElemInfoT, idx : UInt32) : Int32
    fun snd_ctl_elem_info_get_id(obj : SndCtlElemInfoT, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_elem_info_get_numid(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_get_interface(obj : SndCtlElemInfoT) : SndCtlElemIfaceT
    fun snd_ctl_elem_info_get_device(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_get_subdevice(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_get_name(obj : SndCtlElemInfoT) : UInt8*
    fun snd_ctl_elem_info_get_index(obj : SndCtlElemInfoT) : UInt32
    fun snd_ctl_elem_info_set_id(obj : SndCtlElemInfoT, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_elem_info_set_numid(obj : SndCtlElemInfoT, val : UInt32) : Void
    fun snd_ctl_elem_info_set_interface(obj : SndCtlElemInfoT, val : SndCtlElemIfaceT) : Void
    fun snd_ctl_elem_info_set_device(obj : SndCtlElemInfoT, val : UInt32) : Void
    fun snd_ctl_elem_info_set_subdevice(obj : SndCtlElemInfoT, val : UInt32) : Void
    fun snd_ctl_elem_info_set_name(obj : SndCtlElemInfoT, val : UInt8*) : Void
    fun snd_ctl_elem_info_set_index(obj : SndCtlElemInfoT, val : UInt32) : Void

    fun snd_ctl_elem_add_integer(ctl : SndCtlT, id : SndCtlElemIdT, count : UInt32, imin : Int64, imax : Int64, istep : Int64) : Int32
    fun snd_ctl_elem_add_integer64(ctl : SndCtlT, id : SndCtlElemIdT, count : UInt32, imin : Int64, imax : Int64, istep : Int64) : Int32
    fun snd_ctl_elem_add_boolean(ctl : SndCtlT, id : SndCtlElemIdT, count : UInt32) : Int32
    fun snd_ctl_elem_add_enumerated(ctl : SndCtlT, id : SndCtlElemIdT, count : UInt32, items : UInt32, names : UInt8**) : Int32
    fun snd_ctl_elem_add_iec958(ctl : SndCtlT, id : SndCtlElemIdT) : Int32
    fun snd_ctl_elem_remove(ctl : SndCtlT, id : SndCtlElemIdT) : Int32

    fun snd_ctl_elem_value_sizeof() : LibC::SizeT
    fun snd_ctl_elem_value_malloc(ptr : SndCtlElemValueT*) : Int32
    fun snd_ctl_elem_value_free(obj : SndCtlElemValueT) : Void
    fun snd_ctl_elem_value_clear(obj : SndCtlElemValueT) : Void
    fun snd_ctl_elem_value_copy(dst : SndCtlElemValueT, src : SndCtlElemValueT) : Void
    fun snd_ctl_elem_value_compare(left : SndCtlElemValueT, right : SndCtlElemValueT) : Int32
    fun snd_ctl_elem_value_get_id(obj : SndCtlElemValueT, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_elem_value_get_numid(obj : SndCtlElemValueT) : UInt32
    fun snd_ctl_elem_value_get_interface(obj : SndCtlElemValueT) : SndCtlElemIfaceT
    fun snd_ctl_elem_value_get_device(obj : SndCtlElemValueT) : UInt32
    fun snd_ctl_elem_value_get_subdevice(obj : SndCtlElemValueT) : UInt32
    fun snd_ctl_elem_value_get_name(obj : SndCtlElemValueT) : UInt8*
    fun snd_ctl_elem_value_get_index(obj : SndCtlElemValueT) : UInt32
    fun snd_ctl_elem_value_set_id(obj : SndCtlElemValueT, ptr : SndCtlElemIdT) : Void
    fun snd_ctl_elem_value_set_numid(obj : SndCtlElemValueT, val : UInt32) : Void
    fun snd_ctl_elem_value_set_interface(obj : SndCtlElemValueT, val : SndCtlElemIfaceT) : Void
    fun snd_ctl_elem_value_set_device(obj : SndCtlElemValueT, val : UInt32) : Void
    fun snd_ctl_elem_value_set_subdevice(obj : SndCtlElemValueT, val : UInt32) : Void
    fun snd_ctl_elem_value_set_name(obj : SndCtlElemValueT, val : UInt8*) : Void
    fun snd_ctl_elem_value_set_index(obj : SndCtlElemValueT, val : UInt32) : Void
    fun snd_ctl_elem_value_get_boolean(obj : SndCtlElemValueT, idx : UInt32) : Int32
    fun snd_ctl_elem_value_get_integer(obj : SndCtlElemValueT, idx : UInt32) : Int64
    fun snd_ctl_elem_value_get_integer64(obj : SndCtlElemValueT, idx : UInt32) : Int64
    fun snd_ctl_elem_value_get_enumerated(obj : SndCtlElemValueT, idx : UInt32) : UInt32
    fun snd_ctl_elem_value_get_byte(obj : SndCtlElemValueT, idx : UInt32) : UInt8
    fun snd_ctl_elem_value_set_boolean(obj : SndCtlElemValueT, idx : UInt32, val : Int64) : Void
    fun snd_ctl_elem_value_set_integer(obj : SndCtlElemValueT, idx : UInt32, val : Int64) : Void
    fun snd_ctl_elem_value_set_integer64(obj : SndCtlElemValueT, idx : UInt32, val : Int64) : Void
    fun snd_ctl_elem_value_set_enumerated(obj : SndCtlElemValueT, idx : UInt32, val : UInt32) : Void
    fun snd_ctl_elem_value_set_byte(obj : SndCtlElemValueT, idx : UInt32, val : UInt8) : Void
    fun snd_ctl_elem_set_bytes(obj : SndCtlElemValueT, data : Void*, size : LibC::SizeT) : Void
    fun snd_ctl_elem_value_get_bytes(obj : SndCtlElemValueT) : Void*
    fun snd_ctl_elem_value_get_iec958(obj : SndCtlElemValueT, ptr : SndAesIec958T*) : Void
    fun snd_ctl_elem_value_set_iec958(obj : SndCtlElemValueT, ptr : SndAesIec958T*) : Void

    fun snd_tlv_parse_dB_info(tlv : UInt32*, tlv_size : UInt32, db_tlvp : UInt32**) : Int32
    fun snd_tlv_get_dB_range(tlv : UInt32*, rangemin : Int64, rangemax : Int64, min : Int64*, max : Int64*) : Int32
    fun snd_tlv_convert_to_dB(tlv : UInt32*, rangemin : Int64, rangemax : Int64, volume : Int64, db_gain : Int64*) : Int32
    fun snd_tlv_convert_from_dB(tlv : UInt32*, rangemin : Int64, rangemax : Int64, db_gain : Int64, value : Int64*, xdir : Int32) : Int32
    fun snd_ctl_get_dB_range(ctl : SndCtlT, id : SndCtlElemIdT, min : Int64*, max : Int64*) : Int32
    fun snd_ctl_convert_to_dB(ctl : SndCtlT, id : SndCtlElemIdT, volume : Int64, db_gain : Int64*) : Int32
    fun snd_ctl_convert_from_dB(ctl : SndCtlT, id : SndCtlElemIdT, db_gain : Int64, value : Int64*, xdir : Int32) : Int32

    # The high level control interface.

    # HCTL element handle
    alias SndHctlElemT = Void*

    # HCTL handle
    alias SndHctlT = Void*

    alias SndHctlCompareT = (SndHctlElemT, SndHctlElemT) -> Int32
    fun snd_hctl_compare_fast(c1 : SndHctlElemT, c2 : SndHctlElemT) : Int32

    alias SndHctlCallbackT = (SndHctlT, UInt32, SndHctlElemT) -> Int32

    alias SndHctlElemCallbackT = (SndHctlElemT, UInt32) -> Int32

    fun snd_hctl_open(hctl : SndHctlT*, name : UInt8*, mode : Int32) : Int32
    fun snd_hctl_open_ctl(hctlp : SndHctlT*, ctl : SndCtlT) : Int32
    fun snd_hctl_close(hctl : SndHctlT) : Int32
    fun snd_hctl_nonblock(hctl : SndHctlT, nonblock : Int32) : Int32
    fun snd_hctl_poll_descriptors_count(hctl : SndHctlT) : Int32
    fun snd_hctl_poll_descriptors(hctl : SndHctlT, pfds : Pollfd*, space : UInt32*) : Int32
    fun snd_hctl_poll_descriptors_revents(ctl : SndHctlT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_hctl_get_count(hctl : SndHctlT) : UInt32
    fun snd_hctl_set_compare(hctl : SndHctlT, hsort : SndHctlCompareT) : Int32
    fun snd_hctl_first_elem(hctl : SndHctlT) : SndHctlElemT
    fun snd_hctl_last_elem(hctl : SndHctlT) : SndHctlElemT
    fun snd_hctl_find_elem(hctl : SndHctlT, id : SndCtlElemIdT) : SndHctlElemT
    fun snd_hctl_set_callback(hctl : SndHctlT, callback : SndHctlCallbackT) : Void*
    fun snd_hctl_set_callback_private(hctl : SndHctlT, data : Void*) : Void*
    fun snd_hctl_get_callback_private(hctl : SndHctlT) : Void*
    fun snd_hctl_load(hctl : SndHctlT) : Int32
    fun snd_hctl_free(hctl : SndHctlT) : Int32
    fun snd_hctl_handle_events(hctl : SndHctlT) : Int32
    fun snd_hctl_name(hctl : SndHctlT) : UInt8*
    fun snd_hctl_wait(hctl : SndHctlT, timeout : Int32) : Int32
    fun snd_hctl_ctl(hctl : SndHctlT) : SndCtlT

    fun snd_hctl_elem_next(elem : SndHctlElemT) : SndHctlElemT
    fun snd_hctl_elem_prev(elem : SndHctlElemT) : SndHctlElemT
    fun snd_hctl_elem_info(elem : SndHctlElemT, info : SndCtlElemInfoT) : Int32
    fun snd_hctl_elem_read(elem : SndHctlElemT, value : SndCtlElemValueT) : Int32
    fun snd_hctl_elem_write(elem : SndHctlElemT, value : SndCtlElemValueT) : Int32
    fun snd_hctl_elem_tlv_read(elem : SndHctlElemT, tlv : UInt32*, tlv_size : UInt32) : Int32
    fun snd_hctl_elem_tlv_write(elem : SndHctlElemT, tlv : UInt32*) : Int32
    fun snd_hctl_elem_tlv_command(elem : SndHctlElemT, tlv : UInt32*) : Int32

    fun snd_hctl_elem_get_hctl(elem : SndHctlElemT) : SndHctlT

    fun snd_hctl_elem_get_id(obj : SndHctlElemT, ptr : SndCtlElemIdT) : Void
    fun snd_hctl_elem_get_numid(obj : SndHctlElemT) : UInt32
    fun snd_hctl_elem_get_interface(obj : SndHctlElemT) : SndCtlElemIfaceT
    fun snd_hctl_elem_get_device(obj : SndHctlElemT) : UInt32
    fun snd_hctl_elem_get_subdevice(obj : SndHctlElemT) : UInt32
    fun snd_hctl_elem_get_name(obj : SndHctlElemT) : UInt8*
    fun snd_hctl_elem_get_index(obj : SndHctlElemT) : UInt32
    fun snd_hctl_elem_set_callback(obj : SndHctlElemT, val : SndHctlElemCallbackT) : Void
    fun snd_hctl_elem_get_callback_private(obj : SndHctlElemT) : Void*
    fun snd_hctl_elem_set_callback_private(obj : SndHctlElemT, val : Void*) : Void

    fun snd_sctl_build(ctl : SndSctlT*, handle : SndCtlT, config : SndConfigT, private_data : SndConfigT, mode : Int32) : Int32
    fun snd_sctl_free(handle : SndSctlT) : Int32
    fun snd_sctl_install(handle : SndSctlT) : Int32
    fun snd_sctl_remove(handle : SndSctlT) : Int32
  end

  @[AlwaysInline]
  def self.snd_ctl_abort(ctl : SndCtlT) : Int32
    ASound.snd_ctl_nonblock(ctl, 2)
  end

  @[AlwaysInline]
  def self.snd_ctl_elem_id_alloca : ASound::SndCtlElemIdT
    LibC.malloc(ASound.snd_ctl_elem_id_sizeof).as(ASound::SndCtlElemIdT)
  end

  @[AlwaysInline]
  def self.snd_ctl_card_info_alloca : ASound::SndCtlCardInfoT
    LibC.malloc(ASound.snd_ctl_card_info_sizeof).as(ASound::SndCtlCardInfoT)
  end

  @[AlwaysInline]
  def self.snd_ctl_event_alloca : ASound::SndCtlEventT
    LibC.malloc(ASound.snd_ctl_event_sizeof).as(ASound::SndCtlEventT)
  end

  @[AlwaysInline]
  def self.snd_ctl_elem_list_alloca : ASound::SndCtlElemListT
    LibC.malloc(ASound.snd_ctl_elem_list_sizeof).as(ASound::SndCtlElemListT)
  end

  @[AlwaysInline]
  def self.snd_ctl_elem_info_alloca : ASound::SndCtlElemInfoT
    LibC.malloc(ASound.snd_ctl_elem_info_sizeof).as(ASound::SndCtlElemInfoT)
  end

  @[AlwaysInline]
  def self.snd_ctl_elem_value_alloca : ASound::SndCtlElemValueT
    LibC.malloc(ASound.snd_ctl_elem_value_sizeof).as(ASound::SndCtlElemValueT)
  end

  @[AlwaysInline]
  def self.snd_hctl_abort(hctl : SndHctlT) : Int32
    ASound.snd_hctl_nonblock(hctl, 2)
  end
end
