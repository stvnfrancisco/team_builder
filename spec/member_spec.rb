require('rspec')
require('member')

describe(Member) do
  before() do
    Member.clear()
  end

  describe("#name") do
    it("returns the name of a member") do
      test_member = Member.new("Mike Millions")
      test_member.save()
      expect(test_member.name()).to(eq("Mike Millions"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Member.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a member to the array of saved members") do
      test_member = Member.new("Mike Millions")
      test_member.save()
      expect(Member.all()).to(eq([test_member]))
    end
  end
  #     expect(Member.all()).to(eq([]))
  #   end
  # end


#   describe("#id") do
#     it("returns the id of the member") do
#       test_member = Member.new("Mike Millions")
#       test_member.save()
#       expect(test_member.id()).to(eq(1))
#     end
#   end
#
#   describe(".find") do
#     it("returns a member by its id number") do
#       test_member = Member.new("Mike Millions")
#       test_member.save()
#       test_member2 = Member.new("Jim Jimmy")
#       test_member2.save()
#       expect(Member.find(test_member.id())).to(eq(test_member))
#     end
#   end
end
