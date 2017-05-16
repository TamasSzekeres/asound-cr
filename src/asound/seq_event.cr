module ALSA
  @[Link("asound")]
  lib ASound
    # Sequencer Event Definitions

    # Sequencer event type
    enum SndSeqEventTypeT : UInt8
      # system status; event data type = #snd_seq_result_t
      SND_SEQ_EVENT_SYSTEM = 0
      # returned result status; event data type = #snd_seq_result_t
      SND_SEQ_EVENT_RESULT

      # note on and off with duration; event data type = #snd_seq_ev_note_t
      SND_SEQ_EVENT_NOTE = 5
      # note on; event data type = #snd_seq_ev_note_t
      SND_SEQ_EVENT_NOTEON
      # note off; event data type = #snd_seq_ev_note_t
      SND_SEQ_EVENT_NOTEOFF
      # key pressure change (aftertouch); event data type = #snd_seq_ev_note_t
      SND_SEQ_EVENT_KEYPRESS

      # controller; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_CONTROLLER = 10
      # program change; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_PGMCHANGE
      # channel pressure; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_CHANPRESS
      # pitchwheel; event data type = #snd_seq_ev_ctrl_t; data is from -8192 to 8191)
      SND_SEQ_EVENT_PITCHBEND
      # 14 bit controller value; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_CONTROL14
      # 14 bit NRPN;  event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_NONREGPARAM
      # 14 bit RPN; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_REGPARAM

      # SPP with LSB and MSB values; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_SONGPOS = 20
      # Song Select with song ID number; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_SONGSEL
      # midi time code quarter frame; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_QFRAME
      # SMF Time Signature event; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_TIMESIGN
      # SMF Key Signature event; event data type = #snd_seq_ev_ctrl_t
      SND_SEQ_EVENT_KEYSIGN

      # MIDI Real Time Start message; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_START = 30
      # MIDI Real Time Continue message; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_CONTINUE
      # MIDI Real Time Stop message; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_STOP
      # Set tick queue position; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_SETPOS_TICK
      # Set real-time queue position; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_SETPOS_TIME
      # (SMF) Tempo event; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_TEMPO
      # MIDI Real Time Clock message; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_CLOCK
      # MIDI Real Time Tick message; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_TICK
      # Queue timer skew; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_QUEUE_SKEW
      # Sync position changed; event data type = #snd_seq_ev_queue_control_t
      SND_SEQ_EVENT_SYNC_POS

      # Tune request; event data type = none
      SND_SEQ_EVENT_TUNE_REQUEST = 40
      # Reset to power-on state; event data type = none
      SND_SEQ_EVENT_RESET
      # Active sensing event; event data type = none
      SND_SEQ_EVENT_SENSING

      # Echo-back event; event data type = any type
      SND_SEQ_EVENT_ECHO = 50
      # OSS emulation raw event; event data type = any type
      SND_SEQ_EVENT_OSS

      # New client has connected; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_CLIENT_START = 60
      # Client has left the system; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_CLIENT_EXIT
      # Client status/info has changed; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_CLIENT_CHANGE
      # New port was created; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_PORT_START
      # Port was deleted from system; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_PORT_EXIT
      # Port status/info has changed; event data type = #snd_seq_addr_t
      SND_SEQ_EVENT_PORT_CHANGE

      # Ports connected; event data type = #snd_seq_connect_t
      SND_SEQ_EVENT_PORT_SUBSCRIBED
      # Ports disconnected; event data type = #snd_seq_connect_t
      SND_SEQ_EVENT_PORT_UNSUBSCRIBED

      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR0 = 90
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR1
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR2
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR3
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR4
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR5
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR6
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR7
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR8
      # user-defined event; event data type = any (fixed size)
      SND_SEQ_EVENT_USR9

      # system exclusive data (variable length);  event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_SYSEX = 130
      # error event;  event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_BOUNCE
      # reserved for user apps;  event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_USR_VAR0 = 135
      # reserved for user apps; event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_USR_VAR1
      # reserved for user apps; event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_USR_VAR2
      # reserved for user apps; event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_USR_VAR3
      # reserved for user apps; event data type = #snd_seq_ev_ext_t
      SND_SEQ_EVENT_USR_VAR4

      # NOP; ignored in any case
      SND_SEQ_EVENT_NONE = 255
    end

    # Sequencer event address
    struct SndSeqAddrT
      client : UInt8* # Client id
      port : UInt8* # Port id
    end

    # Connection (subscription) between ports
    struct SndSeqConnectT
      sender : SndSeqAddrT # sender address
      dest : SndSeqAddrT # destination address
    end

    # Real-time data record
    struct SndSeqRealTimeT
      tv_sec : UInt32 # seconds
      tv_nsec : UInt32 # nanoseconds
    end

    # (MIDI) Tick-time data record
    alias SndSeqTickTimeT = UInt32

    # unioned time stamp
    union SndSeqTimestampT
      tick : SndSeqTickTimeT # tick-time
      time : SndSeqRealTimeT # real-time
    end


    # Event mode flags
    #
    # NOTE: only 8 bits available!
    SND_SEQ_TIME_STAMP_TICK = (0_u8 << 0) # timestamp in clock ticks
    SND_SEQ_TIME_STAMP_REAL = (1_u8 << 0) # timestamp in real time
    SND_SEQ_TIME_STAMP_MASK = (1_u8 << 0) # mask for timestamp bits

    SND_SEQ_TIME_MODE_ABS = (0_u8 << 1) # absolute timestamp
    SND_SEQ_TIME_MODE_REL = (1_u8 << 1) # relative to current time
    SND_SEQ_TIME_MODE_MASK = (1_u8 << 1) # mask for time mode bits

    SND_SEQ_EVENT_LENGTH_FIXED = (0_u8 << 2) #  fixed event size
    SND_SEQ_EVENT_LENGTH_VARIABLE = (1_u8 << 2) # variable event size
    SND_SEQ_EVENT_LENGTH_VARUSR = (2_u8 << 2) # variable event size - user memory space
    SND_SEQ_EVENT_LENGTH_MASK = (3_u8 << 2) # mask for event length bits

    SND_SEQ_PRIORITY_NORMAL = (0_u8 << 4) # normal priority
    SND_SEQ_PRIORITY_HIGH = (1_u8 << 4) # event should be processed before others
    SND_SEQ_PRIORITY_MASK = (1_u8 << 4) # mask for priority bits


    # Note event
    struct SndSeqEvNoteT
      channel : UInt8 # channel number
      note : UInt8 # note
      velocity : UInt8 # velocity
      off_velocity : UInt8 # note-off velocity; only for #SND_SEQ_EVENT_NOTE
      duration : UInt32 # duration until note-off; only for #SND_SEQ_EVENT_NOTE
    end

    # Controller event
    struct SndSeqEvCtrlT
      channel : UInt8 # channel number
      unused : UInt8[3] # reserved
      param : UInt32 # control parameter
      value : Int32 # control value
    end

    # generic set of bytes (12x8 bit)
    struct SndSeqEvRaw8T
      d : UInt8[12] # 8 bit value
    end

    # generic set of integers (3x32 bit)
    struct SndSeqEvRaw32T
      d : UInt32[3] # 32 bit value
    end

    # external stored data
    @[Packed]
    struct SndSeqEvExtT
      len: UInt32 # length of data
      ptr : Void* # pointer to data (note: can be 64-bit)
    end

    # Result events
    struct SndSeqResultT
      event : Int32 # processed event type
      result : Int32 # status
    end

    # Queue skew values
    struct SndSeqQueueSkewT
      value : UInt32 # skew value
      base : UInt32 # skew base
    end

    # queue timer control-param
    union SndSeqEvQueueControlParamT
      value : Int32 # affected value (e.g. tempo)
      time : SndSeqTimestampT # time
      position : UInt32 # sync position
      skew : SndSeqQueueSkewT # queue skew
      d32 : UInt32[2] # any data
      d8 : UInt8[8] # any data
    end

    # queue timer control
    struct SndSeqEvQueueControlT
      queue : UInt8 # affected queue
      unused : UInt8[3] # reserved
      param : SndSeqEvQueueControlParamT # data value union
    end

    # Sequencer event-data
    union SndSeqEventDataT
      note : SndSeqEvNoteT # note information
      control : SndSeqEvCtrlT # MIDI control information
      raw8 : SndSeqEvRaw8T # raw8 data
      raw32 : SndSeqEvRaw32T # raw32 data
      ext : SndSeqEvExtT # external data
      queue : SndSeqEvQueueControlT # queue control
      time : SndSeqTimestampT # timestamp
      addr : SndSeqAddrT # address
      connect : SndSeqConnectT # connect information
      result : SndSeqResultT # operation result code
    end

    # Sequencer event
    struct SndSeqEventT
      type : SndSeqEventTypeT # event type
      flags : UInt8 # event flags
      tag : UInt8 # tag

      queue : UInt8 # schedule queue
      time : SndSeqTimestampT # schedule time

      source : SndSeqAddrT # source address
      dest : SndSeqAddrT # destination address

      data : SndSeqEventDataT # event data...
    end
  end
end
