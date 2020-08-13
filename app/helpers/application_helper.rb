module ApplicationHelper
  def years(games)
    html = ''
    games.order(year: "DESC").pluck(:year).uniq.each do |year|
      html += link_to(year, year_games_path(year: year), controller: "games", action: "year", class: "year")
    end
    return raw(html)
  end
end
