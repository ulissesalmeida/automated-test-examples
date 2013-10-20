require 'spec_helper'

describe BadgeAssignor do
  describe '#assign' do
    it 'adds a badge to user badges collection' do
      user = double('user', badges: [1, 2], twitter_enabled?: false)
      badge = 3
      assignor = BadgeAssignor.new

      assignor.user = user
      assignor.badge = badge

      assignor.assign

      expect(user.badges).to eq [1, 2, 3]
    end

    it 'sends a tweet when user allow' do
      user = double('user', badges: [],
                            twitter_account: 'username',
                            twitter_enabled?: true)

      badge = double('badge', message: 'a message')
      assignor = BadgeAssignor.new

      assignor.user = user
      assignor.badge = badge

      expect(Twitter).to(
        receive(:tweet).with('username', 'a message')
      )

      assignor.assign
    end
  end
end
