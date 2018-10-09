class Game
    attr_accessor :answer
    @@players = []

    def initialize()
        @answer = 0
        game_loop
    end

    def game_loop

    player1 = @@players[0]
    player2 = @@players[1]
        if @@players.length == 1
            puts "#{@@players[0].name} is the winner of the game with a score of #{@@players[0].score}/3"
            puts "-----------GAME OVER---------"
            puts "Goodbye!"
            return
        end
        

       @@players.each do |player|
        if player.score == 1
            @@players.delete(player)
        end

        self.ask_and_answer_question(player)
        puts "Current scores: #{player1.name}: #{player1.score}/3 and #{player2.name}:#{player2.score}/3"
        
       end
       game_loop
    end


    def ask_and_answer_question(player)
        num1 = rand(20)
        num2 = rand(20)
        answer = num1 + num2
        puts "#{player.name}: What does #{num1} plus #{num2} equal?"
        player_answer = gets.chomp.to_i
            if player_answer == answer
                puts "you're correct"
            end
            if player_answer != answer
                player.lose_life
                return puts "you're wrong"
            end
        puts
    end  
    
    def self.add_player(player)
        @@players.push(player)
    end
end