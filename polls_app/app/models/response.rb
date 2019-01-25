# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
    validates_uniqueness_of :user_id, :scope => [:answer_choice_id]
    validate :respondent_already_answered?
   
    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_one :question,
        through: :answer_choice,
        source: :question

    has_one :poll,
        through: :question,
        source: :poll

    has_one :author,
        through: :poll,
        source: :author

    def sibling_responses
        siblings = self.question.responses.where.not(responses: {id: self.id})
    end

    private

    def respondent_already_answered?
        if sibling_responses.pluck(:user_id).include?(self.user_id)
            errors[:respondent] << 'already responded'
        end
    end

    def respondent_is_author?
        if self.author == self.user_id
            errors[:respondent] << 'is author'
        end
    end
end
