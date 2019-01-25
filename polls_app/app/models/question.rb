# == Schema Information
#
# Table name: questions
#
#  id            :bigint(8)        not null, primary key
#  question_text :text             not null
#  poll_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Question < ApplicationRecord
    validates :question_text, presence: true

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice

    has_many :responses,
        through: :answer_choices,
        source: :responses
    

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll
end
