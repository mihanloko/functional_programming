import Lib(intersect)
main :: IO ()
main = do
  print "[]"
  print (intersect [])
  print [[1,2,3]]
  print (intersect [[1,2,3]])
  print [[1,2,3], [4,5,6]]
  print (intersect [[1,2,3], [4,5,6]])
  print [[1,2,3], [2,3,4]]
  print (intersect [[1,2,3], [2,3,4]])
  print [[1,2,3], [2,3,4], [3..5]]
  print (intersect [[1,2,3], [2,3,4], [3..5]])
  print [[1,2,3], [2,3,4], [3..5], [3,7,2]]
  print (intersect [[1,2,3], [2,3,4], [3..5], [3,7,2]])
  print [[1,2,3], [2,3,4], [3..5], [3,7,2], [9]]
  print (intersect [[1,2,3], [2,3,4], [3..5], [3,7,2], [9]])
  print [[1,2,3], [2,3,4], [3..5], [3,7,2], []]
  print (intersect [[1,2,3], [2,3,4], [3..5], [3,7,2], []])
