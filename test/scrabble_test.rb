gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_non_letter_characters
    assert_equal 0, Scrabble.new.score("!.* ")
  end

  def test_it_can_score_non_strings
    assert_equal 0, Scrabble.new.score(52)
    assert_equal 0, Scrabble.new.score(Hash.new)
  end

  def test_it_can_score_downcased_words
    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 24, Scrabble.new.score("xylophone")
  end

  def test_it_can_score_upcased_words
    assert_equal 7, Scrabble.new.score("TURING")
    assert_equal 24, Scrabble.new.score("XYLOPHONE")
  end

  def test_it_can_score_mixed_case_words
    assert_equal 8, Scrabble.new.score("hELlO")
    assert_equal 24, Scrabble.new.score("xYLopHoNe")
  end
end
