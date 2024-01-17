# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  #broadcasts_to :room
  broadcasts_to :room, inserts_by: :prepend
end
