#---------------------------------#
# dynamically build the classpath #
#---------------------------------#
THE_CLASSPATH=
for i in `ls lib/*.jar`
do
  THE_CLASSPATH=${THE_CLASSPATH}:${i}
done


java -Xmx14G -classpath ".:${THE_CLASSPATH}" sentimentngramserver.SentimentNGramServer 2>  outErr.txt > outLog.txt

