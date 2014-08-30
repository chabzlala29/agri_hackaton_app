class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :question, presence: true, uniqueness: true
  validates :description, presence: true
  validates :tags, presence: true

  acts_as_votable

  scope :top, -> { order(:cached_weighted_average) }
  scope :newest, -> { order(:created_at) }
  scope :unanswered, -> { where('id NOT IN (SELECT DISTINCT(question_id) FROM answers)') }

  def q_tags
    tags = self.tags
    Tag.find(tags)
  end

  def answer_count
    self.answers.count
  end
end
