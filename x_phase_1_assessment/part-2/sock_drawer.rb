class SockDrawer
  attr_reader :socks, :matcher

  def initialize(args = {})
    @socks = args.fetch(:socks) { Array.new }
    @matcher = args.fetch(:matcher)
  end

  def supply_match_for(sock)
    
    # for i in 0..@socks
    #   puts "\n\n>>>>> #{@socks[i]}, #{sock} >>>>>>>>>>\n\n"
    #   # @matcher.match?(@socks[i], sock)
    # end
    # if @socks[0] == sock
    #   puts "match"
    # else
    #   puts "no"
    # end

    # if not @matcher.match?(@socks[0], sock)


  end



end
