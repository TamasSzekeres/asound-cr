require "./c/global"

module ALSA
  include ALSA::C

  # Wrapper for ASound::Timeval.
  struct Timeval
    def initialize
      @timeval = ASound::Timeval.new
    end

    def initialize(seconds : LibC::TimeT, microseconds : Int64)
      @timeval = ASound::Timeval.new
      @timeval.tv_sec = seconds
      @timeval.tv_usec = microseconds
    end

    def initialize(@timeval : ASound::Timeval)
    end

    def seconds : LibC::TimeT
      @timeval.tv_sec
    end

    def seconds=(seconds : LibC::TimeT)
      @timeval.tv_sec = seconds
    end

    def microseconds : Int64
      @timeval.tv_usec
    end

    def microseconds=(microseconds : Int64)
      @timeval.tv_usec = microseconds
    end

    def timeval : ASound::Timeval
      @timeval
    end
  end
end
