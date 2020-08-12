module RegisterGameSupport
 def register_game
  click_on "Register Game"
  fill_in "Title",	with: "aaaaa"
  fill_in "Series",	with: "aaaaa"
  select "2020", from: "Year"
  select "任天堂", from: "Maker"
  select "3DS", from: "Hard" 
  expect{
    find('input[class="submit-button"]').click
  }.to change { Game.count }.by(1)
 end
end