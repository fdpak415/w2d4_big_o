
#3n! => n!

#phase 1
def anagram?(word1, word2)
  anagrams = []
  anagrams_array = word1.split("").permutation(5).to_a     #factorial

  anagrams = anagrams_array.map do |anagram| #factorial
    anagram.join("")
  end

  anagrams.include?(word2) #factorial
end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true
# p anagram?("aelijseflisljsfljsflljasljeflasjlhasehefjsef", "aliejfesijsefisf")

#phase 2
# each
#     delete_at ((would be n))  if  (this also n, but is element that makes it quadratic)
#     4n^2
#
# below solution:
# .each (n)
#   n
# 2n^2


def second_anagram?(word1, word2)
  temp_word1 = word1.split("")
  temp_word2 = word2.split("")

  word1.split("").each do |el|
    index = nil
    index = temp_word2.find_index(el)


    if index != nil
      temp_word2.delete_at(index)
    end
  end

  word2.split("").each do |el|
    index = nil
    index = temp_word1.find_index(el)


    if index != nil
      temp_word1.delete_at(index)
    end
  end


  return true if temp_word1.empty? && temp_word2.empty?
  false
end

 # p second_anagram?("gizmo", "sally")    #=> false
 # p second_anagram?("elvis", "lives")    #=> true
 # p second_anagram?("aelijsefliafaljsfljsljsflsesfafafafafjsfllaelijsefliafaljsfljsljsflsesfafafafafjsflljasljasl", "aelijaelijsefliafaljsfljsljsflsesfafafafafjsflljaslseflafafsfsfeljsfeefsfesfsfsefisljsfljs")


# phase 3
# uses quick sort, which is n^2 worst case
def third_anagram?(word1, word2)
  return true if word1.split("").sort == word2.split("").sort
  false
end
#
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true
# p third_anagram?("aelijsefliafaljsfljsljsflsesfafafafafjsfllaelijsefliafaljsfljsljsflsesfafafafafjsflljasljasl", "aelijaelijsefliafaljsfljsljsflsesfafafafafjsflljaslseflafafsfsfeljsfeefsfesfsfsefisljsfljs")
#

#phase 4
#4n => n (BIG O)
def fourth_anagram?(word1, word2)
  hash1 = Hash.new { 0 }
  hash2 = Hash.new { 0 }

  word1.split("").each do |l|   #2n
    hash1[l] += 1
  end

  word2.split("").each do |l|    #2n
    hash2[l] += 1
  end

  return true if hash1 == hash2   #2n
  false
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true
# p fourth_anagram?("aelijsefliafaljsfljsljsflsesfafafafafjsfllaelijsefliafaljsfljsljsflsesfafafafafjsflljasljasl", "aelijaelijsefliafaljsfljsljsflsesfafafafafjsflljaslseflafafsfsfeljsfeefsfesfsfsefisljsfljs")

#better space complexity
def fifth_anagram?(word1, word2)
  hash1 = Hash.new { 0 }

  word1.split("").each do |l|   #2n
    hash1[l] += 1
  end

  word2.split("").each do |l|    #2n
    hash1[l] -= 1
  end

  return true if hash1.all? {|k,v| v == 0} #n
  false
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
p fifth_anagram?("aelijseflisljsfljsflljasl", "aelijseflisljsfljs")
