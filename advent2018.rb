
# I just wanted to write ugly code

# 1-1
arr.reduce{|a,b| a.to_i+b.to_i}

# 1-2
# limit is there for my heart. increase if neccessary
memo=Set.new([prev=0]);lambda{|input,limit|;loop{limit-=1;(limit>0) or break;input.each{|e|prev+=e.to_i;memo.include?(prev) and return(prev) or memo.add(prev)}}}.call(arr, 1000)

# 2-1
wanted={2=>0,3=>0};arr.each{|str|counter={};str.each_char{|e|counter[e]||=0;counter[e]+=1};counter.select{|_,v|v==2||v==3}.values.uniq.each{|v|wanted[v]+=1}};wanted.values.reduce(:*)

# 2-2
# slow but it's only 250 lines
lambda{arr.each_with_index{|s1,i| arr.each_with_index{|s2,j| (i>=j and next) or (d=s1.each_char.with_index.select{|c,k|c==s2[k]}; d.length==s1.length-1 and return(d.map(&:first).join))}}}.call

# 3-1
# man so desperate
lines=[
  '#1 @ 1,3: 4x4',
  '#2 @ 3,1: 4x4',
  '#3 @ 5,5: 2x2',
]
tot=0
occ={}
lines.each do |line|
  pt,sz=line.split('@ ').last.sub('x',',').split(': ').map{|e|e.split(',').map(&:to_i)}
  tot+=sz.reduce(&:*)
  x,y=pt
  dy=0
  loop{dx=0;loop{coo=[x+dx,y+dy];occ[coo]||=0;occ[coo]+=1;dx+=1;dx<sz[0] or break};dy+=1;dy<sz[1] or break}
end and 1
tot-occ.size-occ.select{|_,v|v>1}.values.map{|e|e-2}.reduce(:+)

# 3-2
lines=[
  '#1 @ 1,3: 4x4',
  '#2 @ 3,1: 4x4',
  '#3 @ 5,5: 2x2',
]
occ={}
all=Set.new
lines.each do |line|
  cl=line.split(' @ ').first.split('#').last
  all.add(cl)
  pt,sz=line.split('@ ').last.sub('x',',').split(': ').map{|e|e.split(',').map(&:to_i)}
  x,y=pt
  dy=0
  loop{dx=0;loop{coo=[x+dx,y+dy];occ[coo]||=Set.new;occ[coo].add(cl);dx+=1;dx<sz[0] or break};dy+=1;dy<sz[1] or break}
end and 1
all-occ.values.select{|v|v.size>1}.reduce(&:merge)
