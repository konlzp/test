palindrome <- function(filename = "/usr/share/dict/words", letter = "all"){
  fileLines = readLines(filename)
  palindromeList = list()
  for(line in fileLines) {
    alnumLine = tolower(gsub("[^[:alnum:]]", "", line))
    if((letter == 'all' | strsplit(alnumLine, "")[[1]][1] == letter) & identical(alnumLine, paste(rev(strsplit(alnumLine, "")[[1]]), collapse = ""))){
      palindromeList = c(palindromeList, line)
    }
  }
  for(line in palindromeList){
    print(line)
  }
}

anagram <- function(filename = "/usr/share/dict/words", target = FALSE){
  fileLines = readLines(filename)
  anaList = list()
  maxVector = c()
  maxCount = 0
  if(target == FALSE){
    sortedAnaWord = ""
  }
  else {
    sortedAnaWord = paste(sort(strsplit(target, "")[[1]]), collapse = "")
  }
  for(line in fileLines) {
    alnumLine = strsplit(gsub("[^[:alnum:]]", "", line), "")[[1]]
    sortedAlnumLine = paste(sort(alnumLine), collapse = "")
    storedLine = anaList[[sortedAlnumLine]]
    alnumLine = paste(alnumLine, collapse = "")
    
    if((sortedAnaWord == "") | (sortedAlnumLine == sortedAnaWord)) {
      if(is.null(storedLine)) {
        anaList[[sortedAlnumLine]] = alnumLine
        count = 1
      }
      else {
        storedLine = c(storedLine, alnumLine)
        anaList[[sortedAlnumLine]] = storedLine
        count = length(storedLine)
      }
      if(maxCount < count) {
        maxCount = count
        maxVector = storedLine
      }
    }
  }
  print(maxVector)
}


