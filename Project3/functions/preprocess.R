rm(list=ls())
library(tidyverse)
library(janitor)
library(here)
library(fs)

#Data Cleaning
working_dir <- here::here("data", "2024", "2024-05-14")

url <- "https://bit.ly/gacttCSV"

raw <- readr::read_csv(url)

# Grab the raw questions for the dictionary.
raw |> 
  colnames() |> 
  cat(sep = "\n")

coffee_survey <- raw |> 
  janitor::clean_names() |> 
  # Get rid of one-hot encoding; users can do that if they'd like. Also,
  # "flavorings" columns are empty.
  dplyr::select(
    submission_id,
    age = what_is_your_age,
    cups = how_many_cups_of_coffee_do_you_typically_drink_per_day,
    where_drink = where_do_you_typically_drink_coffee,
    brew = how_do_you_brew_coffee_at_home,
    brew_other = how_else_do_you_brew_coffee_at_home,
    purchase = on_the_go_where_do_you_typically_purchase_coffee,
    purchase_other = where_else_do_you_purchase_coffee,
    favorite = what_is_your_favorite_coffee_drink,
    favorite_specify = please_specify_what_your_favorite_coffee_drink_is,
    additions = do_you_usually_add_anything_to_your_coffee,
    additions_other = what_else_do_you_add_to_your_coffee,
    dairy = what_kind_of_dairy_do_you_add,
    sweetener = what_kind_of_sugar_or_sweetener_do_you_add,
    style = before_todays_tasting_which_of_the_following_best_described_what_kind_of_coffee_you_like,
    strength = how_strong_do_you_like_your_coffee,
    roast_level = what_roast_level_of_coffee_do_you_prefer,
    caffeine = how_much_caffeine_do_you_like_in_your_coffee,
    expertise = lastly_how_would_you_rate_your_own_coffee_expertise,
    starts_with("coffee"),
    prefer_abc = between_coffee_a_coffee_b_and_coffee_c_which_did_you_prefer,
    prefer_ad = between_coffee_a_and_coffee_d_which_did_you_prefer,
    prefer_overall = lastly_what_was_your_favorite_overall_coffee,
    wfh = do_you_work_from_home_or_in_person,
    total_spend = in_total_much_money_do_you_typically_spend_on_coffee_in_a_month,
    why_drink = why_do_you_drink_coffee,
    why_drink_other = other_reason_for_drinking_coffee,
    taste = do_you_like_the_taste_of_coffee,
    know_source = do_you_know_where_your_coffee_comes_from,
    most_paid = what_is_the_most_youve_ever_paid_for_a_cup_of_coffee,
    most_willing = what_is_the_most_youd_ever_be_willing_to_pay_for_a_cup_of_coffee,
    value_cafe = do_you_feel_like_you_re_getting_good_value_for_your_money_when_you_buy_coffee_at_a_cafe,
    spent_equipment = approximately_how_much_have_you_spent_on_coffee_equipment_in_the_past_5_years,
    value_equipment = do_you_feel_like_you_re_getting_good_value_for_your_money_with_regards_to_your_coffee_equipment,
    gender,
    gender_specify = gender_please_specify,
    education_level,
    ethnicity_race,
    ethnicity_race_specify = ethnicity_race_please_specify,
    employment_status,
    number_children = number_of_children,
    political_affiliation
  )