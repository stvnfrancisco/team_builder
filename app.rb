require('sinatra')
require('sinatra/reloader')
require('./lib/member')
require('./lib/team')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

get('/teams/new') do
  erb(:teams_form)
end

get('/teams') do
  @teams = Team.all()
  erb(:teams)
end

post('/teams') do
  name = params.fetch('name')
  Team.new(name).save()
  @teams = Team.all()
  erb(:success)
end

get('/members/:id') do
  @member = Member.find(params.fetch("id"))
  erb(:member)
end

get('/teams/:id') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:team)
end

get('/teams/:id/members/new') do
    @team = Team.find(params.fetch('id').to_i())
    erb(:team_members_form)
end

get('/members') do
  @members = Member.all()
  erb(:members)
end

get('/member/new') do
  erb(:members_form)
end

post('/members') do
  name = params.fetch('name')

  @member = Member.new(name)
  @member.save()
  @team = Team.find(params.fetch('team_id').to_i())
  @team.add_member(@member)
  erb(:success)
 end
