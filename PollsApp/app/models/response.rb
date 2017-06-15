class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
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



    def sibling_responses
      self.question.responses.where.not(id: self.id)
    end
    private

    def respondent_already_answered?
      sibling_responses.all do |response|
        response.user_id != self.user_id
        # if response.user_id == self.user_id
        #   errormesage
      end
    end


end
