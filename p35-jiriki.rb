input = File.read('p35-input.txt')

data=[]
input.each_line{|line|
  #make Row
  line.chomp!
  tmparr = []
  line.each_char{|c|
    if c=='W'
      tmparr.push(true)
    else
      tmparr.push(false)
    end
  }
  data.push(tmparr)
}
p data



#池を消去する
#return newdata
$ikeCount=0
def bangouIke(x,y,data)
  data[y][x]=$ikeCount; ysize_1 = data.size - 1; xsize_1 = data[0].size - 1;
  bangouIke(x-1,y-1,data)  if y>0 && x>0 && data[y-1][x-1]===true
  bangouIke(x,y-1,data)  if y>0  && data[y-1][x]===true
  bangouIke(x+1,y-1,data)  if y>0 && x<xsize_1 && data[y-1][x+1]===true
  bangouIke(x-1,y,data)  if  x>0 && data[y][x-1]===true
  bangouIke(x+1,y,data)  if  x<xsize_1 && data[y][x+1]===true
  bangouIke(x-1,y+1,data)  if y<ysize_1 && x>0 && data[y+1][x-1]===true
  bangouIke(x,y+1,data)  if y<ysize_1 && data[y+1][x]===true
  bangouIke(x+1,y+1,data)  if y<ysize_1 && x<xsize_1 && data[y+1][x+1]===true
  return data
end

# 池を見つけては番号を振っていく
#return [newdata,ike_no_umu]
def mainIke(x,y,data)
 begin
  if data[y][x] === true
    $ikeCount+=1
    newdata = bangouIke(x,y,data)
    return newdata
  else
    return data
  end
 rescue => e
   p e
   puts "x=#{x.to_i}, y=#{y.to_i}\ndata:"
   p data
   raise e  
 end
end

(0...(data.size)).each{|y|
  (0...(data[y].size)).each{|x|
    data = mainIke(x,y,data)
  }
}

data.each{|row|
  row.each{|c|
    if c
      print c
    else
      print '.'
    end 
  }
  print "\n"
}

puts "答え: #{$ikeCount.to_s}"
