module ShowtimeHelper
 def format_time(timestamp)
  	time = timestamp.strftime("%Y-%m-%d %I:%M%P")
	time1 = Time.parse(time).to_i
	
	time2 = Time.new
	time2 = time2.strftime("%Y-%m-%d %I:%M%P")
	time2 = Time.parse(time2).to_i
	totaltime = time2-time1

	# get years (60*60*24*365=31536000)
	# get months(60*60*24*30=2592000)
	# get weeks (60*60*24*7=604800)
	# get days (60*60*24=86400)
	
	if totaltime >  31536000
		years = totaltime/31536000
		timeExpression = years.to_s + ' years ago'
	elsif totaltime >2592000
		months = totaltime/2592000
		timeExpression = months.to_s + ' months ago'
	elsif totaltime > 604800
		weeks = totaltime/604800
		if weeks == 1
			timeExpression = '1 week ago'
		else
			timeExpression = weeks.to_s + ' weeks ago'
		end
	elsif totaltime > 86400
		days = totaltime/86400
		timeExpression = days.to_s + ' days ago'
	elsif totaltime > 3600
		hours = totaltime/3600
		timeExpression = hours.to_s + ' days ago'
	elsif totaltime > 60
		minutes = totaltime/60
		timeExpression = minutes.to_s + ' minutes ago'
	else
		seconds = totaltime
		timeExpression = seconds.to_s + ' seconds ago'	
    end
	return timeExpression
  end
end