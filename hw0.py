def palindrome(filename = "/usr/share/dict/words", letter = "all"):
   # fileNameSplit = filename.split('/')
    wordList = []
    inFile = open(filename, 'r')
    for line in inFile:
        alnumLine = (''.join(ch for ch in line if ch.isalnum())).lower()
        if letter == 'all' or alnumLine.startswith(letter):
            line = line.replace("\n", "")
            if alnumLine == alnumLine[:: -1]:
                wordList.append(line)
                print(line)
    return wordList    

def anagram(filename = "/usr/share/dict/words", target = False):
    inFile = open(filename, 'r')
    anaDict = {}
    if target == False:
        sortedAnaWord = ''
    else:
        sortedAnaWord = ''.join(sorted(target))
    for line in inFile:
        sortedLine = ''.join(sorted(line.lower()))
        sortedLine = ''.join(ch for ch in sortedLine if ch.isalnum());
        wordList = anaDict.get(sortedLine)
        if (sortedAnaWord == '') | (sortedLine == sortedAnaWord):
            if wordList is not None:
                wordList.append(line.strip())
                anaDict[sortedLine] = wordList;
            else :
                anaDict[sortedLine] = [line.strip()]
    maxCount = 0;
    for lineList in anaDict:
        if anaDict[lineList] is None:
            currentLength = 0;
        else:
            currentLength = len(anaDict[lineList])
        if maxCount < currentLength :
            maxCount = currentLength
            maxLine = [anaDict[lineList]]
        elif maxCount == currentLength :
            maxLine.append(anaDict[lineList])
    maxCount = 0;
    for line in maxLine[0]:
      print(line)
