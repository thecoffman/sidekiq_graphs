require './test_operation'
require './redis_graph'
require './graph'
require './extensions/string'


puts Time.now.to_i
g = Graph.new

n1 = g.create_node( 'PrintNode', 0 )
(1..ARGV[0].to_i).each do |node_num|
  n2 = g.create_node( 'PrintNode', node_num )
  g.link( n1, n2 )
  n1 = n2
end
n2 = g.create_node( 'PrintNode', 'd' )
g.link( n1, n2 )
RedisGraph.store(g)
