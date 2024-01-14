# frozen_string_literal: true

class AddAuthorToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :author, :string
  end
end
