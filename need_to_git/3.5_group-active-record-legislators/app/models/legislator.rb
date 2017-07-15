class Legislator < ApplicationRecord
  # Remember to create a migration!
  belongs_to :state
  belongs_to :chamber
  belongs_to :party



  ## Release 1: Display Legislators in Office
  ###################
  ## Definition of scope
  scope :in_office_format, -> { joins(:chamber).select(:title).select(:first_name, :middle_name, :last_name, :name_suffix, :in_office) }
  scope :in_office, -> {in_office_format.where("in_office = 'true'")}
  scope :out_office, -> {in_office_format.where("in_office = 'false'")}

  ### Consolidated Version:
  # scope :in_office, -> { joins(:chamber).select(:title).select(:first_name, :middle_name, :last_name, :name_suffix, :in_office).where("in_office = 'true'") }

  ## Calling Method
  ## Legislator.in_office
  ## Legislator.out_office
  ###################


  ## Release 2: Display Legislators Born Between Two Dates
  ###################
  ## Definition of scope
  scope :bday_format, -> { select(:first_name, :middle_name, :last_name, :name_suffix, :birthday) }
  scope :bday_range, ->(start_date, end_date) {bday_format.where(birthday: start_date..end_date)}

  ## Calling Method
  ## Legislator.bday_range('1951-02-01', '1951-06-01')
  ###################

  ## Notes: Release 2 is working fine.
  ## Next step: Create method to convert input dates and db bday dates into ruby date/time. Might take a while, so moving on to release 3 as this is a lesson about ActiveRecord, not Date/Time.  Will revisit if time permits.
  ###################


  ## Release 3: Combine In-office and Born-between
  ###################
  ## Definition of scope
  ## Combines scopes in Releases 1 & 2, with minor changes.
  scope :in_office_bday_format, -> { joins(:chamber).select(:title).select(:first_name, :middle_name, :last_name, :name_suffix, :in_office, :birthday) }
  scope :in_off, -> {in_office_bday_format.where("in_office = 'true'")}
  scope :in_off_bday_range, ->(start_date, end_date) {in_off.where(birthday: start_date..end_date)}

  ## Calling Method
  ## Legislator.in_off_bday_range('1951-02-01', '1951-06-01')
  ###################


  ###################
  # def current_term
  #   Legislator.pluck(:term_end
  # end

end
