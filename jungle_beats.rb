require 'pry'
require './lib/node'
require './lib/linked_list'

# Avoid using other ruby collections
# (Arrays, Hashes, etc) for the storage
# of your beats.
# That’s where you’re supposed to use the
# linked list.
# But having Arrays elsewhere in your code,
# or using methods that return arrays
# (like .split) are totally ok.

class JungleBeats
  attr_reader :list
  attr_accessor :voice, :rate
  def initialize
    @list = LinkedList.new
    @allowed = %w(tee dee deep bop boop la na ding dah oom doo ditt)
    @voice = "Boing"
    @rate = 500
  end
  def append(beats)
    split_beats = beats.split
    added_beats = []
    split_beats.each do |beat|
      if @allowed.include? beat
        list.append(beat)
        added_beats << beat
      end
    end
    added_beats.join(" ")
  end

  def all
    list.to_string
  end

  def count
    list.count
  end

  def reset_rate
    rate = 500
  end

  def reset_voice
    voice = "Boing"
  end

  def play
    beats = all
    puts `say -r #{rate} -v #{voice} #{beats}`
  end

end
#
# beats = JungleBeats.new
# beats.append("tee dee deep bop boop la na ding dah oom doo ditt")
# beats.append("tee dee deep bop boop la na ding dah oom doo ditt")
# beats.play
