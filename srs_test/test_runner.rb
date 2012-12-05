thisFile = File.basename(__FILE__) 
filesToRun = Dir["*.rb"] - [thisFile]
filesToRun.each {|fileFound| print system("ruby", fileFound), "\n" }
