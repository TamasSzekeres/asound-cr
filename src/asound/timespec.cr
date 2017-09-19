require "./c/global"

module ALSA
  include ALSA::C

  # Wrapper for ASound::Timespec.
  struct Timespec
    def initialize
      @timespec = ASound::Timespec.new
    end

    def initialize(seconds : LibC::TimeT, nanoseconds : Int64)
      @timespec = ASound::Timespec.new
      @timespec.tv_sec = seconds
      @timespec.tv_nsec = nanoseconds
    end

    def initialize(@timespec : ASound::Timespec)
    end

    def seconds : LibC::TimeT
      @timespec.tv_sec
    end

    def seconds=(seconds : LibC::TimeT)
      @timespec.tv_sec = seconds
    end

    def nanoseconds : Int64
      @timespec.tv_nsec
    end

    def nanoseconds=(nanoseconds : Int64)
      @timespec.tv_nsec = nanoseconds
    end

    def timespec : ASound::Timespec
      @timespec
    end
  end
end
