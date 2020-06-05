n = STDIN.gets.strip.to_i
arr = STDIN.gets.strip.split(' ').map{|a| a.to_i}
k = STDIN.gets.strip.to_i

def dfs(i,sum,n,arr,k,answer)
  return sum==k if (i==n)
  if (dfs(i+1, sum,n,arr,k,answer))
    return true 
  end
  if (dfs(i+1, (sum+arr[i]), n,arr,k,answer))
    answer.push(i)
    return true 
  end
  return false
end

answer=[]
if dfs(0,0,n,arr,k,answer)
  ansarr = answer.map{|index| arr[index] }
  puts 'Yes'+"(#{k.to_s}=#{ansarr.join('+')})"
else
  puts 'No'
end

