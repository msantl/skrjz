  #!/usr/bin/env python

import sys

def hyp():
  """docstring for hyp"""
  ret = list();
  for i in range(0, 10, 1):
    ret.append( i / 10. );
  return ret;

def main():
  """main funkcija"""
  
  FILE = open( "ulaz.txt", "r" );
  
  HD = hyp();
  sys.stdout.write( "Hyp" );
  for i in HD:
    sys.stdout.write( "#Q%d" % (i * 100)  );
  print ("");  

  cnt = 0;
  while 1:
    cnt += 1;
    ulaz = FILE.readline().strip();
    if len(ulaz) == 0:
      break;
  
    num = sorted( map( float, ulaz.split() ) );

    sys.stdout.write( "%.3d" % (cnt) );

    for i in HD:
      sys.stdout.write( "#%.2lf" % num[ int( i * len(num) ) ] );
    

    print ("");
    

  FILE.close();

if __name__ == '__main__':
  main()                 
