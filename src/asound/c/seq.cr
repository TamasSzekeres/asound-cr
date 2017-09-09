module ALSA::C
  @[Link("asound")]
  lib ASound
    # MIDI Sequencer Interface.

    # Sequencer handle
    alias SndSeqT = Void*

    # sequencer opening stream types
    ND_SEQ_OPEN_OUTPUT = 1 # open for output (write)
    SND_SEQ_OPEN_INPUT = 2 # open for input (read)
    SND_SEQ_OPEN_DUPLEX = (SND_SEQ_OPEN_OUTPUT|SND_SEQ_OPEN_INPUT) # open for both input and output (read/write)

    # sequencer opening mode
    SND_SEQ_NONBLOCK = 0x0001 # non-blocking mode (flag to open mode)

    # sequencer handle type
    enum SndSeqTypeT
      SND_SEQ_TYPE_HW # hardware
      SND_SEQ_TYPE_SHM # shared memory (NYI)
      SND_SEQ_TYPE_INET # network (NYI)
    end

    # special client (port) ids
    SND_SEQ_ADDRESS_UNKNOWN = 253 # unknown source
    SND_SEQ_ADDRESS_SUBSCRIBERS = 254 # send event to all subscribed ports
    SND_SEQ_ADDRESS_BROADCAST = 255 # send event to all queues/clients/ports/channels

    # known client numbers
    SND_SEQ_CLIENT_SYSTEM = 0 # system client


    fun snd_seq_open(handle : SndSeqT*, name : UInt8*, streams : Int32, mode : Int32) : Int32
    fun snd_seq_open_lconf(handle : SndSeqT*, name : UInt8*, streams : Int32, mode : Int32, lconf : SndConfigT) : Int32
    fun snd_seq_name(seq : SndSeqT) : UInt8*
    fun snd_seq_type(seq : SndSeqT) : SndSeqTypeT
    fun snd_seq_close(handle : SndSeqT) : Int32
    fun snd_seq_poll_descriptors_count(handle : SndSeqT, events : Int16) : Int32
    fun snd_seq_poll_descriptors(handle : SndSeqT, pfds : Pollfd*, space : UInt32, events : Int16) : Int32
    fun snd_seq_poll_descriptors_revents(seq : SndSeqT, pfds : Pollfd*, nfds : UInt32, revents : UInt16*) : Int32
    fun snd_seq_nonblock(handle : SndSeqT, nonblock : Int32) : Int32
    fun snd_seq_client_id(handle : SndSeqT) : Int32

    fun snd_seq_get_output_buffer_size(handle : SndSeqT) : LibC::SizeT
    fun snd_seq_get_input_buffer_size(handle : SndSeqT) : LibC::SizeT
    fun snd_seq_set_output_buffer_size(handle : SndSeqT, size : LibC::SizeT) : Int32
    fun snd_seq_set_input_buffer_size(handle : SndSeqT, size : LibC::SizeT) : Int32

    # system information container
    alias SndSeqSystemInfoT = Void*

    fun snd_seq_system_info_sizeof() : LibC::SizeT
    fun snd_seq_system_info_malloc(ptr : SndSeqSystemInfoT*) : Int32
    fun snd_seq_system_info_free(ptr : SndSeqSystemInfoT) : Void
    fun snd_seq_system_info_copy(dst : SndSeqSystemInfoT, src : SndSeqSystemInfoT) : Void

    fun snd_seq_system_info_get_queues(info : SndSeqSystemInfoT) : Int32
    fun snd_seq_system_info_get_clients(info : SndSeqSystemInfoT) : Int32
    fun snd_seq_system_info_get_ports(info : SndSeqSystemInfoT) : Int32
    fun snd_seq_system_info_get_channels(info : SndSeqSystemInfoT) : Int32
    fun snd_seq_system_info_get_cur_clients(info : SndSeqSystemInfoT) : Int32
    fun snd_seq_system_info_get_cur_queues(info : SndSeqSystemInfoT) : Int32

    fun snd_seq_system_info(handle : SndSeqT, info : SndSeqSystemInfoT) : Int32

    # Sequencer Client Interface

    # client information container
    alias SndSeqClientInfoT = Void*

    # client types
    enum SndSeqClientTypeT
      SND_SEQ_USER_CLIENT = 1 # user client
      SND_SEQ_KERNEL_CLIENT = 2 # kernel client
    end

    fun snd_seq_client_info_sizeof() : LibC::SizeT
    fun snd_seq_client_info_malloc(ptr : SndSeqClientInfoT*) : Int32
    fun snd_seq_client_info_free(ptr : SndSeqClientInfoT) : Void
    fun snd_seq_client_info_copy(dst : SndSeqClientInfoT, src : SndSeqClientInfoT) : Void

    fun snd_seq_client_info_get_client(info : SndSeqClientInfoT) : Int32
    fun snd_seq_client_info_get_type(info : SndSeqClientInfoT) : SndSeqClientTypeT
    fun snd_seq_client_info_get_name(info : SndSeqClientInfoT) : UInt8*
    fun snd_seq_client_info_get_broadcast_filter(info : SndSeqClientInfoT) : Int32
    fun snd_seq_client_info_get_error_bounce(info : SndSeqClientInfoT) : Int32
    fun snd_seq_client_info_get_event_filter(info : SndSeqClientInfoT) : UInt8*
    fun snd_seq_client_info_get_num_ports(info : SndSeqClientInfoT) : Int32
    fun snd_seq_client_info_get_event_lost(info : SndSeqClientInfoT) : Int32

    fun snd_seq_client_info_set_client(info : SndSeqClientInfoT, client : Int32) : Void
    fun snd_seq_client_info_set_name(info : SndSeqClientInfoT, name : UInt8*) : Void
    fun snd_seq_client_info_set_broadcast_filter(info : SndSeqClientInfoT, val : Int32) : Void
    fun snd_seq_client_info_set_error_bounce(info : SndSeqClientInfoT, val : Int32) : Void
    fun snd_seq_client_info_set_event_filter(info : SndSeqClientInfoT, filter : UInt8*) : Void

    fun snd_seq_client_info_event_filter_clear(info : SndSeqClientInfoT) : Void
    fun snd_seq_client_info_event_filter_add(info : SndSeqClientInfoT, event_type : Int32) : Void
    fun snd_seq_client_info_event_filter_del(info : SndSeqClientInfoT, event_type : Int32) : Void
    fun snd_seq_client_info_event_filter_check(info : SndSeqClientInfoT, event_type : Int32) : Int32

    fun snd_seq_get_client_info(handle : SndSeqT, info : SndSeqClientInfoT) : Int32
    fun snd_seq_get_any_client_info(handle : SndSeqT, client : Int32, info : SndSeqClientInfoT) : Int32
    fun snd_seq_set_client_info(handle : SndSeqT, info : SndSeqClientInfoT) : Int32
    fun snd_seq_query_next_client(handle : SndSeqT, info : SndSeqClientInfoT) : Int32

    # client pool information container
    alias SndSeqClientPoolT = Void*

    fun snd_seq_client_pool_sizeof() : LibC::SizeT
    fun snd_seq_client_pool_malloc(ptr : SndSeqClientPoolT*) : Int32
    fun snd_seq_client_pool_free(ptr : SndSeqClientPoolT) : Void
    fun snd_seq_client_pool_copy(dst : SndSeqClientPoolT, src : SndSeqClientPoolT) : Void

    fun snd_seq_client_pool_get_client(info : SndSeqClientPoolT) : Int32
    fun snd_seq_client_pool_get_output_pool(info : SndSeqClientPoolT) : LibC::SizeT
    fun snd_seq_client_pool_get_input_pool(info : SndSeqClientPoolT) : LibC::SizeT
    fun snd_seq_client_pool_get_output_room(info : SndSeqClientPoolT) : LibC::SizeT
    fun snd_seq_client_pool_get_output_free(info : SndSeqClientPoolT) : LibC::SizeT
    fun snd_seq_client_pool_get_input_free(info : SndSeqClientPoolT) : LibC::SizeT
    fun snd_seq_client_pool_set_output_pool(info : SndSeqClientPoolT, size : LibC::SizeT) : Void
    fun snd_seq_client_pool_set_input_pool(info : SndSeqClientPoolT, size : LibC::SizeT) : Void
    fun snd_seq_client_pool_set_output_room(info : SndSeqClientPoolT, size : LibC::SizeT) : Void

    fun snd_seq_get_client_pool(handle : SndSeqT, info : SndSeqClientPoolT) : Int32
    fun snd_seq_set_client_pool(handle : SndSeqT, info : SndSeqClientPoolT) : Int32


    # Sequencer Port Interface

    # port information container
    alias SndSeqPortInfoT = Void*

    # known port numbers
    SND_SEQ_PORT_SYSTEM_TIMER = 0 # system timer port
    SND_SEQ_PORT_SYSTEM_ANNOUNCE = 1 # system announce port

    # port capabilities (32 bits)
    SND_SEQ_PORT_CAP_READ = (1<<0) # readable from this port
    SND_SEQ_PORT_CAP_WRITE = (1<<1) # writable to this port

    SND_SEQ_PORT_CAP_SYNC_READ = (1<<2) # allow read subscriptions
    SND_SEQ_PORT_CAP_SYNC_WRITE = (1<<3) # allow write subscriptions

    SND_SEQ_PORT_CAP_DUPLEX = (1<<4) # allow read/write duplex

    SND_SEQ_PORT_CAP_SUBS_READ = (1<<5) # allow read subscription
    SND_SEQ_PORT_CAP_SUBS_WRITE = (1<<6) # allow write subscription
    SND_SEQ_PORT_CAP_NO_EXPORT = (1<<7) # routing not allowed

    # port type
    # Messages sent from/to this port have device-specific semantics.
    SND_SEQ_PORT_TYPE_SPECIFIC = (1<<0)
    # This port understands MIDI messages.
    SND_SEQ_PORT_TYPE_MIDI_GENERIC = (1<<1)
    # This port is compatible with the General MIDI specification.
    SND_SEQ_PORT_TYPE_MIDI_GM = (1<<2)
    # This port is compatible with the Roland GS standard.
    SND_SEQ_PORT_TYPE_MIDI_GS = (1<<3)
    # This port is compatible with the Yamaha XG specification.
    SND_SEQ_PORT_TYPE_MIDI_XG = (1<<4)
    # This port is compatible with the Roland MT-32.
    SND_SEQ_PORT_TYPE_MIDI_MT32 = (1<<5)
    # This port is compatible with the General MIDI 2 specification.
    SND_SEQ_PORT_TYPE_MIDI_GM2 = (1<<6)
    # This port understands SND_SEQ_EVENT_SAMPLE_xxx messages
    # (these are not MIDI messages).
    SND_SEQ_PORT_TYPE_SYNTH = (1<<10)
    # Instruments can be downloaded to this port
    # (with SND_SEQ_EVENT_INSTR_xxx messages sent directly).
    SND_SEQ_PORT_TYPE_DIRECT_SAMPLE = (1<<11)
    # Instruments can be downloaded to this port
    # (with SND_SEQ_EVENT_INSTR_xxx messages sent directly or through a queue).
    SND_SEQ_PORT_TYPE_SAMPLE = (1<<12)
    # This port is implemented in hardware.
    SND_SEQ_PORT_TYPE_HARDWARE = (1<<16)
    # This port is implemented in software.
    SND_SEQ_PORT_TYPE_SOFTWARE = (1<<17)
    # Messages sent to this port will generate sounds.
    SND_SEQ_PORT_TYPE_SYNTHESIZER = (1<<18)
    # This port may connect to other devices
    # (whose characteristics are not known).
    SND_SEQ_PORT_TYPE_PORT = (1<<19)
    # This port belongs to an application, such as a sequencer or editor.
    SND_SEQ_PORT_TYPE_APPLICATION = (1<<20)


    fun snd_seq_port_info_sizeof() : LibC::SizeT
    fun snd_seq_port_info_malloc(ptr : SndSeqPortInfoT*) : Int32
    fun snd_seq_port_info_free(ptr : SndSeqPortInfoT) : Void
    fun snd_seq_port_info_copy(dst : SndSeqPortInfoT, src : SndSeqPortInfoT) : Void

    fun snd_seq_port_info_get_client(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_port(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_addr(info : SndSeqPortInfoT) : SndSeqAddrT*
    fun snd_seq_port_info_get_name(info : SndSeqPortInfoT) : UInt8*
    fun snd_seq_port_info_get_capability(info : SndSeqPortInfoT) : UInt32
    fun snd_seq_port_info_get_type(info : SndSeqPortInfoT) : UInt32
    fun snd_seq_port_info_get_midi_channels(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_midi_voices(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_synth_voices(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_read_use(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_write_use(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_port_specified(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_timestamping(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_timestamp_real(info : SndSeqPortInfoT) : Int32
    fun snd_seq_port_info_get_timestamp_queue(info : SndSeqPortInfoT) : Int32

    fun snd_seq_port_info_set_client(info : SndSeqPortInfoT, client : Int32) : Void
    fun snd_seq_port_info_set_port(info : SndSeqPortInfoT, port : Int32) : Void
    fun snd_seq_port_info_set_addr(info : SndSeqPortInfoT, addr : SndSeqAddrT*) : Void
    fun snd_seq_port_info_set_name(info : SndSeqPortInfoT, name : UInt8*) : Void
    fun snd_seq_port_info_set_capability(info : SndSeqPortInfoT, capability : UInt32) : Void
    fun snd_seq_port_info_set_type(info : SndSeqPortInfoT, type : UInt32) : Void
    fun snd_seq_port_info_set_midi_channels(info : SndSeqPortInfoT, channels : Int32) : Void
    fun snd_seq_port_info_set_midi_voices(info : SndSeqPortInfoT, voices : Int32) : Void
    fun snd_seq_port_info_set_synth_voices(info : SndSeqPortInfoT, voices : Int32) : Void
    fun snd_seq_port_info_set_port_specified(info : SndSeqPortInfoT, val : Int32) : Void
    fun snd_seq_port_info_set_timestamping(info : SndSeqPortInfoT, enable : Int32) : Void
    fun snd_seq_port_info_set_timestamp_real(info : SndSeqPortInfoT, realtime : Int32) : Void
    fun snd_seq_port_info_set_timestamp_queue(info : SndSeqPortInfoT, queue : Int32) : Void

    fun snd_seq_create_port(handle : SndSeqT, info : SndSeqPortInfoT) : Int32
    fun snd_seq_delete_port(handle : SndSeqT, port : Int32) : Int32
    fun snd_seq_get_port_info(handle : SndSeqT, port : Int32, info : SndSeqPortInfoT) : Int32
    fun snd_seq_get_any_port_info(handle : SndSeqT, client : Int32, port : Int32, info : SndSeqPortInfoT) : Int32
    fun snd_seq_set_port_info(handle : SndSeqT, port : Int32, info : SndSeqPortInfoT) : Int32
    fun snd_seq_query_next_port(handle : SndSeqT, info : SndSeqPortInfoT) : Int32

    # Sequencer Port Subscription

    # port subscription container
    alias SndSeqPortSubscribeT = Void*

    fun snd_seq_port_subscribe_sizeof() : LibC::SizeT
    fun snd_seq_port_subscribe_malloc(ptr : SndSeqPortSubscribeT*) : Int32
    fun snd_seq_port_subscribe_free(ptr : SndSeqPortSubscribeT) : Void
    fun snd_seq_port_subscribe_copy(dst : SndSeqPortSubscribeT, src : SndSeqPortSubscribeT) : Void

    fun snd_seq_port_subscribe_get_sender(info : SndSeqPortSubscribeT) : SndSeqAddrT*
    fun snd_seq_port_subscribe_get_dest(info : SndSeqPortSubscribeT) : SndSeqAddrT*
    fun snd_seq_port_subscribe_get_queue(info : SndSeqPortSubscribeT) : Int32
    fun snd_seq_port_subscribe_get_exclusive(info : SndSeqPortSubscribeT) : Int32
    fun snd_seq_port_subscribe_get_time_update(info : SndSeqPortSubscribeT) : Int32
    fun snd_seq_port_subscribe_get_time_real(info : SndSeqPortSubscribeT) : Int32

    fun snd_seq_port_subscribe_set_sender(info : SndSeqPortSubscribeT, addr : SndSeqAddrT*) : Void
    fun snd_seq_port_subscribe_set_dest(info : SndSeqPortSubscribeT, addr : SndSeqAddrT*) : Void
    fun snd_seq_port_subscribe_set_queue(info : SndSeqPortSubscribeT, q : Int32) : Void
    fun snd_seq_port_subscribe_set_exclusive(info : SndSeqPortSubscribeT, val : Int32) : Void
    fun snd_seq_port_subscribe_set_time_update(info : SndSeqPortSubscribeT, val : Int32) : Void
    fun snd_seq_port_subscribe_set_time_real(info : SndSeqPortSubscribeT, val : Int32) : Void

    fun snd_seq_get_port_subscription(handle : SndSeqT, sub : SndSeqPortSubscribeT) : Int32
    fun snd_seq_subscribe_port(handle : SndSeqT, sub : SndSeqPortSubscribeT) : Int32
    fun snd_seq_unsubscribe_port(handle : SndSeqT, sub : SndSeqPortSubscribeT) : Int32

    # subscription query container
    alias SndSeqQuerySubscribeT = Void*

    # type of query subscription
    enum SndSeqQuerySubsTypeT
      SND_SEQ_QUERY_SUBS_READ # query read subscriptions
      SND_SEQ_QUERY_SUBS_WRITE # query write subscriptions
    end

    fun snd_seq_query_subscribe_sizeof() : LibC::SizeT
    fun snd_seq_query_subscribe_malloc(ptr : SndSeqQuerySubscribeT*) : Int32
    fun snd_seq_query_subscribe_free(ptr : SndSeqQuerySubscribeT) : Void
    fun snd_seq_query_subscribe_copy(dst : SndSeqQuerySubscribeT, src : SndSeqQuerySubscribeT) : Void

    fun snd_seq_query_subscribe_get_client(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_port(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_root(info : SndSeqQuerySubscribeT) : SndSeqAddrT*
    fun snd_seq_query_subscribe_get_type(info : SndSeqQuerySubscribeT) : SndSeqQuerySubsTypeT
    fun snd_seq_query_subscribe_get_index(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_num_subs(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_addr(info : SndSeqQuerySubscribeT) : SndSeqAddrT*
    fun snd_seq_query_subscribe_get_queue(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_exclusive(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_time_update(info : SndSeqQuerySubscribeT) : Int32
    fun snd_seq_query_subscribe_get_time_real(info : SndSeqQuerySubscribeT) : Int32

    fun snd_seq_query_subscribe_set_client(info : SndSeqQuerySubscribeT, client : Int32) : Void
    fun snd_seq_query_subscribe_set_port(info : SndSeqQuerySubscribeT, port : Int32) : Void
    fun snd_seq_query_subscribe_set_root(info : SndSeqQuerySubscribeT, addr : SndSeqAddrT*) : Void
    fun snd_seq_query_subscribe_set_type(info : SndSeqQuerySubscribeT, type : SndSeqQuerySubsTypeT) : Void
    fun snd_seq_query_subscribe_set_index(info : SndSeqQuerySubscribeT, index : Int32) : Void

    fun snd_seq_query_port_subscribers(seq : SndSeqT, subs : SndSeqQuerySubscribeT) : Int32


    # Sequencer Queue Interface

    # queue information container
    alias SndSeqQueueInfoT = Void*
    # queue status container
    alias SndSeqQueueStatusT = Void*
    # queue tempo container
    alias SndSeqQueueTempoT = Void*
    # queue timer information container
    alias SndSeqQueueTimerT = Void*

    # special queue ids
    SND_SEQ_QUEUE_DIRECT = 253 # direct dispatch

    fun snd_seq_queue_info_sizeof() : LibC::SizeT
    fun snd_seq_queue_info_malloc(ptr : SndSeqQueueInfoT*) : Int32
    fun snd_seq_queue_info_free(ptr : SndSeqQueueInfoT);
    fun snd_seq_queue_info_copy(dst : SndSeqQueueInfoT, src : SndSeqQueueInfoT);

    fun snd_seq_queue_info_get_queue(info : SndSeqQueueInfoT) : Int32
    fun snd_seq_queue_info_get_name(info : SndSeqQueueInfoT);
    fun snd_seq_queue_info_get_owner(info : SndSeqQueueInfoT) : Int32
    fun snd_seq_queue_info_get_locked(info : SndSeqQueueInfoT) : Int32
    fun snd_seq_queue_info_get_flags(info : SndSeqQueueInfoT) : UInt32

    fun snd_seq_queue_info_set_name(info : SndSeqQueueInfoT, name : UInt8*) : Void
    fun snd_seq_queue_info_set_owner(info : SndSeqQueueInfoT, owner : Int32) : Void
    fun snd_seq_queue_info_set_locked(info : SndSeqQueueInfoT, locked : Int32) : Void
    fun snd_seq_queue_info_set_flags(info : SndSeqQueueInfoT, flags : UInt32) : Void

    fun snd_seq_create_queue(seq : SndSeqT, info : SndSeqQueueInfoT) : Int32
    fun snd_seq_alloc_named_queue(seq : SndSeqT, name : UInt8*) : Int32
    fun snd_seq_alloc_queue(handle : SndSeqT) : Int32
    fun snd_seq_free_queue(handle : SndSeqT, q : Int32) : Int32
    fun snd_seq_get_queue_info(seq : SndSeqT, q : Int32, info : SndSeqQueueInfoT) : Int32
    fun snd_seq_set_queue_info(seq : SndSeqT, q : Int32, info : SndSeqQueueInfoT) : Int32
    fun snd_seq_query_named_queue(seq : SndSeqT, name : UInt8*) : Int32

    fun snd_seq_get_queue_usage(handle : SndSeqT, q : Int32) : Int32
    fun snd_seq_set_queue_usage(handle : SndSeqT, q : Int32, used : Int32) : Int32

    fun snd_seq_queue_status_sizeof() : LibC::SizeT
    fun snd_seq_queue_status_malloc(ptr : SndSeqQueueStatusT*) : Int32
    fun snd_seq_queue_status_free(ptr : SndSeqQueueStatusT) : Void
    fun snd_seq_queue_status_copy(dst : SndSeqQueueStatusT, src : SndSeqQueueStatusT) : Void

    fun snd_seq_queue_status_get_queue(info : SndSeqQueueStatusT) : Int32
    fun snd_seq_queue_status_get_events(info : SndSeqQueueStatusT) : Int32
    fun snd_seq_queue_status_get_tick_time(info : SndSeqQueueStatusT) : SndSeqTickTimeT*
    fun snd_seq_queue_status_get_real_time(info : SndSeqQueueStatusT) : SndSeqRealTimeT*
    fun snd_seq_queue_status_get_status(info : SndSeqQueueStatusT) : UInt32

    fun snd_seq_get_queue_status(handle : SndSeqT, q : Int32, status : SndSeqQueueStatusT) : Int32

    fun snd_seq_queue_tempo_sizeof() : LibC::SizeT
    fun snd_seq_queue_tempo_malloc(ptr : SndSeqQueueTempoT*) : Int32
    fun snd_seq_queue_tempo_free(ptr : SndSeqQueueTempoT) : Void
    fun snd_seq_queue_tempo_copy(dst : SndSeqQueueTempoT, src : SndSeqQueueTempoT) : Void

    fun snd_seq_queue_tempo_get_queue(info : SndSeqQueueTempoT) : Int32
    fun snd_seq_queue_tempo_get_tempo(info : SndSeqQueueTempoT) : UInt32
    fun snd_seq_queue_tempo_get_ppq(info : SndSeqQueueTempoT) : Int32
    fun snd_seq_queue_tempo_get_skew(info : SndSeqQueueTempoT) : UInt32
    fun snd_seq_queue_tempo_get_skew_base(info : SndSeqQueueTempoT) : UInt32
    fun snd_seq_queue_tempo_set_tempo(info : SndSeqQueueTempoT, tempo : UInt32) : Void
    fun snd_seq_queue_tempo_set_ppq(info : SndSeqQueueTempoT, ppq : Int32) : Void
    fun snd_seq_queue_tempo_set_skew(info : SndSeqQueueTempoT, skew : UInt32) : Void
    fun snd_seq_queue_tempo_set_skew_base(info : SndSeqQueueTempoT, base : UInt32) : Void

    fun snd_seq_get_queue_tempo(handle : SndSeqT, q : Int32, tempo : SndSeqQueueTempoT) : Int32
    fun snd_seq_set_queue_tempo(handle : SndSeqT, q : Int32, tempo : SndSeqQueueTempoT) : Int32


    # sequencer timer sources
    enum SndSeqQueueTimerTypeT
      SND_SEQ_TIMER_ALSA = 0 # ALSA timer
      SND_SEQ_TIMER_MIDI_CLOCK = 1 # Midi Clock (CLOCK event)
      SND_SEQ_TIMER_MIDI_TICK = 2 # Midi Timer Tick (TICK event
    end

    fun snd_seq_queue_timer_sizeof() : LibC::SizeT
    fun snd_seq_queue_timer_malloc(ptr : SndSeqQueueTimerT*) : Int32
    fun snd_seq_queue_timer_free(ptr : SndSeqQueueTimerT) : Void
    fun snd_seq_queue_timer_copy(dst : SndSeqQueueTimerT, src : SndSeqQueueTimerT) : Void

    fun snd_seq_queue_timer_get_queue(info : SndSeqQueueTimerT) : Int32
    fun snd_seq_queue_timer_get_type(info : SndSeqQueueTimerT) : SndSeqQueueTimerTypeT
    fun snd_seq_queue_timer_get_id(info : SndSeqQueueTimerT) : SndTimerIdT
    fun snd_seq_queue_timer_get_resolution(info : SndSeqQueueTimerT) : UInt32

    fun snd_seq_queue_timer_set_type(info : SndSeqQueueTimerT, type : SndSeqQueueTimerTypeT) : Void
    fun snd_seq_queue_timer_set_id(info : SndSeqQueueTimerT, id : SndTimerIdT) : Void
    fun snd_seq_queue_timer_set_resolution(info : SndSeqQueueTimerT, resolution : UInt32) : Void

    fun snd_seq_get_queue_timer(handle : SndSeqT, q : Int32, timer : SndSeqQueueTimerT) : Int32
    fun snd_seq_set_queue_timer(handle : SndSeqT, q : Int32, timer : SndSeqQueueTimerT) : Int32

    # Sequencer Event API

    fun snd_seq_free_event(ev : SndSeqEventT*) : Int32
    fun snd_seq_event_length(ev : SndSeqEventT*) : LibC::SizeT
    fun snd_seq_event_output(handle : SndSeqT, ev : SndSeqEventT*) : Int32
    fun snd_seq_event_output_buffer(handle : SndSeqT, ev : SndSeqEventT*) : Int32
    fun snd_seq_event_output_direct(handle : SndSeqT, ev : SndSeqEventT*) : Int32
    fun snd_seq_event_input(handle : SndSeqT, ev : SndSeqEventT**) : Int32
    fun snd_seq_event_input_pending(seq : SndSeqT, fetch_sequencer : Int32) : Int32
    fun snd_seq_drain_output(handle : SndSeqT) : Int32
    fun snd_seq_event_output_pending(seq : SndSeqT) : Int32
    fun snd_seq_extract_output(handle : SndSeqT, ev : SndSeqEventT**) : Int32
    fun snd_seq_drop_output(handle : SndSeqT) : Int32
    fun snd_seq_drop_output_buffer(handle : SndSeqT) : Int32
    fun snd_seq_drop_input(handle : SndSeqT) : Int32
    fun snd_seq_drop_input_buffer(handle : SndSeqT) : Int32

    # event removal conditionals
    alias SndSeqRemoveEventsT = Void*

    # Remove conditional flags
    SND_SEQ_REMOVE_INPUT = (1<<0) # Flush input queues
    SND_SEQ_REMOVE_OUTPUT = (1<<1) # Flush output queues
    SND_SEQ_REMOVE_DEST = (1<<2) # Restrict by destination q:client:port
    SND_SEQ_REMOVE_DEST_CHANNEL = (1<<3) # Restrict by channel
    SND_SEQ_REMOVE_TIME_BEFORE = (1<<4) # Restrict to before time
    SND_SEQ_REMOVE_TIME_AFTER = (1<<5) # Restrict to time or after
    SND_SEQ_REMOVE_TIME_TICK = (1<<6) # Time is in ticks
    SND_SEQ_REMOVE_EVENT_TYPE = (1<<7) # Restrict to event type
    SND_SEQ_REMOVE_IGNORE_OFF = (1<<8) # Do not flush off events
    SND_SEQ_REMOVE_TAG_MATCH = (1<<9) # Restrict to events with given tag

    fun snd_seq_remove_events_sizeof() : LibC::SizeT
    fun snd_seq_remove_events_malloc(ptr : SndSeqRemoveEventsT*) : Int32
    fun snd_seq_remove_events_free(ptr : SndSeqRemoveEventsT) : Void
    fun snd_seq_remove_events_copy(dst : SndSeqRemoveEventsT, src : SndSeqRemoveEventsT) : Void

    fun snd_seq_remove_events_get_condition(info : SndSeqRemoveEventsT) : UInt32
    fun snd_seq_remove_events_get_queue(info : SndSeqRemoveEventsT) : Int32
    fun snd_seq_remove_events_get_time(info : SndSeqRemoveEventsT) : SndSeqTimestampT*
    fun snd_seq_remove_events_get_dest(info : SndSeqRemoveEventsT) : SndSeqAddrT*
    fun snd_seq_remove_events_get_channel(info : SndSeqRemoveEventsT) : Int32
    fun snd_seq_remove_events_get_event_type(info : SndSeqRemoveEventsT) : Int32
    fun snd_seq_remove_events_get_tag(info : SndSeqRemoveEventsT) : Int32

    fun snd_seq_remove_events_set_condition(info : SndSeqRemoveEventsT, flags : UInt32) : Void
    fun snd_seq_remove_events_set_queue(info : SndSeqRemoveEventsT, queue : Int32) : Void
    fun snd_seq_remove_events_set_time(info : SndSeqRemoveEventsT, time : SndSeqTimestampT*) : Void
    fun snd_seq_remove_events_set_dest(info : SndSeqRemoveEventsT, addr : SndSeqAddrT*) : Void
    fun snd_seq_remove_events_set_channel(info : SndSeqRemoveEventsT,  channel : Int32) : Void
    fun snd_seq_remove_events_set_event_type(info : SndSeqRemoveEventsT, type : Int32) : Void
    fun snd_seq_remove_events_set_tag(info : SndSeqRemoveEventsT, tag : Int32) : Void

    fun snd_seq_remove_events(handle : SndSeqT, info : SndSeqRemoveEventsT) : Int32

    # Sequencer Miscellaneous

    fun snd_seq_set_bit(nr : Int32, array : Void*) : Void
    fun snd_seq_unset_bit(nr : Int32, array : Void*) : Void
    fun snd_seq_change_bit(nr : Int32, array : Void*) : Int32
    fun snd_seq_get_bit(nr : Int32, array : Void*) : Int32

    # Sequencer Event Type Checks

    # event type macros
    SND_SEQ_EVFLG_RESULT = 0
    SND_SEQ_EVFLG_NOTE = 1
    SND_SEQ_EVFLG_CONTROL = 2
    SND_SEQ_EVFLG_QUEUE = 3
    SND_SEQ_EVFLG_SYSTEM = 4
    SND_SEQ_EVFLG_MESSAGE = 5
    SND_SEQ_EVFLG_CONNECTION = 6
    SND_SEQ_EVFLG_SAMPLE = 7
    SND_SEQ_EVFLG_USERS = 8
    SND_SEQ_EVFLG_INSTR = 9
    SND_SEQ_EVFLG_QUOTE = 10
    SND_SEQ_EVFLG_NONE = 11
    SND_SEQ_EVFLG_RAW = 12
    SND_SEQ_EVFLG_FIXED = 13
    SND_SEQ_EVFLG_VARIABLE = 14
    SND_SEQ_EVFLG_VARUSR = 15

    SND_SEQ_EVFLG_NOTE_ONEARG = 0
    SND_SEQ_EVFLG_NOTE_TWOARG = 1

    SND_SEQ_EVFLG_QUEUE_NOARG = 0
    SND_SEQ_EVFLG_QUEUE_TICK = 1
    SND_SEQ_EVFLG_QUEUE_TIME = 2
    SND_SEQ_EVFLG_QUEUE_VALUE = 3
  end

  @[AlwaysInline]
  def self.snd_seq_system_info_alloca : ASound::SndSeqSystemInfoT
    LibC.malloc(ASound.snd_seq_system_info_sizeof).as(ASound::SndSeqSystemInfoT)
  end

  @[AlwaysInline]
  def self.snd_seq_client_info_alloca : ASound::SndSeqClientInfoT
    LibC.malloc(ASound.snd_seq_client_info_sizeof).as(ASound::SndSeqClientInfoT)
  end

  @[AlwaysInline]
  def self.snd_seq_client_pool_alloca : ASound::SndSeqClientPoolT
    LibC.malloc(ASound.snd_seq_client_pool_sizeof).as(ASound::SndSeqClientPoolT)
  end

  @[AlwaysInline]
  def self.snd_seq_port_info_alloca : ASound::SndSeqPortInfoT
    LibC.malloc(ASound.snd_seq_port_info_sizeof).as(ASound::SndSeqPortInfoT)
  end

  @[AlwaysInline]
  def self.snd_seq_port_subscribe_alloca : ASound::SndSeqPortSubscribeT
    LibC.malloc(ASound.snd_seq_port_subscribe_sizeof).as(ASound::SndSeqPortSubscribeT)
  end

  @[AlwaysInline]
  def self.snd_seq_query_subscribe_alloca : ASound::SndSeqQuerySubscribeT
    LibC.malloc(ASound.snd_seq_query_subscribe_sizeof).as(ASound::SndSeqQuerySubscribeT)
  end

  @[AlwaysInline]
  def self.snd_seq_queue_info_alloca : ASound::SndSeqQueueInfoT
    LibC.malloc(ASound.snd_seq_queue_info_sizeof).as(ASound::SndSeqQueueInfoT)
  end

  @[AlwaysInline]
  def self.snd_seq_queue_status_alloca : ASound::SndSeqQueueStatusT
    LibC.malloc(ASound.snd_seq_queue_status_sizeof).as(ASound::SndSeqQueueStatusT)
  end

  @[AlwaysInline]
  def self.snd_seq_queue_tempo_alloca : ASound::SndSeqQueueTempoT
    LibC.malloc(ASound.snd_seq_queue_tempo_sizeof).as(ASound::SndSeqQueueTempoT)
  end

  @[AlwaysInline]
  def self.snd_seq_queue_timer_alloca : ASound::SndSeqQueueTimerT
    LibC.malloc(ASound.snd_seq_queue_timer_sizeof).as(ASound::SndSeqQueueTimerT)
  end

  @[AlwaysInline]
  def self.snd_seq_remove_events_alloca : ASound::SndSeqRemoveEventsT
    LibC.malloc(ASound.snd_seq_remove_events_sizeof).as(ASound::SndSeqRemoveEventsT)
  end

  # Exported event type table
  # This table is referred by snd_seq_ev_is_xxx.
  @@snd_seq_event_types = [] of UInt32

  # master type - 24bit
  def self.snd_seq_type(x)
    1 << x
  end

  # optional type - 8bit
  def self.snd_seq_type_opt(x)
    x << 24
  end

  # check the event type
  def self.snd_seq_type_check(ev, x)
    @@snd_seq_event_types[ev.type] & snd_seq_type(x)
  end

  # event type check: result events
  def self.snd_seq_ev_is_result_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_RESULT)
  end

  # event type check: note events
  def self.snd_seq_ev_is_note_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_NOTE)
  end

  # event type check: control events
  def self.snd_seq_ev_is_control_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_CONTROL)
  end

  # event type check: channel specific events
  def self.snd_seq_ev_is_channel_type(ev)
    (snd_seq_event_types[ev.type] & (snd_seq_type(ASound::SND_SEQ_EVFLG_NOTE) | snd_seq_type(ASound::SND_SEQ_EVFLG_CONTROL)))
  end

  # event type check: queue control events
  def self.snd_seq_ev_is_queue_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_QUEUE)
  end

  # event type check: system status messages
  def self.snd_seq_ev_is_message_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_MESSAGE)
  end

  # event type check: system status messages
  def self.snd_seq_ev_is_subscribe_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_CONNECTION)
  end

  # event type check: sample messages
  def self.snd_seq_ev_is_sample_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_SAMPLE)
  end

  # event type check: user-defined messages
  def self.snd_seq_ev_is_user_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_USERS)
  end

  # event type check: instrument layer events
  def self.snd_seq_ev_is_instr_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_INSTR)
  end

  # event type check: fixed length events
  def self.snd_seq_ev_is_fixed_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_FIXED)
  end

  # event type check: variable length events
  def self.snd_seq_ev_is_variable_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_VARIABLE)
  end

  # event type check: user pointer events
  def self.snd_seq_ev_is_varusr_type(ev)
    snd_seq_type_check(ev, ASound::SND_SEQ_EVFLG_VARUSR)
  end

  # event type check: reserved for kernel
  def self.snd_seq_ev_is_reserved(ev)
    !snd_seq_event_types[ev.type]
  end

  # macros to check event flags

  # prior events

  def self.snd_seq_ev_is_prior(ev)
    (ev.flags & ASound::SND_SEQ_PRIORITY_MASK) == ASound::SND_SEQ_PRIORITY_HIGH
  end

  # get the data length type
  def self.snd_seq_ev_length_type(ev)
    ev.flags & ASound::SND_SEQ_EVENT_LENGTH_MASK
  end

  # fixed length events
  def self.snd_seq_ev_is_fixed(ev)
    snd_seq_ev_length_type(ev) == ASound::SND_SEQ_EVENT_LENGTH_FIXED
  end

  # variable length events
  def self.snd_seq_ev_is_variable(ev)
    snd_seq_ev_length_type(ev) == ASound::SND_SEQ_EVENT_LENGTH_VARIABLE
  end

  # variable length on user-space
  def self.snd_seq_ev_is_varusr(ev)
    snd_seq_ev_length_type(ev) == ASound::SND_SEQ_EVENT_LENGTH_VARUSR
  end

  # time-stamp type
  def self.snd_seq_ev_timestamp_type(ev)
    ev.flags & ASound::SND_SEQ_TIME_STAMP_MASK
  end

  # event is in tick time
  def self.snd_seq_ev_is_tick(ev)
    snd_seq_ev_timestamp_type(ev) == ASound::SND_SEQ_TIME_STAMP_TICK
  end

  # event is in real-time
  def self.snd_seq_ev_is_real(ev)
    snd_seq_ev_timestamp_type(ev) == ASound::SND_SEQ_TIME_STAMP_REAL
  end

  # time-mode type
  def self.snd_seq_ev_timemode_type(ev)
    ev.flags & ASound::SND_SEQ_TIME_MODE_MASK
  end

  # scheduled in absolute time
  def self.snd_seq_ev_is_abstime(ev)
    snd_seq_ev_timemode_type(ev) == ASound::SND_SEQ_TIME_MODE_ABS
  end

  # scheduled in relative time
  def self.snd_seq_ev_is_reltime(ev)
    snd_seq_ev_timemode_type(ev) == ASound::SND_SEQ_TIME_MODE_REL
  end

  # direct dispatched events
  def self.snd_seq_ev_is_direct(ev)
    ev.queue == ASound::SND_SEQ_QUEUE_DIRECT
  end
end
