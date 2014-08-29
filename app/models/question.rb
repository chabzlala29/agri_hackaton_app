class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :question, presence: true
  validates :description, presence: true
  validates :tags, presence: true

  acts_as_votable

  scope :top, -> { order(:cached_weighted_average) }
  scope :newest, -> { order(:created_at) }
  scope :unanswered, -> { joins('LEFT JOIN answers ON answers.question_id = questions.id').select("questions.*, count(answers.id) AS cnt").group('questions.id').having('cnt = 0') }

  def q_tags
    tags = self.tags.split(",")
    Tag.find(tags)
  end

  def answer_count
    self.answers.count
  end
end
