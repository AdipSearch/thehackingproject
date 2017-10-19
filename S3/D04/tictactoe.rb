=begin
class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
  attr_accessor :value :casenumber

  
  def initialize
    #TO DO doit régler sa valeur, ainsi que son numéro de case
  end
  
  def to_s
    #TO DO : doit renvoyer la valeur au format string
  end

end
=end
class Board
	include Enumerable
  attr_accessor :board

  def initialize  		
  	@board = Array.new(3) { Array.new(3, " ") }
  end

  def add_piece(coords, piece)
    @board[coords[0]][coords[1]] = piece
  end

  def to_s
	 	puts "   0   1   2 "
	  puts "0  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
	  puts "  ---+---+---"
	  puts "1  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
	  puts "  ---+---+---"
	  puts "2  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
  end

  def victory?
    #TO DO : qui gagne ?
  end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
  #attr_accessor :name :piece :board
  
  def initialize(name = "Player", piece, board)
      @name = name
      @piece = piece
      @board = board
    #TO DO : doit régler son nom, sa valeur, son état de victoire
  end

  def who_s_turn
  	puts "#{@name}'s turn to play :\n\n"
  end

	def ask_for_coordinates
    # Display message asking for coordinates
    puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
    # pull coordinates from command line
    gets.strip.split(",").map(&:to_i)
	end

	def get_coordinates
  	coords = ask_for_coordinates
		@board.add_piece(coords, @piece)
	end
end

class Game
	attr_accessor :game
	
	def initialize
    #TO DO : créé 2 joueurs, créé un board
    @game = Board.new
    @player1 = Player.new("Player 1", "X", @game)
    @player2 = Player.new("Player 2", "O",@game)
    @current_player = @player1
    go
  end

  def go
    # TO DO : lance la partie
    	puts "Player 1 will play the X"
    	puts "Player 2 will play the O"
    	puts "-------------------------"
    	puts "\n"
    	turn
  end

  def turn
  	@current_player.who_s_turn
    
    @game.to_s

    @current_player.get_coordinates

    if @current_player == @player1
        @current_player = @player2
    else
        @current_player = @player1
    end
    turn    
    #@game.to_s
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  end

end

a = Game.new
