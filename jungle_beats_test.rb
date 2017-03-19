require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'jungle_beats'

class JungleBeatsTest < MiniTest::Test
  def test_node_class_exists
    node = Node.new
    assert node
  end
  def test_node_data_returns_input_data
    node = Node.new("plop")
    assert_equal "plop", node.data
  end
  def test_node_next_node_nil_when_no_next
    node = Node.new("plop")
    assert_nil node.next_node
  end

  def test_linked_list_exists
    list = LinkedList.new
    assert list
  end
  def test_linked_list_initial_head_nil
    list = LinkedList.new
    assert_nil list.head
  end
  def test_linked_list_append_data
    list = LinkedList.new
    assert_equal "doop", list.append("doop")
    assert_equal 1, list.count
    list.append("plop")
    assert_equal 2, list.count
    list.append("deep")
    assert_equal 3, list.count
    assert_equal "doop plop deep", list.to_string
  end
  def test_linked_list_returns_next_node
    list = LinkedList.new
    list.append("doop")
    assert_nil list.head.next_node
    list.append("deep")
    refute_nil list.head.next_node
  end
  def test_linked_list_counts_nodes
    list = LinkedList.new
    assert_equal 0 , list.count
    list.append("doop")
    assert_equal 1, list.count
  end
  def test_linked_list_to_string_string
    list = LinkedList.new
    list.append("doop")
    assert_instance_of String, list.to_string
    list.append(["a"])
    assert_instance_of String, list.to_string
  end
  def test_linked_list_second_node_becomes_next_for_head
    list = LinkedList.new
    assert_nil list.head
    list.append("doop")
    assert_equal list.head.data, "doop"
    assert_nil list.head.next_node
    list.append("deep")
    assert_equal list.head.data, "doop"
    assert_equal list.head.next_node.data, "deep"
    assert_equal 2, list.count
    assert_equal list.to_string, "doop deep"
  end
  def test_linked_list_prepends_data
    list = LinkedList.new
    assert_equal "plop", list.append("plop")
    assert_equal "plop", list.to_string
    list.append("suu")
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end
  def test_linked_list_insert_data
    # skip
    list = LinkedList.new
    list.append("dop")
    list.append("plop")
    list.append("suu")
    assert_equal 3, list.count

    list.insert(1, "woo")
    assert_equal 4, list.count
    assert_equal "dop woo plop suu", list.to_string
  end
  def test_linked_list_find
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "shi", list.find(2,1)

    assert_equal "woo shi shu", list.find(1,3)
  end
  def test_includes_finds_data
    list = LinkedList.new
    list.append("deep")
    assert list.includes?("deep")
    refute list.includes?("dep")
  end
  def test_pop_removes_last
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "blop", list.pop
    assert_equal "deep woo shi shu", list.to_string
    assert_equal "shu", list.pop
    assert_equal "deep woo shi", list.to_string
  end

  def test_junglebeats_exists
    beats = JungleBeats.new
    assert beats
  end
  def test_junglebeats_creates_empty_list
    beats = JungleBeats.new
    assert beats.list
    assert_nil beats.list.head
  end
  def test_junglebeats_appends_splits_and_appends_to_list
    beats = JungleBeats.new
    assert_equal "deep doo ditt", beats.append("deep doo ditt")
    assert_equal "deep", beats.list.head.data
  end
  def test_junglebeats_count_returns_correct_number
    beats = JungleBeats.new
    assert_equal "deep doo ditt", beats.append("deep doo ditt")
    assert_equal "woo hoo shu", beats.append("woo hoo shu")
    assert_equal 6, beats.count
  end

  def test_junglebeats_no_banned_words
    beats = JungleBeats.new
    assert_equal "deep doo ditt", beats.append("deep doo ditt")
    assert_equal 3, beats.count

    assert_equal "deep doo ditt", beats.append("Chris Turing Bad")
    assert_equal 3, beats.count
  end

  def test_junglebeats_update_voice
    beats = JungleBeats.new
    beats.voice = "Alice"
    assert_equal "Alice", beats.voice
  end

  def test_junglebeats_update_rate
    beats = JungleBeats.new
    beats.rate = 100
    assert_equal 100, beats.rate
  end

  def test_junglebeats_reset_voice
    beats = JungleBeats.new
    beats.reset_voice
    assert_equal "Boing", beats.voice
  end

  def test_junglebeats_reset_rate
    beats = JungleBeats.new
    beats.reset_rate
    assert_equal 500, beats.rate
  end

  # Try popping more elements than there
  def test_pop_too_many_elements
    
  end
  # are in the list. Try seeing if an empty
  # list includes anything.
  # Try inserting elements at a position
  # beyond the length of the list.

end
