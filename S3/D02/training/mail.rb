require 'gmail'
require 'google_drive'

def send_email_to_line(tabl)
	Gmail.connect(ENV['MY_SPAM_MAIL'],ENV['MY_SPAM_PSSWD']) do |gmail|
		puts gmail.logged_in?
		tabl.each do |row|
			gmail.deliver do
				to row[1]
				subject "Proposez une formation gratuite de code aux citoyens"
				html_part do
					content_type 'text/html; charset=UTF-8'
					body "<p>Bonjour,</p><p>Je m'appelle Guillaume, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquels nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.</p><br>
					<p>Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{row[0]}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{row[0]} !</p><br>
					<p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
			 	end
			end
		sleep(0.5)
		end
	end
end



def go_through_all_the_lines()
	# Authenticate a session with your Service Account
	session = GoogleDrive::Session.from_service_account_key("client_secret.json")

	#Get the spreadsheet by its title
	spreadsheet = session.spreadsheet_by_title("Mairies_du_88")
	# Get the first worksheet
	ws = spreadsheet.worksheets.first
	#send every row to the gmail sender def :-)
	send_email_to_line(ws.rows)
end

go_through_all_the_lines()