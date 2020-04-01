FactoryBot.define do
  factory :micropost do
    title { 'Well hello there!' }
    content do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Proin maximus pellentesque lacus, nec aliquam mi auctor id.'
    end
  end
end
