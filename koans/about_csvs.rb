require File.expand_path(File.dirname(__FILE__) + '/edgecase')
require 'fastercsv'

# FasterCSV has a lot of extra functionality but these will get you
# started with turning the csv into something that you can manipulate
# with ruby.
class AboutCsvs < EdgeCase::Koan
  def test_reading_a_csv_as_an_array_of_arrays
    csv = FasterCSV.readlines("example_csv.csv")

    assert_equal __, csv[0] # this should be the header
    assert_equal __, csv[1] # this should be the first line
    assert_equal __, csv[6] # this should be the sixth line
  end

  def test_reading_a_csv_one_line_at_a_time
    csv_as_array = []
    FasterCSV.foreach("example_csv.csv") do |row|
      csv_as_array << row
    end

    assert_equal __, csv[0] # this should be the header
    assert_equal __, csv[1] # this should be the first line
    assert_equal __, csv[6] # this should be the sixth line
  end

  # remember that arrays are indexed starting from 0
  def test_getting_from_a_line
    csv = FasterCSV.readlines("example_csv.csv")

    csv_first_column = csv[0..10].map do |csv_line|
      csv_line[0]
    end

    assert_equal __, csv_first_column

    assert_equal __, csv[25][5] # 25th line 6th column

    assert_equal __, csv[30][2] # __th line __th column

    assert_equal __, csv[4][3] # __th line __th column

    assert_equal __, csv[18][10] # __th line __th column
  end

  def test_creating_a_csv_line_as_a_string
    header = ["_unit_id", "channel", "response", "confidence"]
    assert_equal __, FasterCSV.generate_line(header)
  end

  def test_creating_a_csv_line_as_a_string_2
    values = ["234", "amt", "Terrific", "0.9344"]
    assert_equal __, FasterCSV.generate_line(header)
  end

  def test_creating_a_csv_line_as_a_string_2
    values = ["8438", "gambit", "Terrific, Outstanding, Work", "0.8336"]
    assert_equal __, FasterCSV.generate_line(header)
  end

  def test_parsing_a_csvline_from_a_string
    assert_equal __, "3423,person,good,0.9336".to_csv
  end

  def test_writing_a_csv_to_a_file
    header = ["_unit_id", "channel", "response", "confidence"]
    first_line = ["234", "amt", "Terrific", "0.9344"]
    second_line = ["8438", "gambit", "Terrific, Outstanding, Work", "0.8336"]

    FasterCSV.open("test_write_file.csv", "w") do |csv_file|
      csv_file << FasterCSV.generate_line(header)
      csv_file << FasterCSV.generate_line(first_line)
      csv_file << FasterCSV.generate_line(second_line)
    end

    csv = FasterCSV.readlines("test_write_file.csv")
    assert_equal __, csv
  end

  def test_writing_a_csv_to_a_file_with_an_array_of_arrays
    csv_array = [
      ["_unit_id", "channel", "response", "confidence"],
      ["234", "amt", "Terrific", "0.9344"],
      ["8438", "gambit", "Terrific, Outstanding, Work", "0.8336"]
    ]

    FasterCSV.open("test_write_file.csv", "w") do |csv_file|
      csv_array.each do |csv_line_as_array|
        csv_file << FasterCSV.generate_line(csv_line_as_array)
      end
    end

    csv = FasterCSV.readlines("test_write_file.csv")
    assert_equal __, csv
  end
end
