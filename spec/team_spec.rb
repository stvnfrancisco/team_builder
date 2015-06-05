require('rspec')
require('team')
#require('member')

describe(Team) do
  describe('#name') do
    it("returns the name of a team") do
      test_team = Team.new("team one")
      expect(test_team.name()).to(eq("team one"))
    end
  end
end
