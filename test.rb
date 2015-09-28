require_relative 'app/models/legislator'

# state = "CA"
# legislators_from_ca = Legislator.where("state = ?", state)
# if legislators_from_ca.pluck(:title).include?("Sen")
#   puts "Senators from #{state}:"
#   legislators_from_ca.where("title = ?", "Sen").order(:lastname).find_each do |senator|
#     puts "#{senator.firstname} #{senator.lastname} (#{senator.party})"
#   end
# end
# puts ""
# puts "Representatives from #{state}:"
# legislators_from_ca.where("title = ?", "Rep").order(:lastname).find_each do |rep|
#   puts "#{rep.firstname} #{rep.lastname} (#{rep.party})"
# end

# gender = "M"
# senators = Legislator.where("in_office = ?", 1).where("title = ?", "Sen")
# gender_senators = senators.where("gender = ?", gender)
# gender_senators_percentage = ((gender_senators.count)/(senators.count).to_f).round(3)*100
# puts "#{gender} senators: #{gender_senators.count} (#{gender_senators_percentage}%)"

# reps = Legislator.where("in_office = ?", 1).where("title = ?", "Rep")
# gender_reps = reps.where("gender = ?", gender)
# gender_reps_percentage = ((gender_reps.count)/(reps.count.to_f)).round(3)*100
# puts "#{gender} representatives: #{gender_reps.count} (#{gender_reps_percentage}%)"

active_legislators = Legislator.where("in_office = ?", 1)
counts = active_legislators.group(:state).order('count_id DESC').count('id')
counts.each do |state, legislator_count|
  state_rep_count = active_legislators.where("state = ?", state).where("title = ?", "Rep").count
  state_senator_count = active_legislators.where("state = ?", state).where("title = ?", "Sen").count
  puts "#{state}: #{state_senator_count} senators, #{state_rep_count} representatives"
end