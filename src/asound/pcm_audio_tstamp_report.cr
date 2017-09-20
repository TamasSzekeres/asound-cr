require "./c/pcm"

module ALSA
  include ALSA::C

  # Wrapper for ASound::SndPcmAudioTstampReportT
  struct PcmAudioTstampReport
    def initialize
      @report = ASound::SndPcmAudioTstampReportT.new
    end

    def initialize(@report : ASound::SndPcmAudioTstampReportT)
    end

    def is_valid? : Bool
      valid == 1_u16
    end

    def valid : UInt16
      @report.bits & 1_u16
    end

    def valid=(valid : UInt16)
      bit = valid & 1_u16
      if bit == 1_u16
        @report.bits |= 1_u16
      else
        @report.bits &= ~1_u16
      end
    end

    def actual_type : UInt16
      (@report.bits >> 1_u16) & 7_u16
    end

    def actual_type=(actual_type : UInt16)
      bits = (actual_type & 7_u16) << 1_u16
      @report.bits &= ~(14_u16)
      @report.bits |= bits
    end

    def accuracy_report : UInt16
      (@report.bits >> 5_u16) & 1_u16
    end

    def accuracy_report=(accuracy_report : UInt16)
      bit = accuracy_report & 1_u16
      if bit == 1_u16
        @report.bits |= (1_u16 << 5_u16)
      else
        @report.bits &= ~(1_u16 << 5_u16)
      end
    end

    def bits : UInt16
      @report.bits
    end

    def bits=(bits : UInt16)
      @report.bits = bits
    end

    def accuracy : UInt16
      @report.accuracy
    end

    def accuracy=(accuracy : UInt16)
      @report.accuracy = accuracy
    end

    # Returns the underlieing structure.
    def report : ASound::SndPcmAudioTstampReportT
      @report
    end
  end
end
