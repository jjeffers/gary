defmodule Gary.OutdoorEncounter do

  def next_forest_marsh_encounter(roll) do
    %{ 
      title: "forest or marsh",
      value: case roll do
        1 -> "1 period/1 period/1 period"
        2 -> "1 period/1 period/2 periods"
        3 -> "2 periods/2 period/3 periods"
        4 -> "2 periods/3 periods/4 periods"
        5 -> "3 periods/3 period/5 periods"
        6 -> "4 periods/4 period/1 day 1 period"
        7 -> "4 periods/5 periods/1 day 2 periods"
        8 -> "5 periods/1 day/1 day 4 periods"
        9 -> "1 day/1 day 1 period/1 day 5 periods"
        10 -> "1 day 1 period/1 day 2 periods/2 days 1 period"
        11 -> "1 day 2 periods/1 day 3 periods/2 days 3 periods"
        12 -> "1 day 3 periods/1 day 4 periods/2 days 5 periods"
        13 -> "1 day 4 periods/2 days/3 days 2 periods"
        14 -> "1 day 5 periods/2 days 1 period/3 days 4 periods"
        15 -> "2 days 1 period/2 days 3 periods/4 days 2 periods"
        16 -> "2 days 3 periods/3 days/5 days"
        17 -> "2 days 5 periods/3 days 3 periods/5 days 4 periods"
        18 -> "3 days 2 periods/4 days/6 days 5 periods"
        19 -> "4 days 1 period/5 days/8 days 3 periods"
        20 -> "6 days/7 days 1 period/12 days"
      end,
      short: "false"
    }
  end

  def next_scrub_encounter(roll) do
    %{ 
      title: "scrub",
      value: case roll do
        1 -> "1 period/1 period/1 period"
        2 -> "2 periods/2 periods/3 periods"
        3 -> "2 periods/3 period/4 periods"
        4 -> "3 periods/4 periods/1 day"
        5 -> "4 periods/5 period/1 day 2 periods"
        6 -> "5 periods/1 day/1 day 2 periods"
        7 -> "1 day/1 day 1 period/2 days"
        8 -> "1 day 1 period/1 day 3 periods/2 days 2 periods"
        9 -> "1 day 3 periods/1 day 4 periods/2 days 5 periods"
        10 -> "1 day 4 periods/2 days/3 days 2 periods"
        11 -> "1 day 5 periods/2 days 2 periods/3 days 4 periods"
        12 -> "2 days 1 period/2 days 3 periods/4 days 2 periods"
        13 -> "2 days 3 periods/3 days/4 days 5 periods"
        14 -> "2 days 3 periods/3 days 2 periods/5 days 4 periods"
        15 -> "3 days 1 period/3 days 5 periods/6 days 3 periods"
        16 -> "3 days 4 periods/4 days 3 periods/7 days 2 periods"
        17 -> "4 days 2 periods/5 days 1 period/8 days 4 periods"
        18 -> "4 days 1 period/6 days 1 period/10 days 2 periods"
        19 -> "6 days 2 periods/7 days 4 periods/12 days 5 periods"
        20 -> "9 days/10 days 5 periods/18 days 1 period"
      end,
      short: "false"
    }
  end

  def next_desert_hills_rough_plains_encounter(roll) do
    %{ 
      title: "desert, hills, rough, or plains",
      value: case roll do
        1 -> "1 period/1 period/1 period"
        2 -> "2 periods/2 periods/4 periods"
        3 -> "4 periods/1 period/1 day"
        4 -> "4 periods/5 periods/1 day 2 periods"
        5 -> "5 periods/1 day/1 day 5 periods"
        6 -> "1 day 1 period/1 day 2 periods/2 days 1 period"
        7 -> "1 day 2 periods/1 day 4 periods/2 days 4 periods"
        8 -> "1 day 4 period1/2 days/3 days 1 period"
        9 -> "1 day 5 periods/2 days 2 periods/3 days 4 periods"
        10 -> "2 days 1 period/2 days 4 periods/4 days 2 periods"
        11 -> "2 day 3 periods/3 days/5 days"
        12 -> "2 days 5 periods/3 days 3 periods/5 days 4 periods"
        13 -> "3 days 2 periods/4 days/6 days 3 periods"
        14 -> "3 days 4 periods/4 days 3 periods/7 days 3 periods"
        15 -> "4 days 2 periods/5 days 1 period/8 days 3 periods"
        16 -> "5 days/6 days/9 days 5 periods"
        17 -> "5 days 4 periods/6 days 5 periods/11 days 3 periods"
        18 -> "6 days 5 period/8 days 1 period/13 days 5 periods"
        19 -> "8 days 3 periods/10 days 1 period/17 days 1 period"
        20 -> "12 days/14 days 3 periods/24 days 2 periods"
      end,
      short: "false"
    }
  end

  def next_mountains_encounter(roll) do
    %{ 
      title: "mountains",
      value: case roll do
        1 -> "1 period/1 period/2 periods"
        2 -> "3 periods/3 periods/5 periods"
        3 -> "4 periods/5 periods/1 day 2 periods"
        4 -> "1 day/1 day 1 period/2 days"
        5 -> "1 day 2 periods/1 day 4 periods/2 days 4 periods"
        6 -> "1 day 4 periods/2 days/3 days 2 periods"
        7 -> "2 days/2 days 2 periods/2 days"
        8 -> "2 days 2 periods/2 days 5 periods/4 days 4 periods"
        9 -> "2 days 5 periods/3 days 2 periods/5 days 3 periods"
        10 -> "3 days 2 periods/3 days 5 periods/6 days 3 periods"
        11 -> "3 day 4 periods/4 days 3 periods/7 days 3 periods"
        12 -> "4 days 2 periods/5 days 1 period/8 days 3 periods"
        13 -> "4 days 5 periods/5 days 5 periods/9 days 5 periods"
        14 -> "5 days 4 periods/6 days 4 periods/11 days 1 period"
        15 -> "6 days 3 periods/7 days 2 periods/12 days 5 periods"
        16 -> "7 days 2 periods/8 days 5 periods/14 days 5 periods"
        17 -> "8 days 4 periods/10 days 2 periods/17 days 2 periods"
        18 -> "10 days 2 period/12 days 2 periods/20 days 4 periods"
        19 -> "12 days 5 periods/15 days 2 periods/25 days 5 periods"
        20 -> "18 days 1 period/21 days 5 periods/36 days 4 periods"
      end,
      short: "false"
    }
  end

  def generate_temporate_sub_tropical_plain_encounter do
    %{ 
      title: "Temporate or subtropical plain",
      value: case elem(Dicer.roll("1d100"), 2) do
        _ -> "ankheg"
      end,
      short: "false"
    }
  end

  def generate_temperate_sub_tropical_encounter do

    [generate_temporate_sub_tropical_plain_encounter]
  end

  def generate_inhabited_nonpatrol_encounter do
    generate_temperate_sub_tropical_encounter
  end

  def generate_inhabited_encounter do
    case elem(Dicer.roll("1d4"),2) do
      1 -> [%{ 
              title: "inhabited",
              value: "patrol",
              short: "false"
            }]
      _ -> generate_inhabited_nonpatrol_encounter
    end
  end

  def generate_encounter_fields do
    generate_inhabited_encounter
  end

end